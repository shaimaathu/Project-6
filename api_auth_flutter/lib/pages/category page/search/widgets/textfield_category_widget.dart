import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/helper/extintion.dart';
import 'package:flutter/material.dart';

class TextfieldCategory extends StatelessWidget {
  TextfieldCategory({super.key, required this.hintText, this.textController});
  final String hintText;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: context.getWidth() / 2,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: gray),
      child: TextFormField(
        controller: textController,
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
