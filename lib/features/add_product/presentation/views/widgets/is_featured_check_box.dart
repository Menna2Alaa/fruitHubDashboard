import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utilies/app_text_styles.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/views/widgets/custome_check_box.dart';

class IsFeaturedCheckBox extends StatelessWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomeCheckBox(onChanged: onChanged),
        Expanded(child: SizedBox(width: 16)),
        //Checkbox(value: false, onChanged: (value) {}),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Is Featured Item?',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
