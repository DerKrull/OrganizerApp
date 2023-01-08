import 'package:flutter/material.dart';
import 'package:organizer_app/screens/HomeScreen.dart';
import 'package:organizer_app/core/app_export.dart';

class CustomBottomAppBar extends StatelessWidget {
  CustomBottomAppBar({activated: "N/A"}) {
    this.activated = activated;
  }

  String activated = "Home";

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
        color: ColorConstant.black9004c,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {/* nothing to do staying on this page*/},
            child: BuildBottomAppBarIcons(
                activated: activated == "Home" ? true : false,
                icon: Icons.home,
                label: "Home"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (context) => const HomeScreen()));
            },
            child: BuildBottomAppBarIcons(
                activated: activated == "Budget" ? true : false,
                icon: Icons.attach_money,
                label: "Budget"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
            },
            child: BuildBottomAppBarIcons(
                activated: activated == "Kalender" ? true : false,
                icon: Icons.calendar_month,
                label: "Kalender"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
            },
            child: BuildBottomAppBarIcons(
                activated: activated == "Aufgaben" ? true : false,
                icon: Icons.task_alt,
                label: "Aufgaben"),
          )
        ],
      ),
    );
  }

  Padding BuildBottomAppBarIcons({activated: false, icon: null, label: "N/A"}) {
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
            decoration: activated
                ? BoxDecoration(
                    color: ColorConstant.blueGray80001,
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
                color: ColorConstant.gray30001,
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
