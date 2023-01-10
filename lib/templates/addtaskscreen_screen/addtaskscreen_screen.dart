import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/app_bar/appbar_image.dart';
import 'package:organizer_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:organizer_app/widgets/app_bar/custom_app_bar.dart';
import 'package:organizer_app/widgets/custom_button.dart';
import 'package:organizer_app/widgets/custom_floating_edit_text.dart';

class AddtaskscreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 16,
            top: 30,
            right: 16,
            bottom: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: getHorizontalSize(
                  328.00,
                ),
                padding: getPadding(
                  left: 12,
                  top: 8,
                  right: 12,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray800,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                    topRight: Radius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFloatingEditText(
                      width: 300,
                      focusNode: FocusNode(),
                      margin: getMargin(
                        bottom: 3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 38,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      height: 40,
                      width: 164,
                      text: "Normal",
                      variant: ButtonVariant.OutlineGray500,
                      shape: ButtonShape.CustomBorderTL100,
                      padding: ButtonPadding.PaddingT11,
                      fontStyle: ButtonFontStyle.RobotoMedium14,
                      prefixWidget: Container(
                        padding: getPadding(
                          right: 55,
                        ),
                        margin: getMargin(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              getHorizontalSize(
                                100.00,
                              ),
                            ),
                            bottomLeft: Radius.circular(
                              getHorizontalSize(
                                100.00,
                              ),
                            ),
                          ),
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgCheckmark,
                        ),
                      ),
                    ),
                    CustomButton(
                      height: 40,
                      width: 164,
                      text: "Daily",
                      variant: ButtonVariant.OutlineGray500_1,
                      shape: ButtonShape.CustomBorderLR100,
                      padding: ButtonPadding.PaddingAll11,
                      fontStyle: ButtonFontStyle.RobotoMedium14Gray300,
                    ),
                  ],
                ),
              ),
              Container(
                width: getHorizontalSize(
                  328.00,
                ),
                margin: getMargin(
                  top: 38,
                ),
                padding: getPadding(
                  left: 36,
                  top: 10,
                  right: 36,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray90001,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      28.00,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: getMargin(
                        bottom: 23,
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: ColorConstant.whiteA700,
                          width: getHorizontalSize(
                            2.00,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            4.00,
                          ),
                        ),
                      ),
                      child: Container(
                        height: getVerticalSize(
                          46.00,
                        ),
                        width: getHorizontalSize(
                          103.00,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              4.00,
                            ),
                          ),
                          border: Border.all(
                            color: ColorConstant.whiteA700,
                            width: getHorizontalSize(
                              2.00,
                            ),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: getVerticalSize(
                                  38.00,
                                ),
                                width: getHorizontalSize(
                                  103.00,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      4.00,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: ColorConstant.whiteA700,
                                    width: getHorizontalSize(
                                      2.00,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      4.00,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: getHorizontalSize(
                                        103.00,
                                      ),
                                      padding: getPadding(
                                        left: 4,
                                        right: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.gray90001,
                                      ),
                                      child: Text(
                                        "Fälligkeitstermin",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: ColorConstant.whiteA700,
                                          fontSize: getFontSize(
                                            12,
                                          ),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.40,
                                          height: 1.25,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 4,
                                        top: 11,
                                      ),
                                      child: Text(
                                        "dd.MM.yyyy",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: ColorConstant.gray300,
                                          fontSize: getFontSize(
                                            16,
                                          ),
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.50,
                                          height: 1.19,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: getHorizontalSize(
                  328.00,
                ),
                margin: getMargin(
                  top: 34,
                ),
                padding: getPadding(
                  left: 12,
                  top: 9,
                  right: 12,
                  bottom: 9,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray800,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                    topRight: Radius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomFloatingEditText(
                      width: 300,
                      focusNode: FocusNode(),
                    ),
                  ],
                ),
              ),
              Container(
                width: getHorizontalSize(
                  328.00,
                ),
                margin: getMargin(
                  top: 26,
                ),
                padding: getPadding(
                  left: 12,
                  top: 9,
                  right: 12,
                  bottom: 9,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray800,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                    topRight: Radius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomFloatingEditText(
                      width: 300,
                      focusNode: FocusNode(),
                    ),
                  ],
                ),
              ),
              Container(
                width: getHorizontalSize(
                  328.00,
                ),
                margin: getMargin(
                  top: 26,
                ),
                padding: getPadding(
                  left: 12,
                  top: 8,
                  right: 12,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray800,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                    topRight: Radius.circular(
                      getHorizontalSize(
                        4.00,
                      ),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFloatingEditText(
                      width: 300,
                      focusNode: FocusNode(),
                      margin: getMargin(
                        bottom: 1,
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 26,
                  bottom: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      height: 50,
                      width: 116,
                      text: "Abbrechen",
                    ),
                    CustomButton(
                      height: 50,
                      width: 116,
                      text: "Speichern",
                      margin: getMargin(
                        left: 30,
                      ),
                      variant: ButtonVariant.FillIndigo90002,
                      fontStyle: ButtonFontStyle.RobotoMedium14WhiteA700,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: size.width,
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
                  mainAxisSize: MainAxisSize.min,
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
                  mainAxisSize: MainAxisSize.min,
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
                  mainAxisSize: MainAxisSize.min,
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
                  mainAxisSize: MainAxisSize.min,
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
                              svgPath: ImageConstant.imgCheckmark24x24,
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
    );
  }
}
