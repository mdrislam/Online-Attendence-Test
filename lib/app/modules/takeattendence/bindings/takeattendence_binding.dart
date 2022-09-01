import 'package:get/get.dart';
import 'package:online_attendence_task/app/data/Utilcontroller/geolocator_controller.dart';
import 'package:online_attendence_task/app/modules/takeattendence/providers/takeattendence_provider.dart';

import '../controllers/takeattendence_controller.dart';

class TakeattendenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeoLocatorController>(
      () => GeoLocatorController(),
    );
    Get.lazyPut<TakeattendenceController>(
      () => TakeattendenceController(provider: TakeattendenceProvider()),
    );
  }
}
