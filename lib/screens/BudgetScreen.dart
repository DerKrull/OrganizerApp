import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:organizer_app/controller/MonthController.dart';
import 'package:organizer_app/screens/Budget/EditBudgetSreen.dart';

import '../controller/DropDownCategoryController.dart';
import '../core/app_export.dart';
import '../core/model/BudgetCategory.dart';
import '../widgets/CustomBottomAppBar.dart';
import '../widgets/CustomMonthPicker.dart';
import '../widgets/CustomTopAppBarMainPage.dart';
import '../widgets/ThreePointPopUpMenu.dart';
import 'Budget/AddCategoryScreen.dart';
import 'Budget/BudgetCategoryScreen.dart';

class BudgetScreen extends StatelessWidget {
  final DateTime initialDate = DateTime.now();

  BudgetScreen({Key? key}) : super(key: key);

  final MonthController monthController = Get.find();
  final DropDownCategoryController dropDownController = Get.find();

  Stream<List<BudgetCategory>> budgetCategoryStream() {
    try {
      return db.collection("budgetCategory").snapshots().map((notes) {
        final List<BudgetCategory> categoriesFromFirestore = <BudgetCategory>[];
        for (final DocumentSnapshot<Map<String, dynamic>> doc in notes.docs) {
          categoriesFromFirestore
              .add(BudgetCategory.fromDocumentSnapshot(doc: doc));
        }
        return categoriesFromFirestore;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('de_DE');
    return SafeArea(
        child: Scaffold(
            appBar: CustomTopAppBarMainPage(
                title: "Budget",
                showThreePoints: true,
                menu: ThreePointPopUpMenu(
                    onSelected: (int result) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditBudgetScreen()));
                    },
                    entries: const ["Budget-Einstellungen"]).build(context)),
            bottomNavigationBar: CustomBottomAppBar(
              mainPage: MainPages.BudgetScreen,
              isMainPage: true,
            ),
            backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddCategoryScreen()));
              },
              backgroundColor:
                  CustomMaterialThemeColorConstant.dark.primaryContainer,
              child: Icon(
                Icons.add,
                color: CustomMaterialThemeColorConstant.dark.onSurface,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  buildBarChartWithText(context),
                  CustomMonthPicker(),
                  StreamBuilder(
                      stream: budgetCategoryStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return buildListView(snapshot);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      }),
                ],
              ),
            )));
  }

  Widget buildListView(AsyncSnapshot<List<BudgetCategory>> snapshot) {
    return Padding(
      padding: getPadding(top: 20, left: 10, right: 10),
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final entry = snapshot.data![index];
                return Card(
                  color: CustomMaterialThemeColorConstant.dark.surface5,
                  child: ListTile(
                    title: Text(entry.name),
                    subtitle: Text(entry.description),
                    leading: CircleAvatar(backgroundColor: Color(entry.color)),
                    trailing: FutureBuilder(
                      future: getUsedBudgetPerCategory(entry.docRef, monthController.actualMonth.value),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text("${snapshot.data}");
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                    textColor: CustomMaterialThemeColorConstant.dark.onSurface,
                    onTap: () {
                      dropDownController.changeCategory(budgetCategory: entry);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BudgetCategoryScreen()));
                    },
                  ),
                );
              }),
              SizedBox(
                height: 80,
              ),
        ],
      ),
    );
  }

  Widget buildBarChartWithText(BuildContext context) {
    return Obx(() => Padding(
      padding: getPadding(left: 20, right: 20, bottom: 10, top: 20),
      child: FutureBuilder(
        future: getUsedBudgetTotal(monthController.actualMonth.value),
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
                    Color color = CustomMaterialThemeColorConstant.dark.inversePrimary;
                    if (usedBudget > totalBudget) {
                      double width = MediaQuery.of(context).size.width - 60;
                      usedBudgetWidth = width;
                      restBudgetWidth = 0;
                      color = CustomMaterialThemeColorConstant.dark.errorContainer;
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
    ));
  }
}
