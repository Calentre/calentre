import 'package:flutter/material.dart';

class AppColors {
  static Grey grey = Grey.instance;
  static Foundation foundation = Foundation.instance;
}

//All colors must be created as a singleton.
class Grey {
  Grey._();
  static Grey? _instance;
  static Grey get instance {
    _instance ??= Grey._();
    return _instance!;
  }

  Color s300 = const Color(0xffB3B3B3);
  Color s500 = const Color(0xff808080);
  Color s700 = const Color(0xff4D4D4D);
  Color s850 = const Color(0xff262626);
  Color s900 = const Color(0xff1A1A1A);
  Color s950 = const Color(0xff0D0D0D);
}

class Foundation {
  Foundation._();
  static Foundation? _instance;
  static Foundation get instance {
    _instance ??= Foundation._();
    return _instance!;
  }

  Color white = const Color(0xffFFFFFF);
  Color link = const Color(0xff4E95FF);
  Color error = const Color(0xffAB0000);
}
