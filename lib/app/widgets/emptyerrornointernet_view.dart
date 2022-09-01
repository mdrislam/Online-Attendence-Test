import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:online_attendence_task/app/data/theme/customstyle.dart';
import 'package:online_attendence_task/app/widgets/round_elevated_button.dart';

class EmptyErrorNoInternetView extends StatelessWidget {
  final String title, description, buttonText, image;
  final VoidCallback onPressed;
  final bool? ishome;
  const EmptyErrorNoInternetView(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.image,
      required this.onPressed,
      this.ishome = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Lottie.asset(
                image,
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: CustomStyle.titleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: CustomStyle.descriptinStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              RoundedElevatedButton(
                width: 200,
                onPressed: onPressed,
                childText: buttonText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
