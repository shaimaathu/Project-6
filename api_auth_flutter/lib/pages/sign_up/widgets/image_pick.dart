import 'dart:io';

import 'package:api_auth_flutter/helper/colors.dart';
import 'package:flutter/material.dart';

class ImageAvatar extends StatelessWidget {
  const ImageAvatar(
      {super.key, this.isSelected, this.selectedPath, this.onTap});
  final bool? isSelected;
  final File? selectedPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onTap: onTap,
      child: isSelected!
          ? CircleAvatar(
              radius: 90,
              backgroundImage: FileImage(selectedPath!),
            )
          : CircleAvatar(
              radius: 90,
              backgroundColor: gray,
              child: Icon(
                Icons.add,
                size: 80,
                color: whit,
              ),
            ),
    );
  }
}