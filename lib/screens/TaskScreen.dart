import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:organizer_app/widgets/ThreePointPopUpMenu.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({super.key});

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<bool> isCheckedListDaily = <bool>[
    false,
    false,
    false,
  ];

  final List<bool> isCheckedListNotDaily = <bool>[
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20.0;

    return Scaffold(
      appBar: CustomTopAppBar(
          title: "Aufgaben",
          showThreePoints: true,
          menu: ThreePointPopUpMenu(
              onSelected: (int result) {},
              entries: ["Kategorie-Einstellungen"]).build(context)),
      bottomNavigationBar: CustomBottomAppBar(
        mainPage: MainPages.TaskScreen,
      ),
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface1,
      body: Column(
        children: [
          addSeparator(height: 10.0),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: CustomMaterialThemeColorConstant.dark.surface5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
                          child: Text(
                            "Tägliche Aufgaben",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomMaterialThemeColorConstant.dark.surface5,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return _buildSingleTask(
                                        index, isCheckedListDaily);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          addSeparator(height: 10.0),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: CustomMaterialThemeColorConstant.dark.surface5,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
                          child: Text(
                            "Aufgaben",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomMaterialThemeColorConstant.dark.surface5,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return _buildSingleTask(
                                        index, isCheckedListNotDaily);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          addSeparator(height: 10.0),
        ],
      ),
    );
  }

  SizedBox addSeparator({height: double}) {
    return SizedBox(
      height: height,
    );
  }

  Widget _buildSingleTask(int index, List isCheckedList) {
    if (index == 2) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              color: CustomMaterialThemeColorConstant.dark.surface5,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
            ),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    shape: CircleBorder(),
                    checkColor: Colors.white,
                    activeColor: CustomMaterialThemeColorConstant.light.primary,
                    value: isCheckedList[index],
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedList[index] = !isCheckedList[index];
                      });
                    },
                  ),
                ),
                Text(
                  "Daily Task 1",
                  style: isCheckedList[index]
                      ? const TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.white)
                      : const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80.0, 15.0, 10.0, 10.0),
                  child: Column(
                    children: [
                      Text(
                        "30.12.2022",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Meeting 1",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: double.infinity,
            height: 75,
            color: CustomMaterialThemeColorConstant.dark.surface5,
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    shape: CircleBorder(),
                    checkColor: Colors.white,
                    activeColor: CustomMaterialThemeColorConstant.light.primary,
                    value: isCheckedList[index],
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedList[index] = !isCheckedList[index];
                      });
                    },
                  ),
                ),
                Text(
                  "Daily Task 1",
                  style: isCheckedList[index]
                      ? const TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.white,
                        )
                      : const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80.0, 15.0, 10.0, 10.0),
                  child: Column(
                    children: [
                      Text(
                        "30.12.2022",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Meeting 1",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
  }
}
