import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otaku_katarougu_app/extensions/hover_extensions.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';

import '../data/model/category_response/theme_response.dart';

ThemeData getTheme(BuildContext context) {
  final textStyle = GoogleFonts.poppins();
  final textStyleTitle = GoogleFonts.bebasNeue();

  final textTheme = GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: textStyleTitle.copyWith(
          fontSize: getResponsiveMassiveFontSize(context),
          fontWeight: FontWeight.w700,
          height: 0.9),
      titleMedium: textStyle.copyWith(
        fontSize: getResponsiveExtraLargeFontSize(context),
        fontWeight: FontWeight.w700,
      ),
      titleSmall: textStyle.copyWith(
        fontSize: getResponsiveMediumFontSize(context),
        fontWeight: FontWeight.w700,
      ),
      displayLarge: textStyle.copyWith(
        fontSize: getResponsiveLargeFontSize(context),
        fontWeight: FontWeight.w600,
      ),
      displayMedium: textStyle.copyWith(
        fontSize: getResponsiveMediumFontSize(context),
        fontWeight: FontWeight.w500,
      ),
      displaySmall: textStyle.copyWith(
        fontSize: getResponsiveSmallFontSize(context),
        fontWeight: FontWeight.w500,
      ));

  final theme = Theme.of(context);
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(),
    textTheme: textTheme,
    primaryTextTheme: textTheme,
  );
}

class BlackTheme implements AppTheme {
  @override
  Color? primaryBackgroundColor = const Color(0xFFD5D9DD);

  @override
  Color? secondaryBackgroundColor = const Color(0xFFA3A6A9);

  @override
  Color? primaryTextColor = const Color(0xFF050505);

  @override
  Color? secondaryTextColor = const Color(0xFF151515);

  @override
  Color? accentColor = const Color(0xFF23262A);

  @override
  Color? panelBackgroundColor = const Color(0xFFA3A6A9);
}

class SilverTheme implements AppTheme {
  @override
  Color? primaryBackgroundColor = const Color(0xFFEFEFEF);

  @override
  Color? secondaryBackgroundColor = const Color(0xFFE8E8E8);

  @override
  Color? primaryTextColor = const Color(0xFF222021);

  @override
  Color? secondaryTextColor = const Color(0xFF3F4142);

  @override
  Color? accentColor = const Color(0xFF5D6377);

  @override
  Color? panelBackgroundColor = const Color(0xFFE8E8E8);
}

class DefaultTheme implements AppTheme {
  @override
  Color? primaryBackgroundColor = const Color(0xFFF5F2EF);

  @override
  Color? secondaryBackgroundColor = const Color(0xFFFFFFFF);

  @override
  Color? primaryTextColor = const Color(0xFF5F4329);

  @override
  Color? secondaryTextColor = const Color(0xFF2C2B28);

  @override
  Color? accentColor = const Color(0xFFD4A626);

  @override
  Color? panelBackgroundColor = const Color(0xFFFFFFFF);
}

class GenericTheme implements AppTheme {
  GenericTheme(
      {this.primaryBackgroundColor,
      this.primaryTextColor,
      this.secondaryBackgroundColor,
      this.secondaryTextColor,
      this.panelBackgroundColor,
      this.accentColor});
  @override
  Color? primaryBackgroundColor;

  @override
  Color? secondaryBackgroundColor;

  @override
  Color? primaryTextColor;

  @override
  Color? secondaryTextColor;

  @override
  Color? accentColor;

  @override
  Color? panelBackgroundColor = const Color(0xFFE1E1E1);

  factory GenericTheme.fromTheme(AThemeResponse theme) => GenericTheme(
      primaryBackgroundColor: theme.primaryBackgroundColor.hexToColor(),
      primaryTextColor: theme.primaryTextColor.hexToColor(),
      secondaryBackgroundColor: theme.secondaryBackgroundColor.hexToColor(),
      secondaryTextColor: theme.secondaryTextColor.hexToColor(),
      accentColor: theme.accent.hexToColor(),
      panelBackgroundColor: theme.panelBackgroundColor.hexToColor());
}

abstract class AppTheme {
  Color? primaryBackgroundColor;
  Color? secondaryBackgroundColor;
  Color? primaryTextColor;
  Color? secondaryTextColor;
  Color? accentColor;
  Color? panelBackgroundColor;
}
