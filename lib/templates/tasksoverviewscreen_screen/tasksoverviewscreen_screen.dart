import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/CustomBottomAppBar.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:organizer_app/widgets/app_bar/appbar_image.dart';
import 'package:organizer_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:organizer_app/widgets/app_bar/custom_app_bar.dart';
import 'package:organizer_app/widgets/custom_button.dart';

class TasksoverviewscreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomTopAppBar(title: "Tasks",showThreePoints: true, children: [],),
        backgroundColor: ColorConstant.gray900,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(
                left: 15,
                top: 24,
                right: 8,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: getVerticalSize(
                      296.00,
                    ),
                    width: getHorizontalSize(
                      329.00,
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: getMargin(
                              left: 1,
                            ),
                            padding: getPadding(
                              left: 9,
                              top: 7,
                              right: 9,
                              bottom: 7,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.gray900,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  20.00,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    left: 8,
                                  ),
                                  child: Text(
                                    "Tägliche Aufgaben",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorConstant.whiteA700,
                                      fontSize: getFontSize(
                                        22,
                                      ),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        svgPath: ImageConstant.imgClock,
                                        height: getSize(
                                          47.00,
                                        ),
                                        width: getSize(
                                          47.00,
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 8,
                                          top: 13,
                                          bottom: 8,
                                        ),
                                        child: Text(
                                          "Daily Task 1",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorConstant.whiteA700,
                                            fontSize: getFontSize(
                                              20,
                                            ),
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 9,
                                    top: 50,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: getSize(
                                          29.00,
                                        ),
                                        width: getSize(
                                          29.00,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              14.00,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: ColorConstant.blueGray500,
                                            width: getHorizontalSize(
                                              2.00,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 17,
                                          top: 3,
                                        ),
                                        child: Text(
                                          "Daily Task 2",
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 9,
                                    top: 57,
                                    bottom: 21,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: getSize(
                                          29.00,
                                        ),
                                        width: getSize(
                                          29.00,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              14.00,
                                            ),
                                          ),
                                          border: Border.all(
                                            color: ColorConstant.blueGray500,
                                            width: getHorizontalSize(
                                              2.00,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          left: 17,
                                          top: 3,
                                        ),
                                        child: Text(
                                          "Daily Task 3",
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              328.00,
                            ),
                            margin: getMargin(
                              top: 34,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.black900,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              328.00,
                            ),
                            margin: getMargin(
                              top: 121,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.black900,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: getVerticalSize(
                              1.00,
                            ),
                            width: getHorizontalSize(
                              328.00,
                            ),
                            margin: getMargin(
                              bottom: 86,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.black900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getVerticalSize(
                      309.00,
                    ),
                    width: getHorizontalSize(
                      337.00,
                    ),
                    margin: getMargin(
                      top: 19,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: getVerticalSize(
                              296.00,
                            ),
                            width: getHorizontalSize(
                              329.00,
                            ),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: getMargin(
                                      left: 1,
                                    ),
                                    padding: getPadding(
                                      left: 9,
                                      top: 7,
                                      right: 9,
                                      bottom: 7,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: getPadding(
                                            bottom: 21,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Aufgaben",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      22,
                                                    ),
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  width: getHorizontalSize(
                                                    112.00,
                                                  ),
                                                  margin: getMargin(
                                                    top: 20,
                                                    right: 4,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgClock,
                                                        height: getSize(
                                                          47.00,
                                                        ),
                                                        width: getSize(
                                                          47.00,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 11,
                                                          bottom: 10,
                                                        ),
                                                        child: Text(
                                                          "Task 1",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            color: ColorConstant
                                                                .whiteA700,
                                                            fontSize:
                                                                getFontSize(
                                                              20,
                                                            ),
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: getHorizontalSize(
                                                  107.00,
                                                ),
                                                margin: getMargin(
                                                  left: 9,
                                                  top: 50,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: getSize(
                                                        29.00,
                                                      ),
                                                      width: getSize(
                                                        29.00,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          getHorizontalSize(
                                                            14.00,
                                                          ),
                                                        ),
                                                        border: Border.all(
                                                          color: ColorConstant
                                                              .blueGray500,
                                                          width:
                                                              getHorizontalSize(
                                                            2.00,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        top: 1,
                                                        bottom: 2,
                                                      ),
                                                      child: Text(
                                                        "Task 2",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .whiteA700,
                                                          fontSize: getFontSize(
                                                            20,
                                                          ),
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: getHorizontalSize(
                                                  108.00,
                                                ),
                                                margin: getMargin(
                                                  left: 9,
                                                  top: 57,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: getSize(
                                                        29.00,
                                                      ),
                                                      width: getSize(
                                                        29.00,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          getHorizontalSize(
                                                            14.00,
                                                          ),
                                                        ),
                                                        border: Border.all(
                                                          color: ColorConstant
                                                              .blueGray500,
                                                          width:
                                                              getHorizontalSize(
                                                            2.00,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        top: 1,
                                                        bottom: 2,
                                                      ),
                                                      child: Text(
                                                        "Task 3",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .whiteA700,
                                                          fontSize: getFontSize(
                                                            20,
                                                          ),
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 51,
                                            top: 47,
                                            right: 57,
                                            bottom: 7,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "30.12.2022",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  fontSize: getFontSize(
                                                    16,
                                                  ),
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 14,
                                                ),
                                                child: Text(
                                                  "Meeting 1",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      16,
                                                    ),
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 29,
                                                ),
                                                child: Text(
                                                  "30.12.2022",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      16,
                                                    ),
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 14,
                                                ),
                                                child: Text(
                                                  "Meeting 1",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      16,
                                                    ),
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 32,
                                                ),
                                                child: Text(
                                                  "30.12.2022",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      16,
                                                    ),
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 14,
                                                ),
                                                child: Text(
                                                  "Meeting 1",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      16,
                                                    ),
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
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
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                    width: getHorizontalSize(
                                      328.00,
                                    ),
                                    margin: getMargin(
                                      top: 34,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.black900,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                    width: getHorizontalSize(
                                      328.00,
                                    ),
                                    margin: getMargin(
                                      top: 121,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.black900,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                    width: getHorizontalSize(
                                      328.00,
                                    ),
                                    margin: getMargin(
                                      bottom: 86,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.black900,
                                    ),
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
