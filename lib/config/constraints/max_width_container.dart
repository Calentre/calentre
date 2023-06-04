import 'package:calentre/config/constraints/constraints.dart';
import 'package:flutter/material.dart';

class WebContainer extends StatelessWidget {
  const WebContainer({super.key, required this.child, this.height});
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: WebConstraints.maxWidth,
      // constraints: BoxConstraints(maxWidth: WebConstraints.maxWidth),
      child: child,
    );
  }
}
