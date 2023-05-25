import 'package:calentre/config/theme/button_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: buttonStyle(context),
        onPressed: () {
          print("The button was pressed");
        },
        child: SizedBox(width: 500, child: Center(child: Text(title))));
  }
}
