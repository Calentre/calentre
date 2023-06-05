import 'package:flutter/material.dart';

class CreateEventFormFields extends StatelessWidget {
  const CreateEventFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            child: Column(
          children: [TextFormField()],
        ))
      ],
    );
  }
}
