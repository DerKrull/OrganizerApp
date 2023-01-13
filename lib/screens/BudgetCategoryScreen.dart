import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/model/Expenditure.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:organizer_app/widgets/MonthOnlyInput.dart';

class BudgetCategoryScreen extends StatelessWidget {
  String categoryRef;
  String categoryName;

  BudgetCategoryScreen(
      {Key? key, required this.categoryRef, required this.categoryName})
      : super(key: key);

  FirebaseFirestore db = FirebaseFirestore.instance;

  double usedBudget = 0;

  double totalBudget = 1000.0;

  Future<double?> getUsedBudget() async {
    DocumentReference categoryDocRef =
        db.collection("budgetCategory").doc(categoryRef);
    double sum = 0;
    var queryResult = await db
        .collection("expenditure")
        .where("category", isEqualTo: categoryDocRef)
        .get();
    queryResult.docs.forEach((doc) {
      sum += Expenditure.fromDocumentSnapshot(doc: doc).value;
    });
    print("Result: " + sum.toString());
    return sum;
  }

  Stream<List<Expenditure>> expenditureStream() {
    DocumentReference categoryDocRef =
        db.collection("budgetCategory").doc(categoryRef);
    try {
      return db
          .collection("expenditure")
          .where("category", isEqualTo: categoryDocRef)
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

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomTopAppBar(title: "Budget"),
        bottomNavigationBar:
            CustomBottomAppBar(mainPage: MainPages.BudgetScreen),
        backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildBarChartWithText(context),
              MonthOnlyInput(initialDate: DateTime.now()),
              StreamBuilder(
                  stream: expenditureStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return buildListView(snapshot);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),
              Text(
                  style: TextStyle(
                      color: CustomMaterialThemeColorConstant.dark.onSurface,
                      fontSize: 18),
                  "This is document: " + categoryRef),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView(AsyncSnapshot<List<Expenditure>> snapshot) {
    return Padding(
      padding: getPadding(top: 20, left: 10, right: 10),
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
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
                    trailing: Text(entry.value.toString() + "€"),
                    textColor: CustomMaterialThemeColorConstant.dark.onSurface,
                    onTap: () {},
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget buildBarChartWithText(BuildContext context) {
    return Padding(
      padding: getPadding(left: 20, right: 20, bottom: 10),
      child: FutureBuilder(
        future: getUsedBudget(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            this.usedBudget = roundDouble(snapshot.data!, 2);
            double width = MediaQuery.of(context).size.width - 60;
            double usedBudgetWidth = width * usedBudget / totalBudget;
            double restBudgetWidth = width - usedBudgetWidth;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Container(
                    height: 50,
                    width: usedBudgetWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          CustomMaterialThemeColorConstant.dark.inversePrimary,
                    ),
                  ),
                  SizedBox(
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
                          color:
                              CustomMaterialThemeColorConstant.dark.onSurface,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        usedBudget.toString() +
                            "€   /   " +
                            totalBudget.toString() +
                            "€"),
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
