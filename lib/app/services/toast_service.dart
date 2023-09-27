import './/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  void showToast(String message, {Toast length = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: length == Toast.LENGTH_SHORT ? 4 : 8,
        backgroundColor: Colors.grey[100],
        textColor: Colors.black87,
        fontSize: 14.0);
  }

  void showCustomToast(BuildContext context, String message,
      {Toast length = Toast.LENGTH_SHORT}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey[100],
        border: Border.all(color: kcPrimaryColor, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    FToast().init(context).showToast(
          child: toast,
          gravity: ToastGravity.CENTER,
          toastDuration:
              Duration(seconds: length == Toast.LENGTH_SHORT ? 4 : 8),
        );
  }
}
