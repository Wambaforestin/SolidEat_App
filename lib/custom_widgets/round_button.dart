import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';

enum RoundButtonType {
  primary,
  secondary,
}

class RoundButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  final double fontSize;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.fontSize = 16,
      this.type = RoundButtonType.primary});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          //using the if else statement to determine the color of the button
          color: widget.type == RoundButtonType.primary
              ? AppColors.primaryButtonColor
              : AppColors.quatinaryButtonColor,
          borderRadius: BorderRadius.circular(30.0),
          border:
              Border.all(color: AppColors.primaryButtonBorderColor, width: 2.0),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.type == RoundButtonType.primary
                  ? AppColors.whiteColor
                  : AppColors.secondaryTextColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
