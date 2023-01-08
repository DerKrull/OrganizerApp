import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/BottomAppBar.dart';
import 'package:organizer_app/widgets/app_bar/appbar_image.dart';
import 'package:organizer_app/widgets/app_bar/custom_app_bar.dart';

import '../core/utils/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: buildAppBar(),
      body: Text("Ich bin der Body"),
      //bottomNavigationBar: buildBottomNavigationBar(),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            backgroundColor: ColorConstant.black9004c,
            icon: Icon(Icons.home),
            label: "Home"),
        BottomNavigationBarItem(
            backgroundColor: ColorConstant.black9004c,
            icon: Icon(Icons.attach_money),
            label: "Budget"),
        BottomNavigationBarItem(
            backgroundColor: ColorConstant.black9004c,
            icon: Icon(Icons.calendar_month),
            label: "Kalender"),
        BottomNavigationBarItem(
            backgroundColor: ColorConstant.black9004c,
            icon: Icon(Icons.task_alt),
            label: "Aufgaben")
      ],
      backgroundColor: ColorConstant.black9004c,
      currentIndex: 0,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: ColorConstant.black9004c,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon:
            Icon(Icons.menu, color: ColorConstant.gray30001, size: getSize(22)),
      ),
      title: Text("Organizer",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: ColorConstant.gray30001,
              fontSize: getFontSize(
                22,
              ),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.50,
              height: 1.25)),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings,
                color: ColorConstant.gray30001, size: getSize(22)))
      ],
    );
  }
}
