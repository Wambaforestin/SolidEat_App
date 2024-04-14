import 'package:flutter/material.dart';
import 'package:solideat/custom_widgets/round_button.dart';
import 'package:solideat/custom_widgets/textfield.dart';
import 'package:solideat/view/login_screens/new_password_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
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
                "Réinitialiser le mot de passe",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Entrez votre adresse e-mail pour réinitialiser votre mot de passe",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // CustomTextfield is a custom widget that we created to make the textfield more reusable
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
              //3. button to navigate to the reset password screen
              RoundButton(
                onPressed: () {
                  //TODO: navigate to the reset password screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPasswordScreen(),
                    ),
                  );
                },
                title: "Envoyer",
                type: RoundButtonType.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
