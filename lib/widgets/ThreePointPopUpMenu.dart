import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';

class ThreePointPopUpMenu extends StatelessWidget  {
  const ThreePointPopUpMenu({
    Key? key, required this.onSelected, required this.entries,
  }) : super(key: key);

  final void Function(int) onSelected;
  final List<String> entries;

  List<PopupMenuEntry<int>> generatePopUpMenuItems(BuildContext context) {
    List<PopupMenuItem<int>> list = [];
    int index = 0;
    for (var entry in entries) {
      list.add(PopupMenuItem<int>(
        value: index,
        child: Text(
            style: TextStyle(
              color: CustomMaterialThemeColorConstant
                  .dark.onSecondaryContainer,
            ), entry),
      ));
    }
    return list;
  }

  @override
  PopupMenuButton<int> build(BuildContext context) {
    return PopupMenuButton<int>(
        color: CustomMaterialThemeColorConstant.dark.secondaryContainer,
        icon: Icon(
          Icons.more_vert,
          color: CustomMaterialThemeColorConstant.dark.onSurfaceVariant,
        ),
        onSelected: onSelected,
        itemBuilder: (context) => generatePopUpMenuItems(context));
  }
}
