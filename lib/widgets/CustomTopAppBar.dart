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
      backgroundColor: ColorConstant.black9004c,
      centerTitle: false,
      leading: IconButton(
        onPressed: () {},
        icon:
        Icon(Icons.arrow_back, color: ColorConstant.gray30001, size: getSize(22)),
      ),
      title: Text(title,
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
            onPressed: () {Navigator.pop(context);},
            icon: Icon(Icons.more_vert,
                color: ColorConstant.gray30001, size: getSize(22)))
      ],
    ); 
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
