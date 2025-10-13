import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utilies/app_colors.dart';

class CustomeCheckBox extends StatefulWidget {
  const CustomeCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<CustomeCheckBox> createState() => _CustomeCheckBoxState();
}

class _CustomeCheckBoxState extends State<CustomeCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChanged(isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 300),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: isChecked ? Colors.transparent : const Color(0xffDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked ? Icon(Icons.check, color: Colors.white) : SizedBox(),
      ),
    );
  }
}
