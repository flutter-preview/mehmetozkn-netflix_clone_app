import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastMessage {
  static ToastMessage? _instance;
  static ToastMessage get instance {
    _instance ??= ToastMessage._init();
    return _instance!;
  }

  ToastMessage._init();

  buildErrorMessage(String text) {
    Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 14,
    );
  }
}
