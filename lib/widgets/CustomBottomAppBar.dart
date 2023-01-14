import 'package:flutter/material.dart';
import 'package:organizer_app/screens/Budget/BudgetScreen.dart';
import 'package:organizer_app/screens/HomeScreen.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/screens/TaskScreen.dart';
import 'package:organizer_app/templates/yearlycalendarscreen_screen/yearlycalendarscreen_screen.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({Key? key, required this.mainPage}) : super(key: key);
  String mainPage;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  String? activePage;
  @override
  void initState() {
    super.initState();
   activePage = widget.mainPage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: getPadding(
        left: 16,
        top: 12,
        right: 16,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: CustomMaterialThemeColorConstant.dark.surface2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                activePage = MainPages.HomeScreen;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            child: buildBottomAppBarIcons(
                icon: Icons.home,
                label: MainPages.HomeScreen),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                activePage = MainPages.BudgetScreen;
              });
              Navigator.push(
              context,
              MaterialPageRoute(
              //    builder: (context) => BudgetscreenScreen()));
              builder: (context) => BudgetScreen()));
            },
            child: buildBottomAppBarIcons(
                icon: Icons.attach_money,
                label: MainPages.BudgetScreen),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                activePage = MainPages.CalendarScreen;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YearlycalendarscreenScreen()));
            },
            child: buildBottomAppBarIcons(
                icon: Icons.calendar_month,
                label: MainPages.CalendarScreen),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                activePage = MainPages.TaskScreen;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      // builder: (context) => TasksoverviewscreenScreen()));
                      builder: (context) => TaskScreen()));
            },
            child: buildBottomAppBarIcons(

                icon: Icons.task_alt,
                label: MainPages.TaskScreen),
          )
        ],
      ),
    );
  }

  Padding buildBottomAppBarIcons({icon, label}) {
    var active = widget.mainPage == label ? true : false;
    return Padding(
      padding: getPadding(
        bottom: 4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: getVerticalSize(
              32.00,
            ),
            width: getHorizontalSize(
              64.00,
            ),
            padding: getPadding(
              left: 20,
              top: 4,
              right: 20,
              bottom: 4,
            ),
            decoration: active ?
                BoxDecoration(
                    color: CustomMaterialThemeColorConstant.dark.secondaryContainer,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        16.00,
                      ),
                    ),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(
                        16.00,
                      ),
                    ),
                  ),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Icon(
                      icon,
                      size: getSize(24.00),
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 4,
            ),
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: CustomMaterialThemeColorConstant.dark.onSurface,
                fontSize: getFontSize(
                  12,
                ),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.50,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
