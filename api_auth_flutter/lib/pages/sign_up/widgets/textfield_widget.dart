import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  Textfield({super.key, required this.hintText, this.textController, this.pass = false});
  final String hintText;
  final TextEditingController? textController;
  bool pass;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: context.getWidth() / 1.5,
      height: context.getWidth() / 6,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: gray),
      child: TextFormField(
        controller: textController,
        obscureText: pass,
        enableSuggestions: false,
        decoration: InputDecoration(
            hintText: hintText, enabledBorder: InputBorder.none),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
