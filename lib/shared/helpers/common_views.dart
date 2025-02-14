import 'dart:math';

import 'package:movies_app/shared/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonViews {

  static showErrorToast(String message){
    Fluttertoast.showToast(msg: message, gravity: ToastGravity.BOTTOM, backgroundColor: AppColors.errorColor, toastLength: Toast.LENGTH_LONG);
  }

  static showSuccessToast(String message){
    Fluttertoast.showToast(msg: message, gravity: ToastGravity.BOTTOM, backgroundColor: AppColors.greenColor, toastLength: Toast.LENGTH_LONG);
  }

  static Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      1,                   // Opacity
    );
  }

}
