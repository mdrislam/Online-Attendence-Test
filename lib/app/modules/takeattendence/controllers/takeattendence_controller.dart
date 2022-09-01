// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:online_attendence_task/app/modules/takeattendence/providers/takeattendence_provider.dart';
import 'package:online_attendence_task/app/widgets/custom_progress_dialog.dart';

class TakeattendenceController extends GetxController {
  TakeattendenceProvider provider;
  TakeattendenceController({
    required this.provider,
  });
  final GlobalKey<FormState> attendenceFromKey = GlobalKey<FormState>();
  late TextEditingController nameController, userIdController;
  @override
  void onInit() {
    nameController = TextEditingController();
    userIdController = TextEditingController();
  }

/*
  Get FromValidation
*/
  getValidate({var latitude, var longitude}) {
    final isValid = attendenceFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (latitude != "" || longitude != "") {
      getSubmit(
          name: nameController.text,
          userId: userIdController.text,
          latitude: latitude,
          longitude: longitude);
    } else {
      Get.snackbar(
        'Alert ! ',
        'Location services are disabled. Or Something went to wrong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /*
    To Get Submit Employee Attendence 
    */
  getSubmit(
      {required final name,
      required final userId,
      required var latitude,
      required var longitude}) async {
    showLoaderDialog(Get.context);

    await provider
        .getSubmit(
            name: name,
            uid: userId,
            latitude: latitude,
            longitude: longitude,
            requestId: generateRandomString(25))
        .then((response) {
      try {
        if (response.statusCode == 200) {
          Get.back();
          nameController.clear();
          userIdController.clear();
          Get.snackbar(
            'Success',
            'Succefully Attendent ',
            backgroundColor: const Color.fromARGB(255, 3, 43, 15),
            colorText: Colors.white,
          );
        } else {
          Get.back();
          Get.snackbar(
            'Alert ! ',
            'Attendence Not Save',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } catch (exp) {
        Get.back();
        Get.snackbar(
          'ERROR',
          exp.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }).onError((error, stackTrace) {
      Get.back();
      Get.snackbar(
        'ERROR',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }

  /*
    To Generate Unique ID
    */
  String generateRandomString(int length) {
    final random = Random();
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => availableChars[random.nextInt(availableChars.length)])
        .join();

    return randomString;
  }

  @override
  void onClose() {
    nameController.dispose();
    userIdController.dispose();
  }
}
