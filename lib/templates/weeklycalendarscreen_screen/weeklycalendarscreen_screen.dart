import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/app_bar/appbar_image.dart';
import 'package:organizer_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:organizer_app/widgets/app_bar/custom_app_bar.dart';
import 'package:organizer_app/widgets/custom_button.dart';
import 'package:organizer_app/widgets/custom_drop_down.dart';

class WeeklycalendarscreenScreen extends StatelessWidget {
  List<String> dropdownItemList = ["test", "test1", "test2", "test3"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(
                left: 16,
                top: 19,
                right: 8,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: getPadding(
                          left: 18,
                          top: 11,
                          right: 18,
                          bottom: 11,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.blueGray800,
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
                          border: Border.all(
                            color: ColorConstant.gray500,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: getHorizontalSize(
                                67.00,
                              ),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgCheckmark,
                                    height: getSize(
                                      18.00,
                                    ),
                                    width: getSize(
                                      18.00,
                                    ),
                                  ),
                                  Text(
                                    "Monat",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.deepPurple50,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.10,
                                      height: 1.21,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          104.00,
                        ),
                        padding: getPadding(
                          left: 30,
                          top: 11,
                          right: 30,
                          bottom: 11,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorConstant.gray500,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child: Text(
                          "Woche",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.gray300,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.10,
                            height: 1.21,
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          104.00,
                        ),
                        padding: getPadding(
                          left: 30,
                          top: 10,
                          right: 40,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              getHorizontalSize(
                                100.00,
                              ),
                            ),
                            bottomRight: Radius.circular(
                              getHorizontalSize(
                                100.00,
                              ),
                            ),
                          ),
                          border: Border.all(
                            color: ColorConstant.gray500,
                            width: getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                        child: Text(
                          "Tag",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.gray300,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.10,
                            height: 1.21,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: getHorizontalSize(
                      328.00,
                    ),
                    margin: getMargin(
                      top: 19,
                      right: 8,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: getHorizontalSize(
                            328.00,
                          ),
                          padding: getPadding(
                            left: 24,
                            top: 10,
                            right: 24,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: ColorConstant.gray800,
                                width: getHorizontalSize(
                                  1.00,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            "Mon, Aug 17",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.gray300,
                              fontSize: getFontSize(
                                32,
                              ),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 1.19,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 24,
                            top: 16,
                            right: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomDropDown(
                                width: 107,
                                focusNode: FocusNode(),
                                icon: Container(
                                  margin: getMargin(
                                    left: 8,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgIcon,
                                  ),
                                ),
                                hintText: "August 2023",
                                margin: getMargin(
                                  top: 3,
                                  bottom: 2,
                                ),
                                items: dropdownItemList,
                                onChanged: (value) {},
                              ),
                              Spacer(),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowleft,
                                height: getSize(
                                  24.00,
                                ),
                                width: getSize(
                                  24.00,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgArrowright,
                                height: getSize(
                                  24.00,
                                ),
                                width: getSize(
                                  24.00,
                                ),
                                margin: getMargin(
                                  left: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 28,
                            top: 29,
                            right: 28,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "S",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.gray300,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.40,
                                  height: 1.25,
                                ),
                              ),
                              Text(
                                "M",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.gray300,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.40,
                                  height: 1.25,
                                ),
                              ),
                              Text(
                                "T",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.gray300,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.40,
                                  height: 1.25,
                                ),
                              ),
                              Text(
                                "W",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.gray300,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.40,
                                  height: 1.25,
                                ),
                              ),
                              Text(
                                "T",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.gray300,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.40,
                                  height: 1.25,
                                ),
                              ),
                              Text(
                                "F",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.gray300,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.40,
                                  height: 1.25,
                                ),
                              ),
                              Text(
                                "S",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorConstant.gray300,
                                  fontSize: getFontSize(
                                    12,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.40,
                                  height: 1.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: getPadding(
                              top: 14,
                              right: 12,
                              bottom: 1,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: Text(
                                    "1",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.gray300,
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
                                    left: 38,
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: Text(
                                    "2",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.gray300,
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
                                    left: 37,
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: Text(
                                    "3",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.gray300,
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
                                    left: 37,
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: Text(
                                    "4",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.gray300,
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
                                Container(
                                  width: getSize(
                                    40.00,
                                  ),
                                  margin: getMargin(
                                    left: 20,
                                  ),
                                  padding: getPadding(
                                    left: 16,
                                    top: 12,
                                    right: 16,
                                    bottom: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        20.00,
                                      ),
                                    ),
                                    border: Border.all(
                                      color: ColorConstant.blue300,
                                      width: getHorizontalSize(
                                        1.00,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "5",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.deepPurple100,
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      top: 20,
                      right: 8,
                    ),
                    padding: getPadding(
                      left: 13,
                      top: 18,
                      right: 13,
                      bottom: 18,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray900,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          20.00,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 6,
                            top: 2,
                            bottom: 9,
                          ),
                          child: Text(
                            "Termin 1",
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
                        Container(
                          width: getHorizontalSize(
                            36.00,
                          ),
                          margin: getMargin(
                            bottom: 3,
                          ),
                          child: Text(
                            "12:00\n13:00",
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.whiteA700,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      top: 15,
                      right: 8,
                    ),
                    padding: getPadding(
                      left: 13,
                      top: 18,
                      right: 13,
                      bottom: 18,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray900,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          20.00,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 6,
                            top: 2,
                            bottom: 9,
                          ),
                          child: Text(
                            "Termin 2",
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
                        Container(
                          width: getHorizontalSize(
                            36.00,
                          ),
                          margin: getMargin(
                            bottom: 3,
                          ),
                          child: Text(
                            "12:00\n13:00",
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.whiteA700,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      top: 15,
                      right: 8,
                    ),
                    padding: getPadding(
                      left: 14,
                      top: 21,
                      right: 14,
                      bottom: 21,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray900,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          20.00,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            left: 5,
                            bottom: 6,
                          ),
                          child: Text(
                            "Termin 3",
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
                        Padding(
                          padding: getPadding(
                            top: 6,
                            bottom: 8,
                          ),
                          child: Text(
                            "ganztägig",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.whiteA700,
                              fontSize: getFontSize(
                                14,
                              ),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    height: 56,
                    width: 56,
                    text: "+",
                    margin: getMargin(
                      top: 34,
                    ),
                    variant: ButtonVariant.OutlineBlack9004c,
                    shape: ButtonShape.RoundedBorder16,
                    padding: ButtonPadding.PaddingAll8,
                    fontStyle: ButtonFontStyle.RobotoRegular32,
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: size.width,
          padding: getPadding(
            left: 20,
            top: 12,
            right: 20,
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
                  left: 10,
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
                  left: 35,
                  bottom: 4,
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
                              svgPath: ImageConstant.imgCalculator,
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
                        top: 4,
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
                  left: 27,
                  top: 4,
                  bottom: 3,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgCheckmark24x24,
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
