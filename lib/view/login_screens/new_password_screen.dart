import 'package:flutter/material.dart';
import 'package:solideat/custom_widgets/round_button.dart';
import 'package:solideat/custom_widgets/textfield.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
                "Nouveau mot de passe",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Entrez votre nouveau mot de passe pour continuer",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // CustomTextfield is a custom widget that we created to make the textfield more reusable
              //1. password textfield
              CustomTextfield(
                controller: passwordController,
                hintText: "nouveau mot de passe",
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
              //2. login button
              RoundButton(
                onPressed: () {
                  //TODO: Implement login
                  
                },
                title: "Confirmer",
                type: RoundButtonType.primary,
              ),
              const SizedBox(
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
