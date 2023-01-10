import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';

// ignore: must_be_immutable
class TasksscreenItemWidget extends StatelessWidget {
  TasksscreenItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConstant.gray900,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: getVerticalSize(
              2.00,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: ColorConstant.gray700,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 8,
              top: 12,
              right: 13,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgClock,
                  height: getSize(
                    47.00,
                  ),
                  width: getSize(
                    47.00,
                  ),
                  margin: getMargin(
                    top: 3,
                    bottom: 8,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 11,
                    top: 13,
                    bottom: 19,
                  ),
                  child: Text(
                    "Task 2",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.whiteA700,
                      fontSize: getFontSize(
                        20,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "30.12.2022",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant.whiteA700,
                        fontSize: getFontSize(
                          18,
                        ),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 1,
                        top: 14,
                      ),
                      child: Text(
                        "Meeting 2",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorConstant.whiteA700,
                          fontSize: getFontSize(
                            18,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgSettings24x24,
                  height: getSize(
                    24.00,
                  ),
                  width: getSize(
                    24.00,
                  ),
                  margin: getMargin(
                    left: 24,
                    top: 15,
                    bottom: 19,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
