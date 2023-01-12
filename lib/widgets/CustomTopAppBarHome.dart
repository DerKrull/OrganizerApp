import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';

class CustomTopAppBarHome extends StatelessWidget with PreferredSizeWidget {
  const CustomTopAppBarHome({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomMaterialThemeColorConstant.dark.surface2,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu,
            color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant,
            size: getSize(22)),
      ),
      title: Text("Organizer",
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
            onPressed: () {},
            icon: Icon(Icons.settings,
                color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant,
                size: getSize(22)))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
