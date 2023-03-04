import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';

class CustomTopAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomTopAppBar(
      {super.key, required this.menu, required this.title, required this.showThreePoints, required this.showDelete, this.onPressed});

  final PopupMenuButton<int> menu;
  final String title;
  final bool showThreePoints;
  final bool showDelete;
  final Function()? onPressed;

  Text? selectedMenu;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface2,
      centerTitle: false,
      leading: BackButton(
        color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant,
      ),
      title: Text(title,
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
      actions: [if (showThreePoints) menu,
      if (showDelete) IconButton(onPressed: onPressed, icon: Icon(Icons.delete_forever, color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
