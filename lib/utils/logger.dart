import 'package:flutter/foundation.dart';

//Calentre Logger
class CL {
  static logError(String message) {
    String redColorCode = '\x1B[31m'; // Red
    debugPrint('$redColorCode CALENTRE: $message');
  }

  static log(String message) {
    String magenta = '\x1b[35m'; // Red
    debugPrint('$magenta CALENTRE: $message');
  }

  static logSuccess(String message) {
    String green = '\x1b[32m'; // Red
    debugPrint('$green CALENTRE: $message');
  }
}
