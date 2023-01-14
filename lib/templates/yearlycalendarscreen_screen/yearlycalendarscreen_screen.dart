import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';

import '../yearlycalendarscreen_screen/widgets/listdate_eleven_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/app_bar/appbar_image.dart';
import 'package:organizer_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:organizer_app/widgets/app_bar/custom_app_bar.dart';
import 'package:organizer_app/widgets/custom_button.dart';
import 'package:organizer_app/widgets/custom_drop_down.dart';

class YearlycalendarscreenScreen extends StatelessWidget {
  List<String> dropdownItemList = ["test", "test1", "test2", "test3"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        appBar: CustomTopAppBar(title: "Month ...",showThreePoints: true, children: [],),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              height: getVerticalSize(
                629.00,
              ),
              width: getHorizontalSize(
                336.00,
              ),
              margin: getMargin(
                left: 16,
                top: 19,
                right: 8,
                bottom: 5,
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: getPadding(
                        right: 8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    top: 16,
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
                                      CustomImageView(
                                        svgPath: ImageConstant.imgArrowleft,
                                        height: getSize(
                                          24.00,
                                        ),
                                        width: getSize(
                                          24.00,
                                        ),
                                        margin: getMargin(
                                          left: 101,
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
                                    top: 41,
                                    right: 28,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      top: 40,
                                      right: 12,
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
                                              color:
                                                  ColorConstant.deepPurple100,
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
                                Padding(
                                  padding: getPadding(
                                    left: 25,
                                    top: 39,
                                    right: 25,
                                  ),
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return ListdateElevenItemWidget();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 25,
                                      top: 52,
                                      bottom: 26,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "27",
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
                                        Padding(
                                          padding: getPadding(
                                            left: 30,
                                          ),
                                          child: Text(
                                            "28",
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
                                            left: 30,
                                          ),
                                          child: Text(
                                            "29",
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
                                            left: 30,
                                          ),
                                          child: Text(
                                            "30",
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
                                            left: 30,
                                          ),
                                          child: Text(
                                            "31",
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
                  CustomButton(
                    height: 56,
                    width: 56,
                    text: "+",
                    variant: ButtonVariant.OutlineBlack9004c,
                    shape: ButtonShape.RoundedBorder16,
                    padding: ButtonPadding.PaddingAll8,
                    fontStyle: ButtonFontStyle.RobotoRegular32,
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
