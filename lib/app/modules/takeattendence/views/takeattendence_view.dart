import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:online_attendence_task/app/data/Utilcontroller/geolocator_controller.dart';
import 'package:online_attendence_task/app/widgets/customfromfield.dart';
import 'package:online_attendence_task/app/widgets/round_elevated_button.dart';

import '../controllers/takeattendence_controller.dart';

class TakeattendenceView extends GetView<TakeattendenceController> {
  const TakeattendenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Attendence'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.attendenceFromKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    textEditingController: controller.nameController,
                    lebleText: 'Name',
                    hintText: 'enter name here',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    textEditingController: controller.userIdController,
                    lebleText: 'User ID',
                    hintText: 'enter user id here',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RoundedElevatedButton(
                    width: double.infinity * .5,
                    childText: 'Submit',
                    onPressed: () {
                      controller.getValidate(
                          latitude:
                              Get.find<GeoLocatorController>().latitude.value,
                          longitude:
                              Get.find<GeoLocatorController>().longitude.value);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
