import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/screens/HomeScreen.dart';

class CustomTopAppBarMainPage extends StatefulWidget with PreferredSizeWidget {
  CustomTopAppBarMainPage(
      {required this.menu, required this.title, required this.showThreePoints});

  final PopupMenuButton<int> menu;
  final String title;
  final bool showThreePoints;

  @override
  State<CustomTopAppBarMainPage> createState() => _CustomTopAppBarMainPageState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomTopAppBarMainPageState extends State<CustomTopAppBarMainPage> {
  Text? selectedMenu;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface2,
      centerTitle: false,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen())
          );
        },
        icon: Icon(Icons.arrow_back,  color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant)

      ),
      title: Text(widget.title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant,
              fontSize: getFontSize(
                22,
              ),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.50,
              height: 1.25)),
      actions: [if (widget.showThreePoints) widget.menu],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
