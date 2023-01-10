import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';
import 'package:organizer_app/widgets/custom_button.dart';

class SplashscreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 22,
            right: 22,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                height: 74,
                width: 316,
                text: "Organizer",
                variant: ButtonVariant.FillGray900,
                shape: ButtonShape.RoundedBorder20,
                padding: ButtonPadding.PaddingAll11,
                fontStyle: ButtonFontStyle.InterRegular36,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
