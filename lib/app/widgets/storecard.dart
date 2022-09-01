import 'package:flutter/material.dart';
import 'package:online_attendence_task/app/data/theme/customstyle.dart';

class StoreCard extends StatelessWidget {
  final String? name, address;
  final VoidCallback press;
  const StoreCard(
      {Key? key,
      required this.name,
      required this.address,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      title: Text(
        name.toString(),
        style: CustomStyle.titleStyle,
      ),
      subtitle: Text(
        address.toString(),
        style: CustomStyle.descriptinStyle,
      ),
    );
  }
}
