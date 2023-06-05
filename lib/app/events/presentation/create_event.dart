import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/navbar.dart';
import 'package:flutter/material.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // constraints: BoxConstraints(maxWidth: WebConstraints.maxWidth),
          child: Column(
            children: [
              const NavBar(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("create Event"), Text("Save")],
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.grey.s700,
                        width: 1.0,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
