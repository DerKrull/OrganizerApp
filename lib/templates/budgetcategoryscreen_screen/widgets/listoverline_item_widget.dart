import 'package:flutter/material.dart';
import 'package:organizer_app/core/app_export.dart';

// ignore: must_be_immutable
class ListoverlineItemWidget extends StatelessWidget {
  ListoverlineItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: ColorConstant.gray90001,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: getPadding(
              top: 11,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    top: 1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "12.03.23",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorConstant.blueGray100,
                          fontSize: getFontSize(
                            12,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.50,
                          height: 1.25,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 3,
                        ),
                        child: Text(
                          "Ausgabe Titel",
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
                      Container(
                        width: getHorizontalSize(
                          247.00,
                        ),
                        child: Text(
                          "Supporting line text lorem ipsum dolor sit amet, consectetur",
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.blueGray100,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            height: 1.43,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 20,
                    bottom: 60,
                  ),
                  child: Text(
                    "12,18€",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.blueGray100,
                      fontSize: getFontSize(
                        16,
                      ),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.50,
                      height: 1.19,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: getVerticalSize(
              1.00,
            ),
            width: size.width,
            margin: getMargin(
              top: 14,
            ),
            decoration: BoxDecoration(
              color: ColorConstant.gray800,
            ),
          ),
        ],
      ),
    );
  }
}
