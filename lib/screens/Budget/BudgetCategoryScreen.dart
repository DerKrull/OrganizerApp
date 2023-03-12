import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';
import 'package:organizer_app/screens/BudgetScreen.dart';

import '../../controller/DropDownCategoryController.dart';
import '../../controller/MonthController.dart';
import '../../core/app_export.dart';
import '../../core/model/Expenditure.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomMonthPicker.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import 'AddExpenditureScreen.dart';
import 'EditCategoryScreen.dart';
import 'EditExpenditureScreen.dart';

class BudgetCategoryScreen extends StatelessWidget {
  BudgetCategoryScreen({Key? key}) : super(key: key);

  final MonthController monthController = Get.find();
  final DropDownCategoryController dropDownController = Get.find();
  final format = DateFormat("MMMM", "de_DE");

  Stream<List<Expenditure>> expenditureStream() {
    DocumentReference categoryDocRef = db
        .collection("budgetCategory")
        .doc(dropDownController.category.value.docRef);
    try {
      return db
          .collection("expenditure")
          .where("category", isEqualTo: categoryDocRef)
          .where("date",
              isGreaterThanOrEqualTo:
                  getFirstTimeOfMonth(monthController.actualMonth.value))
          .where("date",
              isLessThanOrEqualTo:
                  getLastTimeOfMonth(monthController.actualMonth.value))
          .snapshots()
          .map((notes) {
        final List<Expenditure> expendituresFromFirestore = <Expenditure>[];
        for (final DocumentSnapshot<Map<String, dynamic>> doc in notes.docs) {
          expendituresFromFirestore
              .add(Expenditure.fromDocumentSnapshot(doc: doc));
        }
        return expendituresFromFirestore;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('de_DE');
    return SafeArea(
        child: Obx(
      () => Scaffold(
        appBar: CustomTopAppBar(
            title: dropDownController.category.value.name,
            showDelete: false,
            overrideBackButton: BudgetScreen(),
            showThreePoints: true,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {
                  if (result == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditCategoryScreen(
                                category: dropDownController.category.value)));
                  }
                },
                entries: const ["Kategorie-Einstellungen"]).build(context)),
        bottomNavigationBar: CustomBottomAppBar(
          mainPage: MainPages.BudgetScreen,
          isMainPage: false,
        ),
        backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dropDownController.changeCategory(
                budgetCategory: dropDownController.category.value);
            if (kDebugMode) {
              print("Category:${dropDownController.category.value.name}");
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddExpenditureScreen()));
          },
          backgroundColor:
              CustomMaterialThemeColorConstant.dark.primaryContainer,
          child: Icon(
            Icons.add,
            color: CustomMaterialThemeColorConstant.dark.onSurface,
          ),
        ),
        body: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  buildBarChartWithText(context),
                  CustomMonthPicker(),
                  StreamBuilder(
                      stream: expenditureStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return buildListView(snapshot);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      }),
                ],
              ),
            )),
      ),
    ));
  }

  Widget buildListView(AsyncSnapshot<List<Expenditure>> snapshot) {
    return Padding(
      padding: getPadding(top: 20, left: 10, right: 10),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final entry = snapshot.data![index];
            return Card(
              color: CustomMaterialThemeColorConstant.dark.surface5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpansionTile(
                    title: Text(entry.title,
                        style: TextStyle(
                            color: CustomMaterialThemeColorConstant
                                .dark.onSurface)),
                    subtitle: Text(
                        "${entry.description}\n${DateFormat('dd.MM.yyyy').format(entry.date)}",
                        style: TextStyle(
                            color: CustomMaterialThemeColorConstant
                                .dark.onSurface)),
                    trailing: Text("${entry.value}€",
                        style: TextStyle(
                            color: CustomMaterialThemeColorConstant
                                .dark.onSurface)),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: CustomMaterialThemeColorConstant
                                .dark.tertiaryContainer,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Padding(
                          padding: getPadding(all: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: IconButton(
                                onPressed: () {
                                  deleteExpenditure(docRef: entry.docRef);
                                },
                                icon: const Icon(Icons.delete),
                                iconSize: getSize(30),
                                color: CustomMaterialThemeColorConstant
                                    .dark.onTertiaryContainer,
                              )),
                              Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditExpenditureScreen(
                                                        expenditure: entry)));
                                      },
                                      icon: const Icon(Icons.edit),
                                      iconSize: getSize(30),
                                      color: CustomMaterialThemeColorConstant
                                          .dark.onTertiaryContainer))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Padding buildMonthPicker(BuildContext context) {
    return Padding(
      padding: getPadding(right: 20, left: 20),
      child: Container(
        decoration: BoxDecoration(
          color: CustomMaterialThemeColorConstant.dark.surface3,
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Padding(
          padding: getPadding(all: 20),
          child: TextFormField(
              key: Key(format.format(monthController.actualMonth.value)),
              initialValue: format.format(monthController.actualMonth.value),
              expands: false,
              readOnly: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                label: const Text("Monat"),
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
              onTap: () => {
                    showMonthPicker(
                      context: context,
                      firstDate: DateTime(DateTime.now().year - 1, 5),
                      lastDate: DateTime(DateTime.now().year + 1, 9),
                      initialDate: monthController.actualMonth.value,
                      headerColor: CustomMaterialThemeColorConstant
                          .dark.primaryContainer,
                      headerTextColor: CustomMaterialThemeColorConstant
                          .dark.onPrimaryContainer,
                      selectedMonthBackgroundColor:
                          CustomMaterialThemeColorConstant
                              .dark.primaryContainer,
                      selectedMonthTextColor: CustomMaterialThemeColorConstant
                          .dark.onPrimaryContainer,
                      unselectedMonthTextColor:
                          CustomMaterialThemeColorConstant.dark.onSecondary,
                    ).then((date) {
                      if (date != null) {}
                    })
                  }),
        ),
      ),
    );
  }

  Widget buildBarChartWithText(BuildContext context) {
    return Padding(
      padding: getPadding(left: 20, right: 20, bottom: 10, top: 20),
      child: FutureBuilder(
        future: getUsedBudgetPerCategory(
            dropDownController.category.value.docRef,
            monthController.actualMonth.value),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            double usedBudget = snapshot.data!;
            return FutureBuilder(
                future: getTotalBudget(monthController.actualMonth.value),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    if (kDebugMode) {
                      print(snapshot.error);
                    }
                  } else if (snapshot.hasData) {
                    double totalBudget = snapshot.data!;
                    double usedBudgetWidth = 0;
                    double restBudgetWidth = 0;
                    Color color =
                        CustomMaterialThemeColorConstant.dark.inversePrimary;
                    if (usedBudget > totalBudget) {
                      double width = MediaQuery.of(context).size.width - 60;
                      usedBudgetWidth = width;
                      restBudgetWidth = 0;
                      color =
                          CustomMaterialThemeColorConstant.dark.errorContainer;
                    } else {
                      double width = MediaQuery.of(context).size.width - 60;
                      usedBudgetWidth = width * usedBudget / totalBudget;
                      restBudgetWidth = width - usedBudgetWidth;
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: usedBudgetWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: color,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 50,
                                width: restBudgetWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CustomMaterialThemeColorConstant
                                      .dark.onSurfaceVariant,
                                ),
                              ),
                            ]),
                        Center(
                          child: Padding(
                            padding: getPadding(top: 10),
                            child: Text(
                                style: TextStyle(
                                  color: CustomMaterialThemeColorConstant
                                      .dark.onSurface,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                "${usedBudget.toStringAsFixed(2)}€   /   ${totalBudget.toStringAsFixed(2)}€"),
                          ),
                        )
                      ],
                    );
                  }
                  return Text(
                      style: TextStyle(
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      "No Budget available for selected month");
                });
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
