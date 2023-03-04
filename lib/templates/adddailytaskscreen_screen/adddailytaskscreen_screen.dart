import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/CustomTopAppBar.dart';
import 'package:organizer_app/widgets/custom_button.dart';

import '../../widgets/ThreePointPopUpMenu.dart';

class AdddailytaskscreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: buildAppBar(title: "Add Daily Task", context: context),
        appBar: CustomTopAppBar(
            title: "Add daily task",
            showDelete: false,
            showThreePoints: true,
            menu: ThreePointPopUpMenu(
                onSelected: (int result) {}, entries: ["Test"]).build(context)),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 4,
                        bottom: 3,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorConstant.blueGray100,
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
                              top: 2,
                            ),
                            child: Text(
                              "Task 10",
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
                    CustomImageView(
                      svgPath: ImageConstant.imgClose,
                      height: getSize(
                        24.00,
                      ),
                      width: getSize(
                        24.00,
                      ),
                      margin: getMargin(
                        top: 7,
                        bottom: 7,
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
                      variant: ButtonVariant.OutlineGray500_1,
                      shape: ButtonShape.CustomBorderTL100,
                      padding: ButtonPadding.PaddingAll11,
                      fontStyle: ButtonFontStyle.RobotoMedium14Gray300,
                    ),
                    CustomButton(
                      height: 40,
                      width: 164,
                      text: "Daily",
                      variant: ButtonVariant.OutlineGray500,
                      shape: ButtonShape.CustomBorderLR100,
                      padding: ButtonPadding.PaddingT11,
                      fontStyle: ButtonFontStyle.RobotoMedium14,
                      prefixWidget: Container(
                        padding: getPadding(
                          right: 40,
                          bottom: 1,
                        ),
                        margin: getMargin(),
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
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgCheckmark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 408,
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
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
