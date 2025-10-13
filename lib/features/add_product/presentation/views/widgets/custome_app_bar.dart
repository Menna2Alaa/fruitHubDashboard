import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utilies/app_text_styles.dart';

AppBar buildCustomeAppBar(
  context, {
  required String title,
  Widget? iconWidget,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_outlined),
    ),
    centerTitle: true,
    title: Text(title, style: AppTextStyles.bold19),
    actions: [
      if (iconWidget != null)
        Padding(padding: const EdgeInsets.only(right: 16), child: iconWidget),
    ],
  );
}
