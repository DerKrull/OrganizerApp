import 'package:flutter/material.dart';
import 'package:organizer_app/screens/BudgetScreen.dart';
import 'package:organizer_app/screens/HomeScreen.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/templates/tasksoverviewscreen_screen/tasksoverviewscreen_screen.dart';
import 'package:organizer_app/templates/yearlycalendarscreen_screen/yearlycalendarscreen_screen.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({activated: "N/A"}) {
    this.activated = activated;
  }
  String activated = "Home";

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
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
                widget.activated = "Home";
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            child: BuildBottomAppBarIcons(
                icon: Icons.home,
                label: "Home"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.activated = "Budget";
              });
              Navigator.push(
              context,
              MaterialPageRoute(
              //    builder: (context) => BudgetscreenScreen()));
              builder: (context) => BudgetScreen(initialDate: DateTime.now())));
            },
            child: BuildBottomAppBarIcons(
                icon: Icons.attach_money,
                label: "Budget"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => YearlycalendarscreenScreen()));
            },
            child: BuildBottomAppBarIcons(

                icon: Icons.calendar_month,
                label: "Kalender"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TasksoverviewscreenScreen()));
            },
            child: BuildBottomAppBarIcons(

                icon: Icons.task_alt,
                label: "Aufgaben"),
          )
        ],
      ),
    );
  }

  Padding BuildBottomAppBarIcons({icon: null, label: "N/A"}) {
    var active = widget.activated == "label" ? true : false;
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
