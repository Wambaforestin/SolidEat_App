import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/custom_widgets/round_button.dart';
import 'package:solideat/custom_widgets/textfield.dart';
import 'package:solideat/view/login_screens/login_screen.dart';
import 'package:solideat/view/login_screens/password_otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                "Créer un compte",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Entrez vos informations pour vous inscrire",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // CustomTextfield is a custom widget that we created to make the textfield more reusable
              //1. username textfield
              CustomTextfield(
                controller: userName,
                hintText: "Nom",
                icon: Icons.person,
                isPassword: false,
              ),
              //2. email textfield
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                controller: emailController,
                hintText: "Email",
                icon: Icons.email,
                isPassword: false,
              ),
              const SizedBox(
                height: 20,
              ),
              //3.address textfield
              CustomTextfield(
                controller: addressController,
                hintText: "Adresse",
                icon: Icons.location_on,
                isPassword: false,
              ),
              const SizedBox(
                height: 20,
              ),
              //4. password textfield
              CustomTextfield(
                controller: passwordController,
                hintText: "Mot de passe",
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                controller: confirmPasswordController,
                hintText: "Confirmer le mot de passe",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasswordOTPScreen(),
                    ),
                  );
                },
                title: "Créer un compte",
                type: RoundButtonType.primary,
              ),
              const SizedBox(
                height: 90,
              ),
              //6. connnect to your account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous avez déjà un compte?",
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Implement login
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Connectez-vous",
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
