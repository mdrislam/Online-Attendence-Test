// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';
import 'package:online_attendence_task/app/data/model/storeresponse.dart';

import 'package:online_attendence_task/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController with StateMixin<List<Store>> {
  HomeProvider provider;
  var storeList = <Store>[].obs;
  HomeController({
    required this.provider,
  });

  @override
  void onInit() {
    getStoreList();
    super.onInit();
  }

  @override
  void onClose() {}

/*
Get Store List from Server
*/
  getStoreList() async {
    change(null, status: RxStatus.loading());
    
    await provider.getStoreList().then((response) {
      try {
        if (response.statusCode == 200) {
          storeList.value =
              StoreResponse.fromJson(json.decode(response.body)).data ?? [];

          change(storeList, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error('Something went to wrong !'));
        }
      } catch (exp) {
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
