import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                'assets/images/welcome_img.png',
                width: size.width,
              ),
              //position the image, Circular_logo_SolidEat
              Image.asset(
                'assets/images/logo_SolidEat.png',
                width: size.width * 0.6,
                height: size.width * 0.6,
                fit: BoxFit.contain,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primaryButtonBorderColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
          ),
          SizedBox(height: size.height * 0.1),
        ],
      ),
    );
  }
}
