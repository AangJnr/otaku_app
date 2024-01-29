import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Utils {
  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static void setStatusBarColor(BuildContext context, {bool isLight = true}) {
    SystemChrome.setSystemUIOverlayStyle(isLight
        ? SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            // systemNavigationBarColor: AppColors.whiteColor)
          )
        : SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            // systemNavigationBarColor: AppColors.whiteColor),
          ));
  }

  static bool isColorLight(Color? color) {
    if (color == null) return true;
    // Calculate the perceived brightness of the color using the formula:
    // 0.299 * Red + 0.587 * Green + 0.114 * Blue
    final brightness = color.computeLuminance();

    // You can adjust the threshold as needed.
    // A value around 0.5 is often used, but you can fine-tune it.
    return brightness > 0.5;
  }

  static String parseDate(String? date) {
    try {
      var format = DateFormat('EEE, MMM d yyyy', 'en_US');
      return format.format(DateFormat('dd/MM/yyyy', 'en_US').parse(
        date ?? '',
      ));
    } catch (e) {
      debugPrint(e.toString());
      return "--";
    }
  }

  static getAcronym(String? name) {
    //if (name?.isEmpty == true)
    return "";
    List<String> letters = name!.split(" ");
    if (letters.length == 1) {
      return letters[0][0];
    }

    String s = "";
    for (String letter in letters) {
      s += letter[0];
    }

    return s.length < 3 ? s.toUpperCase() : s.substring(0, 2).toUpperCase();
  }
}
