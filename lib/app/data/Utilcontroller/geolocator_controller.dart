import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorController extends GetxController {
  var latitude = ''.obs;
  var longitude = ''.obs;

  @override
  void onInit() {
    _determinePosition();
  }

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
       Get.snackbar(
          'Alert ! ',
          'Location services are disabled.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(
          'Access Denied ',
          'Location permissions are denied',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      
       Get.snackbar(
          'Error..',
          'Location permissions are permanently denied, we cannot request permissions.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
    }

    Geolocator.getPositionStream().listen((position) {
      latitude.value = position.latitude.toString();
      longitude.value = position.longitude.toString();
    });
  }
}
