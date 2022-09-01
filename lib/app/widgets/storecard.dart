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
      color: Colors.white10,
      child: ListTile(
        onTap: press,
        title: Text(
          store.name.toString(),
          textAlign: TextAlign.center,
          style: CustomStyle.titleStyle
              .copyWith(fontSize: 24, color: Colors.redAccent),
        ),
        subtitle: Text(
          store.address.toString(),
          textAlign: TextAlign.center,
          style: CustomStyle.descriptinStyle
              .copyWith(color: Colors.grey.shade600, fontSize: 12),
        ),
      ),
    );
  }
}
