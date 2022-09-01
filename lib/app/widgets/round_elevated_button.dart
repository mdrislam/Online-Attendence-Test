import 'package:flutter/material.dart';
import 'package:online_attendence_task/app/data/theme/customstyle.dart';


class RoundedElevatedButton extends StatelessWidget {
  final double width;
  final VoidCallback onPressed;
  final String childText;

  const RoundedElevatedButton(
      {super.key,
      required this.width,
      required this.onPressed,
      required this.childText});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            elevation: 10,
            padding: const EdgeInsets.only(
                left: 14, right: 14, top: 14, bottom: 14)),
        child: Text(childText, style: CustomStyle.buttonTextStyle),
      ),
    );
  }
}
