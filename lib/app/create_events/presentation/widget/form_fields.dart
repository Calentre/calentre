import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

class CreateEventFormFields extends StatelessWidget {
  const CreateEventFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter Event Name"),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Event Name",
                filled: true,
              ),
              cursorColor: AppColors.foundation.white,
            )
          ],
        ))
      ],
    );
  }
}
