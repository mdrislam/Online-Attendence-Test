import 'package:flutter/material.dart';
import 'package:online_attendence_task/app/data/theme/customstyle.dart';

import '../data/model/storeresponse.dart';

class StoreCard extends StatelessWidget {
  final Store store;
  final VoidCallback press;
  const StoreCard({Key? key, required this.store, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(255, 214, 214, 214),
      elevation: 10,
      color: Color.fromRGBO(255, 250, 250, 1),
      child: ListTile(
        onTap: press,
        
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 9, 97, 41),
              child: Text(
                store.name!.substring(0, 1).toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: const Color.fromARGB(255, 255, 243, 243)),
              )),
        ),
        title: Text(
          store.name.toString(),
          style: CustomStyle.titleStyle
              .copyWith(fontSize: 24, color: Colors.black),
        ),
        subtitle: Text(
          store.address.toString(),
          style: CustomStyle.descriptinStyle
              .copyWith(color: Colors.grey.shade600, fontSize: 12),
        ),
      ),
    );
  }
}
