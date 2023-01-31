import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

import '../core/app_export.dart';
import '../core/model/BudgetCategory.dart';
import '../widgets/CustomBottomAppBar.dart';
import '../widgets/CustomTopAppBarMainPage.dart';
import '../widgets/ThreePointPopUpMenu.dart';
import 'Budget/AddCategoryScreen.dart';
import 'Budget/BudgetCategoryScreen.dart';



class BudgetScreen extends StatefulWidget {
  final DateTime initialDate = DateTime.now();

  BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  Future<void> dataReceived = initializeDateFormatting('de', null);

  DateTime? selectedDate;
  DateFormat format = DateFormat('MMMM', 'de');
  Timestamp timestamp = Timestamp.fromDate(DateTime.now());

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  double usedBudget = 0.0;

  double totalBudget = 0.0;

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
    return SafeArea(
        child: Scaffold(
            appBar: CustomTopAppBarMainPage(
                title: "Budget",
                showThreePoints: true,
                menu: ThreePointPopUpMenu(
                    onSelected: (int result) {},
                    entries: const ["Kategorie-Einstellungen"]).build(context)),
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
                  buildMonthPicker(context),
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
                      future: getUsedBudgetPerCategory(entry.docRef, selectedDate!),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BudgetCategoryScreen(
                                    category: entry,
                                    initialDate: selectedDate!,
                                  )));
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
              onTap: () => {
                    showMonthPicker(
                      context: context,
                      firstDate: DateTime(DateTime.now().year - 1, 5),
                      lastDate: DateTime(DateTime.now().year + 1, 9),
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
                                "Selected Date is: ${DateFormat("dd.MM.yyyy hh:mm", 'de').format(selectedDate!)}");
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
        future: getUsedBudgetTotal(selectedDate!),
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
                    double width = MediaQuery.of(context).size.width - 60;
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
