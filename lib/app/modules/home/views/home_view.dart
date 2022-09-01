import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:online_attendence_task/app/data/const/assetsfile.dart';
import 'package:online_attendence_task/app/modules/internetcheck/controllers/internetcheck_controller.dart';
import 'package:online_attendence_task/app/widgets/emptyerrornointernet_view.dart';
import 'package:online_attendence_task/app/widgets/storecard.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Get.find<InternetcheckController>().connectionStatus.value != 1
            ? EmptyErrorNoInternetView(
                ishome: true,
                image: AssetsFile.NO_INTERNET,
                title: 'No Internet',
                description: "Check your internet connection",
                buttonText: "Retry",
                onPressed: () {
                  // controller.getDashBoardData();
                },
              )
            : controller.obx(
                (storeList) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: ((context, index) => StoreCard(
                        name: "name", address: "address", press: () {})),
                  ),
                ),
                onLoading: Center(
                  child: Lottie.asset(AssetsFile.LOADING,
                      height: 300, width: double.infinity),
                ),
                onEmpty: EmptyErrorNoInternetView(
                  ishome: true,
                  image: AssetsFile.EMPTYLIST,
                  title: 'no data found !',
                  description: "there are no store data",
                  buttonText: "Reload",
                  onPressed: () {
                    // controller.getDashBoardData();
                  },
                ),
                onError: ((error) => EmptyErrorNoInternetView(
                      ishome: true,
                      image: AssetsFile.EMPTYLIST,
                      title: 'Errio',
                      description: error.toString(),
                      buttonText: "Retry",
                      onPressed: () {
                        // controller.getDashBoardData();
                      },
                    )),
              ),
      ),
    );
  }
}
