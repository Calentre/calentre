import 'package:calentre/config/extensions/padding.dart';
import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Calentre",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox().h2(),
                const Text("Logo"),
                const Text("Logo"),
                const Text("Logo"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
