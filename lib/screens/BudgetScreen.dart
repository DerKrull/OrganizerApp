import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/model/BudgetCategory.dart';
import 'package:organizer_app/model/Expenditure.dart';
import 'package:organizer_app/screens/BudgetCategoryScreen.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:organizer_app/widgets/MonthOnlyInput.dart';

class BudgetScreen extends StatelessWidget {
  BudgetScreen({Key? key}) : super(key: key);

  FirebaseFirestore db = FirebaseFirestore.instance;

  double usedBudget = 300.0;

  double totalBudget = 1000.0;

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

  Future<double?> getUsedBudgetPerCategory(String categoryRef) async {
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

  Future<double?> getUsedBudget() async {
    double sum = 0;
    var queryResult = await db
        .collection("expenditure")
        .get();
    queryResult.docs.forEach((doc) {
      sum += Expenditure.fromDocumentSnapshot(doc: doc).value;
    });
    print("Result: " + sum.toString());
    return sum;
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
                      stream: budgetCategoryStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return buildListView(snapshot);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return CircularProgressIndicator();
                      }),
                ],
              ),
            )));
  }

  Widget buildListView(AsyncSnapshot<List<BudgetCategory>> snapshot) {
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
              child: ListTile(
                title: Text(entry.name),
                subtitle: Text(entry.description),
                leading: CircleAvatar(backgroundColor: Color(entry.color)),
                trailing: FutureBuilder(
                  future: getUsedBudgetPerCategory(entry.docRef),
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return Text("${snapshot.data}");
                    } else if(snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
                textColor: CustomMaterialThemeColorConstant.dark.onSurface,
                onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BudgetCategoryScreen(categoryRef: entry.docRef, categoryName: entry.name,)));},
              ),
            );
          }),
    );
  }

  Widget buildBarChartWithText(BuildContext context) {

    return FutureBuilder(future: getUsedBudget(), builder: (context, snapshot) {
      if(snapshot.hasData) {
        this.usedBudget = roundDouble(snapshot.data!, 2);
        double width = MediaQuery.of(context).size.width - 60;
        double usedBudgetWidth = width * usedBudget / totalBudget;
        double restBudgetWidth = width - usedBudgetWidth;
        return Padding(
          padding: getPadding(left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  height: 50,
                  width: usedBudgetWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomMaterialThemeColorConstant.dark.inversePrimary,
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
                    color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant,
                  ),
                ),
              ]),
              Center(
                child: Padding(
                  padding: getPadding(top: 10),
                  child: Text(
                      style: TextStyle(
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
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
          ),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    });
  }
}
