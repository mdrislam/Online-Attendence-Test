import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String lebleText;
  final String hintText;
  const CustomTextFormField(
      {Key? key,
      required this.textEditingController,
      required this.lebleText,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          controller: textEditingController,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 2.5 * 6),
          cursorColor: Colors.greenAccent,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              labelText: lebleText.toString(),
              hintText: hintText.toString(),
              labelStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.orange,
                width: 2,
              )),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                width: 3,
                color: Colors.greenAccent,
              )),
              focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.red)),
              errorStyle: const TextStyle(
                color: Colors.red,
              )),
          validator: (String? value) {
            if (value!.isEmpty) {
              return "Required";
            }
            return null;
          },
        ),
      ),
    );
  }
}
