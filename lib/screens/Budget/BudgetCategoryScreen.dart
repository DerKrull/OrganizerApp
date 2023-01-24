import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';
import 'package:organizer_app/controller/DropDownCategoryController.dart';

import '../../core/app_export.dart';
import '../../core/model/BudgetCategory.dart';
import '../../core/model/Expenditure.dart';
import '../../widgets/CustomBottomAppBar.dart';
import '../../widgets/CustomTopAppBar.dart';
import '../../widgets/ThreePointPopUpMenu.dart';
import 'AddExpenditure.dart';
import 'EditCategoryScreen.dart';

class BudgetCategoryScreen extends StatefulWidget {
  final String categoryRef;
  final String categoryName;
  final BudgetCategory category;
  final DateTime initialDate;

  const BudgetCategoryScreen({Key? key,
    required this.categoryRef,
    required this.categoryName,
    required this.initialDate,
    required this.category})
      : super(key: key);

  @override
  State<BudgetCategoryScreen> createState() => _BudgetCategoryScreenState();
}

class _BudgetCategoryScreenState extends State<BudgetCategoryScreen> {
  Future<void> dataReceived = initializeDateFormatting('de', null);

  DateTime? selectedDate;
  DateFormat format = DateFormat('MMMM', 'de');
  Timestamp timestamp = Timestamp.fromDate(DateTime.now());

  double usedBudget = 0;
  double totalBudget = 0;

  DropDownCategoryController ddcController = Get.find();

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  Stream<List<Expenditure>> expenditureStream() {
    DocumentReference categoryDocRef =
    db.collection("budgetCategory").doc(widget.categoryRef);
    try {
      return db
          .collection("expenditure")
          .where("category", isEqualTo: categoryDocRef)
          .where("date",
          isGreaterThanOrEqualTo: getFirstTimeOfMonth(selectedDate!))
          .where("date", isLessThanOrEqualTo: getLastTimeOfMonth(selectedDate!))
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
    return SafeArea(
      child: Scaffold(
        appBar: CustomTopAppBar(
            title: widget.categoryName,
            showThreePoints: true,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {
                  if (result == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditCategoryScreen(
                                  categoryRef: widget.categoryRef,
                                  initialName: widget.categoryName,
                                )));
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
            ddcController.changeCategory(budgetCategory: widget.category);
            if (kDebugMode) {
              print("Category:${widget.category.name}");
            }
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddExpenditure()));
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
              buildMonthPicker(context),
              buildExpenditureStreamBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<List<Expenditure>> buildExpenditureStreamBuilder() {
    return StreamBuilder(
        stream: expenditureStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildListView(snapshot);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
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
                  Padding(
                    padding: getPadding(left: 20.0),
                    child: Text(
                        style: TextStyle(
                            color: CustomMaterialThemeColorConstant
                                .dark.onSurface),
                        DateFormat('dd.MM.yyyy').format(entry.date)),
                  ),
                  ListTile(
                    title: Text(entry.title),
                    subtitle: Text(entry.description),
                    isThreeLine: true,
                    trailing: Text("${entry.value}€"),
                    textColor: CustomMaterialThemeColorConstant.dark.onSurface,
                    onTap: () {},
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
              key: Key(format.format(selectedDate!)),
              initialValue: format.format(selectedDate!),
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
              onTap: () =>
              {
                showMonthPicker(
                  context: context,
                  firstDate: DateTime(DateTime
                      .now()
                      .year - 1, 5),
                  lastDate: DateTime(DateTime
                      .now()
                      .year + 1, 9),
                  initialDate: selectedDate ?? widget.initialDate,
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
                  if (date != null) {
                    setState(() {
                      selectedDate = date;
                      if (kDebugMode) {
                        print(
                            "Selected Date is: ${DateFormat(
                                "dd.MM.yyyy hh:mm", 'de').format(
                                selectedDate!)}");
                      }
                    });
                  }
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
        future: getUsedBudgetPerCategory(widget.categoryRef, selectedDate!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            usedBudget = snapshot.data!;
            return FutureBuilder(
                future: getTotalBudget(selectedDate!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    if (kDebugMode) {
                      print(snapshot.error);
                    }
                  } else if (snapshot.hasData) {
                    totalBudget = snapshot.data!;
                    double width = MediaQuery
                        .of(context)
                        .size
                        .width - 60;
                    double usedBudgetWidth = width * usedBudget / totalBudget;
                    double restBudgetWidth = width - usedBudgetWidth;
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
                                  color: CustomMaterialThemeColorConstant
                                      .dark.inversePrimary,
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
                                "${usedBudget.toStringAsFixed(
                                    2)}€   /   ${totalBudget.toStringAsFixed(
                                    2)}€"),
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
