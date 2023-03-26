import 'dart:async';
import 'package:flutter/services.dart';

class TimeService {
  static const platform = MethodChannel('time_service');

  static Future<String> getCurrentTime() async {
    String time;
    try {
      time = await platform.invokeMethod('getCurrentTime');
    } on PlatformException catch (e) {
      time = 'Failed to get time: ${e.message}';
    }
    return time;
  }
}
