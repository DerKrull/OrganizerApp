import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';

class CustomTopAppBar extends StatefulWidget with PreferredSizeWidget {
  CustomTopAppBar(
      {required this.menu,
      required this.title,
      required this.showThreePoints});

  final PopupMenuButton<int> menu;
  final String title;
  final bool showThreePoints;

  @override
  State<CustomTopAppBar> createState() => _CustomTopAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomTopAppBarState extends State<CustomTopAppBar> {
  Text? selectedMenu;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface2,
      centerTitle: false,
      leading: BackButton(
        color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant,
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
      actions: [
        if (widget.showThreePoints) widget.menu
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
