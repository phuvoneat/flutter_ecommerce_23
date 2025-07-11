import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_23/app/data/providers/api_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final _imagePicker = ImagePicker();
  File? image;
  final _apiProvider = Get.find<APIProvider>();

  void pickImage() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = File(file.path); // convert xFile to file
      update();
    }
  }

  void register({
    required String email,
    required String password,
    required String confirmPass,
    required String name,
  }) async {
    try {
      final response = await _apiProvider.signUp(
        email: email,
        password: password,
        confirmPass: confirmPass,
        name: name,
        image: image,
      );
      if (response.statusCode == 200) {
        Get.defaultDialog(
            title: "Success",
            content: const Text("You register success"),
            confirm: TextButton(
                onPressed: () {
                  Get.back(); // back to login
                },
                child: const Text("Ok")));
      } else {
        Get.defaultDialog(
          title: "Failed ",
          content: const Text("Failed to signup"),
        );
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
