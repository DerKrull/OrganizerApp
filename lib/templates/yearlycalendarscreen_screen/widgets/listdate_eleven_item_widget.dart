import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';

// ignore: must_be_immutable
class ListdateElevenItemWidget extends StatelessWidget {
  ListdateElevenItemWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        left: 3,
        top: 20.0250015,
        bottom: 20.0250015,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "6",
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
              left: 37,
            ),
            child: Text(
              "7",
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
            ),
            child: Text(
              "8",
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
            ),
            child: Text(
              "9",
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
              left: 33,
            ),
            child: Text(
              "10",
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
              "11",
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
              left: 31,
            ),
            child: Text(
              "12",
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
    );
  }
}
