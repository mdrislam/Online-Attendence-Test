import 'package:get/get.dart';
import 'package:online_attendence_task/app/modules/home/providers/home_provider.dart';
import 'package:online_attendence_task/app/modules/internetcheck/controllers/internetcheck_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InternetcheckController(), permanent: true);
    Get.lazyPut<HomeController>(
      () => HomeController(provider: HomeProvider()),
    );
  }
}
