import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';

class CustomTopAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomTopAppBar({title: "N/A"}) {
    this.title = title;
  }
  
  String title = "";

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
      actions: [
        IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: Icon(Icons.more_vert,
                color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant, size: getSize(22)))
      ],
    ); 
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
