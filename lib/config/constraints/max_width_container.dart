import 'package:calentre/config/constraints/constraints.dart';
import 'package:flutter/material.dart';

class WebContainer extends StatelessWidget {
  const WebContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: WebConstraints.maxWidth),
    );
  }
}
