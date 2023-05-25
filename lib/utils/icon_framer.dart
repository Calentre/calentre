import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

SizedBox iconFramer({required String imageTitle}) {
  if (imageTitle.contains(".svg")) {
    return SizedBox(
      height: 50,
      child: SvgPicture.asset('asset/images/$imageTitle'),
    );
  } else {
    return SizedBox(
      height: 50,
      child: Image.asset('asset/images/$imageTitle'),
    );
  }
}
