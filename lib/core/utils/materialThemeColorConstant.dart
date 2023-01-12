import 'dart:ui';
import 'package:flutter/material.dart';

class CustomMaterialThemeColorConstant {
  static DarkMaterialThemeColors dark = DarkMaterialThemeColors();
  static LightMaterialThemeColors light = LightMaterialThemeColors();
}

class LightMaterialThemeColors {
  final Color primary = fromInt(0xFF094EE7);
  final Color onPrimary = fromInt(0xFFFFFFFF);
  final Color primaryContainer = fromInt(0xFFDCE1FF);
  final Color onPrimaryContainer = fromInt(0xFF001551);
  final Color secondary = fromInt(0xFF4459A9);
  final Color onSecondary = fromInt(0xFFFFFFFF);
  final Color secondaryContainer = fromInt(0xFFDDE1FF);
  final Color onSecondaryContainer = fromInt(0xFF001552);
  final Color tertiary = fromInt(0xFF00658F);
  final Color onTertiary = fromInt(0xFFFFFFFF);
  final Color tertiaryContainer = fromInt(0xFFC7E7FF);
  final Color onTertiaryContainer = fromInt(0xFF001E2E);
  final Color error = fromInt(0xFFBA1A1A);
  final Color errorContainer = fromInt(0xFFFFDAD6);
  final Color onError = fromInt(0xFFFFFFFF);
  final Color onErrorContainer = fromInt(0xFF410002);
  final Color background = fromInt(0xFFFEFBFF);
  final Color onBackground = fromInt(0xFF1B1B1F);
  final Color surface = fromInt(0xFFFEFBFF);
  final Color onSurface = fromInt(0xFF1B1B1F);
  final Color surfaceVariant = fromInt(0xFFE2E1EC);
  final Color onSurfaceVariant = fromInt(0xFF45464F);
  final Color outline = fromInt(0xFF767680);
  final Color onInverseSurface = fromInt(0xFFF2F0F4);
  final Color inverseSurface = fromInt(0xFF303034);
  final Color inversePrimary = fromInt(0xFFB7C4FF);
  final Color shadow = fromInt(0xFF000000);
  final Color surfaceTint = fromInt(0xFF094EE7);
  final Color surface1 = generateSurfaceColors(1);
  final Color surface2 = generateSurfaceColors(2);
  final Color surface3 = generateSurfaceColors(3);
  final Color surface4 = generateSurfaceColors(4);
  final Color surface5 = generateSurfaceColors(5);

  static Color generateSurfaceColors(int level) {
    double opacity = 0.0;
    switch (level) {
      case 1:
        {
          opacity = 0.05;
        }
        break;
      case 2:
        {
          opacity = 0.08;
        }
        break;
      case 3:
        {
          opacity = 0.11;
        }
        break;
      case 4:
        {
          opacity = 0.12;
        }
        break;
      case 5:
        {
          opacity = 0.14;
        }
        break;
    }
    return Color.alphaBlend(
        fromInt(0xFF094EE7).withOpacity(opacity), fromInt(0xFFFEFBFF));
        //surfacetint and surface
  }

  static Color fromInt(int hexInt) {
    return Color(hexInt);
  }
}

class DarkMaterialThemeColors {
  final Color primary = fromInt(0xFFB7C4FF);
  final Color onPrimary = fromInt(0xFF002780);
  final Color primaryContainer = fromInt(0xFF0039B4);
  final Color onPrimaryContainer = fromInt(0xFFDCE1FF);
  final Color secondary = fromInt(0xFFc2c5dd);
  final Color onSecondary = fromInt(0xFF2b3042);
  final Color secondaryContainer = fromInt(0xFF424659);
  final Color onSecondaryContainer = fromInt(0xFFdee1f9);
  final Color tertiary = fromInt(0xFF85CFFF);
  final Color onTertiary = fromInt(0xFF00344C);
  final Color tertiaryContainer = fromInt(0xFF004C6D);
  final Color onTertiaryContainer = fromInt(0xFFC7E7FF);
  final Color error = fromInt(0xFFFFB4AB);
  final Color errorContainer = fromInt(0xFF93000A);
  final Color onError = fromInt(0xFF690005);
  final Color onErrorContainer = fromInt(0xFFFFDAD6);
  final Color background = fromInt(0xFF1B1B1F);
  final Color onBackground = fromInt(0xFFE4E1E6);
  final Color surface = fromInt(0xFF1B1B1F);
  final Color onSurface = fromInt(0xFFE4E1E6);
  final Color surfaceVariant = fromInt(0xFF45464F);
  final Color onSurfaceVariant = fromInt(0xFFC6C5D0);
  final Color outline = fromInt(0xFF90909A);
  final Color onInverseSurface = fromInt(0xFF1B1B1F);
  final Color inverseSurface = fromInt(0xFFE4E1E6);
  final Color inversePrimary = fromInt(0xFF094EE7);
  final Color shadow = fromInt(0xFF000000);
  final Color surfaceTint = fromInt(0xFFB7C4FF);
  final Color surface1 = generateSurfaceColors(1);
  final Color surface2 = generateSurfaceColors(2);
  final Color surface3 = generateSurfaceColors(3);
  final Color surface4 = generateSurfaceColors(4);
  final Color surface5 = generateSurfaceColors(5);

  static Color generateSurfaceColors(int level) {
    double opacity = 0.0;
    switch(level) {
      case 1: {
        opacity = 0.05;
      } break;
      case 2: {
        opacity = 0.08;
      } break;
      case 3: {
        opacity = 0.11;
      } break;
      case 4: {
        opacity = 0.12;
      } break;
      case 5: {
        opacity = 0.14;
      } break;
    }
    return Color.alphaBlend(fromInt(0xFFB7C4FF).withOpacity(opacity), fromInt(0xFF1B1B1F));
    //surfacetint and surface
  }

  static Color fromInt(int hexInt) {
    return Color(hexInt);
  }
}
