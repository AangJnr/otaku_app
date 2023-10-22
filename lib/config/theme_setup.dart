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

class DefaultTheme implements AppTheme {
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

  @override
  Color? tertiaryBackgroundColor = const Color(0xFFE8E8E8);

  @override
  Color? tertiaryTextColor = const Color(0xFFdbdbdb);
}


class GoldTheme implements AppTheme {

// {
// 		"primaryBackgroundColor": "#F5F2EF",
// 		"secondaryBackgroundColor": "#FFFFFF",
// 		"primaryTextColor": "#5F4329",
// 		"secondaryTextColor": "#2C2B28",
// 		"accent": "#D4A626",
// 		"panelBackgroundColor": "#FFFFFF",
// 		"tertiaryTextColor": "#2C2B28"
// 	}
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

  @override
  Color? tertiaryBackgroundColor = const Color(0xFFE8E8E8);

  @override
  Color? tertiaryTextColor = const Color(0xFF2C2B28);
}

class BlackTheme implements AppTheme {
  //"primaryBackgroundColor": "#D5D9DD",
	//	"secondaryBackgroundColor": "#A3A6A9",
	//	"primaryTextColor": "#050505",
		//"accent": "#23262A",
	//	"secondaryTextColor": "#151515",
	//	"tertiaryTextColor": "#D7D7D7",
	//	"panelBackgroundColor": "#A3A6A9"
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

  @override
  Color? tertiaryBackgroundColor = const Color(0xFFE8E8E8);

  @override
  Color? tertiaryTextColor = const Color(0xFFD7D7D7);
}

class GenericTheme implements AppTheme {
  GenericTheme(
      {this.primaryBackgroundColor,
      this.primaryTextColor,
      this.secondaryBackgroundColor,
      this.secondaryTextColor,
      this.panelBackgroundColor,
      this.accentColor,
      this.tertiaryBackgroundColor,
      this.tertiaryTextColor});
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

  @override
  Color? tertiaryBackgroundColor;

  @override
  Color? tertiaryTextColor;
  factory GenericTheme.fromTheme(AThemeResponse theme) => GenericTheme(
      primaryBackgroundColor: theme.primaryBackgroundColor.hexToColor(),
      primaryTextColor: theme.primaryTextColor.hexToColor(),
      secondaryBackgroundColor: theme.secondaryBackgroundColor.hexToColor(),
      secondaryTextColor: theme.secondaryTextColor.hexToColor(),
      accentColor: theme.accent.hexToColor(),
      panelBackgroundColor: theme.panelBackgroundColor.hexToColor(),
      tertiaryBackgroundColor: theme.tertiaryBackgroundColor.hexToColor(),
      tertiaryTextColor: theme.tertiaryTextColor.hexToColor());
}

abstract class AppTheme {
  Color? primaryBackgroundColor;
  Color? secondaryBackgroundColor;
  Color? tertiaryBackgroundColor;

  Color? primaryTextColor;
  Color? secondaryTextColor;
  Color? tertiaryTextColor;
  Color? accentColor;
  Color? panelBackgroundColor;
}
