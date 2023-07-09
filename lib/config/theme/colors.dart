import 'package:flutter/material.dart';

class AppColors {
  static Grey grey = Grey.instance;
  static Foundation foundation = Foundation.instance;
  static Gradient gradient = Gradient.instance;
  static Accent accent = Accent.instance;
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
  Color success = const Color(0xff00D923);
}

class Gradient {
  Gradient._();
  static Gradient? _instance;
  static Gradient get instance {
    _instance ??= Gradient._();
    return _instance!;
  }

  Color g011 = const Color(0xff3A77ED);
  Color g012 = const Color(0xffA600CF);
  Color g021 = const Color(0xffF8B453);
  Color g022 = const Color(0xffF8419D);
  Color g031 = const Color(0xffA675E9);
  Color g032 = const Color(0xff0AAEF8);
}

class Accent {
  Accent._();
  static Accent? _instance;
  static Accent get instance {
    _instance ??= Accent._();
    return _instance!;
  }

  Color blue = const Color(0xff002357);
  Color purpleMute = const Color(0xffE9D9FF);
}
