import '../tasksscreen_screen/widgets/tasksscreen_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/app_bar/appbar_image.dart';
import 'package:organizer_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:organizer_app/widgets/app_bar/custom_app_bar.dart';
import 'package:organizer_app/widgets/custom_button.dart';

class TasksscreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  146.00,
                ),
                width: size.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomAppBar(
                      height: getVerticalSize(
                        64.00,
                      ),
                      leadingWidth: 40,
                      leading: AppbarImage(
                        height: getSize(
                          24.00,
                        ),
                        width: getSize(
                          24.00,
                        ),
                        svgPath: ImageConstant.imgArrowleftWhiteA700,
                        margin: getMargin(
                          left: 16,
                          top: 20,
                          bottom: 20,
                        ),
                      ),
                      title: AppbarSubtitle(
                        text: "Tasks",
                        margin: getMargin(
                          left: 16,
                        ),
                      ),
                      actions: [
                        AppbarImage(
                          height: getSize(
                            24.00,
                          ),
                          width: getSize(
                            24.00,
                          ),
                          svgPath: ImageConstant.imgOverflowmenu,
                          margin: getMargin(
                            left: 16,
                            top: 20,
                            right: 16,
                            bottom: 20,
                          ),
                        ),
                      ],
                      styleType: Style.bgFillGray900,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width,
                        margin: getMargin(
                          top: 62,
                        ),
                        padding: getPadding(
                          left: 8,
                          top: 10,
                          right: 8,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.gray900,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                top: 7,
                                bottom: 8,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 11,
                                top: 17,
                                bottom: 19,
                              ),
                              child: Text(
                                "Task 1",
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
                            Padding(
                              padding: getPadding(
                                top: 3,
                              ),
                              child: Column(
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
                                      "Meeting 1",
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
                                top: 19,
                                right: 5,
                                bottom: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return TasksscreenItemWidget();
                },
              ),
              Container(
                height: getVerticalSize(
                  150.00,
                ),
                width: size.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: ColorConstant.gray900,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                top: 4,
                                right: 8,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgClock47x47,
                                    height: getSize(
                                      47.00,
                                    ),
                                    width: getSize(
                                      47.00,
                                    ),
                                    margin: getMargin(
                                      top: 12,
                                      bottom: 8,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 11,
                                      top: 22,
                                      bottom: 19,
                                    ),
                                    child: Text(
                                      "Task 8",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.whiteA700,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: getVerticalSize(
                                      67.00,
                                    ),
                                    width: getHorizontalSize(
                                      147.00,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: getPadding(
                                              top: 8,
                                            ),
                                            child: Text(
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
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: getPadding(
                                              left: 1,
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
                                        ),
                                        CustomImageView(
                                          svgPath:
                                              ImageConstant.imgSettings24x24,
                                          height: getSize(
                                            24.00,
                                          ),
                                          width: getSize(
                                            24.00,
                                          ),
                                          alignment: Alignment.bottomRight,
                                          margin: getMargin(
                                            right: 5,
                                            bottom: 19,
                                          ),
                                        ),
                                        CustomButton(
                                          height: 56,
                                          width: 56,
                                          text: "+",
                                          variant:
                                              ButtonVariant.OutlineBlack9004c,
                                          shape: ButtonShape.RoundedBorder16,
                                          padding: ButtonPadding.PaddingAll8,
                                          fontStyle:
                                              ButtonFontStyle.RobotoRegular32,
                                          alignment: Alignment.topRight,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width,
                        margin: getMargin(
                          top: 70,
                        ),
                        padding: getPadding(
                          left: 16,
                          top: 12,
                          right: 16,
                          bottom: 12,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.gray900,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: getPadding(
                                left: 15,
                                top: 4,
                                bottom: 4,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgArrowup,
                                    height: getSize(
                                      24.00,
                                    ),
                                    width: getSize(
                                      24.00,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 8,
                                    ),
                                    child: Text(
                                      "Home",
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
                            ),
                            Spacer(),
                            Padding(
                              padding: getPadding(
                                top: 4,
                                bottom: 3,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgInfo,
                                    height: getSize(
                                      24.00,
                                    ),
                                    width: getSize(
                                      24.00,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 9,
                                    ),
                                    child: Text(
                                      "Budget",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.gray400,
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
                            ),
                            Padding(
                              padding: getPadding(
                                left: 41,
                                top: 4,
                                bottom: 4,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgCalculator,
                                    height: getSize(
                                      24.00,
                                    ),
                                    width: getSize(
                                      24.00,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 8,
                                    ),
                                    child: Text(
                                      "Kalendar",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.gray400,
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
                            ),
                            Padding(
                              padding: getPadding(
                                left: 29,
                                bottom: 3,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.gray80001,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          16.00,
                                        ),
                                      ),
                                    ),
                                    child: Container(
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
                                      decoration: BoxDecoration(
                                        color: ColorConstant.gray80001,
                                        borderRadius: BorderRadius.circular(
                                          getHorizontalSize(
                                            16.00,
                                          ),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          CustomImageView(
                                            svgPath:
                                                ImageConstant.imgCheckmark24x24,
                                            height: getSize(
                                              24.00,
                                            ),
                                            width: getSize(
                                              24.00,
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 5,
                                    ),
                                    child: Text(
                                      "Aufgaben",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.gray400,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
