import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/custom_widgets/round_button.dart';
import 'package:solideat/view/login_screens/login_screen.dart';
import 'package:solideat/view/login_screens/signup_screen.dart';

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
          //adding a welcome text jsut ontop of the buttons
          SizedBox(height: size.width * 0.25),
          const Text(
            "Bienvenue sur SolidEat, où vous pouvez découvrir plus \nde 500 restaurants de renom à travers la France",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.tertiaryTextColor,
                fontSize: 18,
                fontFamily: 'Roboto Light',
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: size.width * 0.25),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundButton(
                onPressed: () {
                  //TODO: navigate to login screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                title: "connexion",
                type: RoundButtonType.primary,
              )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RoundButton(
                type: RoundButtonType.secondary,
                onPressed: () {
                  //TODO: navigate to sign up screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                title: "créer un compte"),
          ),
        ],
      ),
    );
  }
}
