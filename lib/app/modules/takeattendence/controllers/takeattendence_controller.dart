import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TakeattendenceController extends GetxController {
  final GlobalKey<FormState> attendenceFromKey = GlobalKey<FormState>();

  late TextEditingController nameController, userIdController;
  var email = '';
  var password = '';

  final count = 0.obs;
  RxBool isRemember = true.obs;
  RxBool isVisible = true.obs;
  @override
  void onInit() {
    nameController = TextEditingController();
    userIdController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    userIdController.dispose();
  }

/*
  Get FromValidation
*/
  getValidate() {
    final isValid = attendenceFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    getSubmit(name: nameController.text, userId: userIdController.text);
  }

  getSubmit({required final name, required final userId}) {}
}
