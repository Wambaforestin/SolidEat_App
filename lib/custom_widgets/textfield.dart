import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, this.controller, this.hintText, required this.icon, required this.isPassword});

  final TextEditingController? controller;
  final String? hintText;
  final IconData icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.primaryTextFieldColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: isPassword,
        autocorrect: false,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
