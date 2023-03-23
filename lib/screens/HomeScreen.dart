import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/screens/BudgetScreen.dart';
import 'package:organizer_app/screens/CalendarMonthScreen.dart';
import 'package:organizer_app/screens/TasksOverviewScreen.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';

import '../controller/Calendar/TableCalendarController.dart';
import '../controller/MonthController.dart';
import '../core/FireStoreFutures/GetTasksFutures.dart';
import '../core/model/Event.dart';
import '../core/model/Task.dart';
import '../widgets/CustomTopAppBarHome.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomeScreen extends StatelessWidget {
  final DateTime initialDate = DateTime.now();
  RxInt selectedIndex = 0.obs;

  HomeScreen({Key? key}) : super(key: key);

  final MonthController monthController = Get.find();
  // final SegmentedControlController segmentedControlController = Get.find();
  final TableCalendarController tableCalendarController = Get.find();

  final Map<int, Widget> _children = {
    0: const Text(
      "Normal",
      style: TextStyle(color: Colors.white),
    ),
    1: const Text(
      "Tägliche",
      style: TextStyle(color: Colors.white),
    ),
  };

  Stream<List<Task>> tasksStream() {
    try {
      return db
          .collection("task")
          .where("isDaily",
              isEqualTo: (selectedIndex.value == 0)
                  ? false
                  : true)
          .snapshots()
          .map((tasks) {
        final List<Task> dailyTasksFromFirestore = <Task>[];
        for (final DocumentSnapshot<Map<String, dynamic>> doc in tasks.docs) {
          dailyTasksFromFirestore.add(Task.fromDocumentSnapshot(doc: doc));
        }
        return dailyTasksFromFirestore;
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
            appBar: const CustomTopAppBarHome(),
            bottomNavigationBar: CustomBottomAppBar(
              mainPage: MainPages.HomeScreen,
              isMainPage: true,
            ),
            backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
            body: Obx(() => SingleChildScrollView(
                  child: Column(
                    children: [
                      buildBarChartWithText(context),
                      addSeparationLine(height: 10.0),
                      buildTaskSelect(),
                      buildTasksBox(context),
                      addSeparationLine(height: 10.0),
                      buildTodaysEvents(context),
                    ],
                  ),
                ))));
  }

  Widget buildBarChartWithText(BuildContext context) {
    return Padding(
      padding: getPadding(left: 20, right: 20, bottom: 10, top: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BudgetScreen()));
        },
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
                      Color color =
                          CustomMaterialThemeColorConstant.dark.inversePrimary;
                      if (usedBudget > totalBudget) {
                        double width = MediaQuery.of(context).size.width - 60;
                        usedBudgetWidth = width;
                        restBudgetWidth = 0;
                        color = CustomMaterialThemeColorConstant
                            .dark.errorContainer;
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
                          ),
                        ],
                      );
                    }
                    return Text(
                        style: TextStyle(
                          color:
                              CustomMaterialThemeColorConstant.dark.onSurface,
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
      ),
    );
  }

  Widget addSeparationLine({height = double}) {
    return Divider(
      color: CustomMaterialThemeColorConstant.light.surface2,
      height: 10,
      thickness: 5,
    );
  }

  Widget buildTaskSelect() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: Obx(
          () => MaterialSegmentedControl(
            children: _children,
            selectionIndex: selectedIndex.value,
            selectedColor: Color.fromARGB(255, 74, 68, 88),
            unselectedColor: CustomMaterialThemeColorConstant.dark.surface1,
            borderColor: CustomMaterialThemeColorConstant.dark.outline,
            onSegmentChosen: (index) {
              selectedIndex.value = (selectedIndex.value == 0) ? 1 : 0;
            },
          ),
        ),
      ),
    );
  }

  Widget buildTasksBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TaskOverviewScreen()));
        },
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width - 20.0,
                decoration: BoxDecoration(
                  color: CustomMaterialThemeColorConstant.dark.surface5,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
                  child: buildHeadingOfTaskBox(),
                )),
            StreamBuilder(
                stream: tasksStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return _buildSingleTask(
                              index, snapshot.data!, context);
                        });
                  } else if (snapshot.hasError) {
                    Text("${snapshot.error}");
                  }
                  return const Center(child: CircularProgressIndicator());
                })
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTask(
      int index, List<Task> isCheckedList, BuildContext context) {
    if (index >= isCheckedList.length) {
      if (index == 2) {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
              height: 2,
              color: Colors.black,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
              height: 75,
              decoration: BoxDecoration(
                color: CustomMaterialThemeColorConstant.dark.surface5,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
              height: 2,
              color: Colors.black,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20.0,
              height: 75,
              color: CustomMaterialThemeColorConstant.dark.surface5,
            ),
          ],
        );
      }
    }
    if (index == 2) {
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            height: 75,
            decoration: BoxDecoration(
              color: CustomMaterialThemeColorConstant.dark.surface5,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
            ),
            child: _createSingleTask(isCheckedList, index),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 20.0,
            height: 75,
            color: CustomMaterialThemeColorConstant.dark.surface5,
            child: _createSingleTask(isCheckedList, index),
          ),
        ],
      );
    }
  }

  Widget _createSingleTask(List<Task> isCheckedList, int index) {
    if (isCheckedList[index].isDaily) {
      return FutureBuilder(
        future: getTaskCategoryName(isCheckedList[index].taskCategory.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              title: Text(
                isCheckedList[index].name,
                style: isCheckedList[index].done
                    ? TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 3,
                        fontSize: 20,
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                      )
                    : TextStyle(
                        fontSize: 20,
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                      ),
              ),
              leading: Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  side: BorderSide(
                      color: CustomMaterialThemeColorConstant.dark.secondary,
                      width: 1.5),
                  shape: const CircleBorder(),
                  checkColor: Colors.white,
                  activeColor: CustomMaterialThemeColorConstant.light.primary,
                  value: isCheckedList[index].done,
                  onChanged: (bool? value) {
                    updateDone(task: isCheckedList[index]);
                  },
                ),
              ),
              subtitle: Text(
                "${snapshot.data?.name}",
                style: TextStyle(
                    color: CustomMaterialThemeColorConstant.dark.onSurface,
                    fontSize: 16),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: Container(
              width: 20,
              height: 20,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      );
    } else {
      return FutureBuilder(
        future: getTaskCategoryName(isCheckedList[index].taskCategory.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              title: Text(
                isCheckedList[index].name,
                style: isCheckedList[index].done
                    ? TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 3,
                        fontSize: 20,
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                      )
                    : TextStyle(
                        fontSize: 20,
                        color: CustomMaterialThemeColorConstant.dark.onSurface,
                      ),
              ),
              subtitle: Text(
                "${snapshot.data?.name}",
                style: TextStyle(
                    color: CustomMaterialThemeColorConstant.dark.onSurface,
                    fontSize: 16),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    " ${DateFormat("dd.MM.yyyy").format(isCheckedList[index].dueDate)}",
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomMaterialThemeColorConstant.dark.onSurface),
                  ),
                  Text(
                    isCheckedList[index].description,
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomMaterialThemeColorConstant.dark.onSurface),
                  ),
                ],
              ),
              leading: Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  side: BorderSide(
                      color: CustomMaterialThemeColorConstant.dark.secondary,
                      width: 1.5),
                  shape: const CircleBorder(),
                  checkColor: Colors.white,
                  activeColor: CustomMaterialThemeColorConstant.light.primary,
                  value: isCheckedList[index].done,
                  onChanged: (bool? value) {
                    updateDone(task: isCheckedList[index]);
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: Container(
              width: 20,
              height: 20,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      );
    }
  }

  Text buildHeadingOfTaskBox() {
    if (selectedIndex.value == 0) {
      return const Text(
        "Aufgaben",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      );
    } else {
      return const Text(
        "Tägliche Aufgaben",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      );
    }
  }

  Widget buildTodaysEvents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CalendarMonthScreen()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
              child: Text(
                "Termine Heute",
                style: TextStyle(
                  fontSize: 22,
                  color: CustomMaterialThemeColorConstant.dark.onSurface,
                ),
              ),
            ),
            FutureBuilder<List<Event>>(
              future: getEventsForDay(DateTime.now()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Event> events = snapshot.data!;
                  return SizedBox(
                    height: (events.isEmpty) ? 50 : events.length * 80,
                    child: (events.isEmpty)
                        ? Center(
                            child: Text(
                              "Keine Termine",
                              style: TextStyle(
                                fontSize: 20,
                                color: CustomMaterialThemeColorConstant
                                    .dark.onSurface,
                              ),
                            ),
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              return _buildSingleEvent(index, events);
                            }),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleEvent(int index, List<Event> events) {
    return Card(
      color: CustomMaterialThemeColorConstant.dark.surface5,
      child: ListTile(
        title: Text(
          events[index].title,
          style: TextStyle(
            fontSize: 20,
            color: CustomMaterialThemeColorConstant.dark.onSurface,
          ),
        ),
        subtitle: Text(
          events[index].description,
          style: TextStyle(
            fontSize: 16,
            color: CustomMaterialThemeColorConstant.dark.onSurface,
          ),
        ),
        trailing: Text(
          "um ${DateFormat("hh:mm").format(events[index].dateTime)}",
          style: TextStyle(
            fontSize: 16,
            color: CustomMaterialThemeColorConstant.dark.onSurface,
          ),
        ),
      ),
    );
  }
}
