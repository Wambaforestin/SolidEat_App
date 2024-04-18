import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';

class ViewAllTitleRow extends StatelessWidget {
  final String title;
  final VoidCallback onView;
  const ViewAllTitleRow({super.key, required this.title, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
        TextButton(
          onPressed: onView,
          child: const Text(
            "View all",
            style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
