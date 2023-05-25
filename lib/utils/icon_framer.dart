import 'package:flutter/material.dart';

SizedBox iconFramer({required String imageTitle}) {
  return SizedBox(
    height: 50,
    child: Image.asset('asset/images/$imageTitle'),
  );
}
