import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/custom_widgets/round_button.dart';
import 'package:solideat/custom_widgets/round_button_with_icon.dart';
import 'package:solideat/custom_widgets/textfield.dart';
import 'package:solideat/view/login_screens/reset_password_screen.dart';
import 'package:solideat/view/login_screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Connexion",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Accédez à votre compte",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // CustomTextfield is a custom widget that we created to make the textfield more reusable
              //1. email textfield
              CustomTextfield(
                controller: emailController,
                hintText: "Email",
                icon: Icons.email,
                isPassword: false,
              ),
              const SizedBox(
                height: 20,
              ),
              //2. password textfield
              CustomTextfield(
                controller: passwordController,
                hintText: "Mot de passe",
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(
                height: 25,
              ),
              //3. login button
              RoundButton(
                onPressed: () {
                  //TODO: Implement login
                },
                title: "connexion",
                type: RoundButtonType.primary,
              ),
              const SizedBox(
                height: 15,
              ),
              //4. forgot password
              TextButton(
                onPressed: () {
                  //TODO: Implement forgot password
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Mot de passe oublié?",
                  style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //5. login with google, facebook
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Ou connectez-vous avec:",
                  style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // RoundButtonIcon is a custom widget that we created to make the button with icon more reusable
              RoundButtonIcon(
                onPressed: () {},
                title: "Google",
                icon: Icons.mail_rounded,
                color: AppColors.secondaryButtonColor,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundButtonIcon(
                onPressed: () {},
                title: "Facebook",
                icon: Icons.facebook_rounded,
                color: AppColors.tertiaryButtonColor,
              ),
              const SizedBox(
                height: 90,
              ),
              //6. create account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous n'avez pas de compte?",
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Implement create account
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Créer un compte",
                      style: TextStyle(
                        color: AppColors.primaryButtonColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
