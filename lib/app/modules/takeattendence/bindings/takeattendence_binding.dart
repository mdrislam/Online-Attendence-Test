import 'package:get/get.dart';

import '../controllers/takeattendence_controller.dart';

class TakeattendenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TakeattendenceController>(
      () => TakeattendenceController(),
    );
  }
}
