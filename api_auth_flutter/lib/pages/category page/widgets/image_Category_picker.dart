import 'dart:io';

import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/pages/sign_up/widgets/image_pick.dart';
import 'package:flutter/material.dart';

class ImageCategoryChosen extends StatelessWidget {
  const ImageCategoryChosen(
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
              backgroundImage: FileImage(selectedPath!),
              radius: 100,
            )
          : CircleAvatar(
              backgroundColor: gray,
              radius: 100,
              child: Icon(
                Icons.add,
                size: 80,
                color: whit,
              ),
            ),
    );
  }
}
