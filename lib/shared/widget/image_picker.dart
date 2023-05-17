// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final Function() getImage;
  final FileImage? foreGroundImage;
  const ImagePickerWidget(
      {Key? key, required this.getImage, required this.foreGroundImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LoginController controller = LoginController();
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black54,
          foregroundImage: foreGroundImage,
        ),
        TextButton.icon(
          onPressed: getImage,
          icon: const Icon(Icons.image),
          label: const Text("Add Image"),
        )
      ],
    );
  }
}
