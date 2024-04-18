import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/custom_widgets/round_button.dart';

class PasswordOTPScreen extends StatefulWidget {
  const PasswordOTPScreen({super.key});

  @override
  State<PasswordOTPScreen> createState() => _PasswordOTPScreenState();
}

class _PasswordOTPScreenState extends State<PasswordOTPScreen> {
  ///  Otp pin Controller
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
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
                "Code de vérification",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                textAlign: TextAlign.center,
                "Nous avons envoyé un code de vérification à votre adresse email.\nEntrez le code pour continuer",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // CustomTextfield is a custom widget that we created to make the textfield more reusable
              SizedBox(
                height: 60,
                child: OtpPinField(
                  key: _otpPinFieldController,
                  autoFillEnable: false,

                  ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                  textInputAction: TextInputAction.done,

                  ///in case you want to change the action of keyboard
                  /// to clear the Otp pin Controller
                  onSubmit: (text) {
                    // print('Entered pin is $text');
                    FocusScope.of(context).requestFocus(FocusNode());

                    /// return the entered pin
                  },
                  onChange: (text) {
                    // print('Enter on change pin is $text');

                    /// return the entered pin
                  },
                  onCodeChanged: (code) {
                    // print('onCodeChanged  is $code');
                  },
                  fieldWidth: 50,

                  /// to decorate your Otp_Pin_Field
                  otpPinFieldStyle: const OtpPinFieldStyle(
                    /// border color for inactive/unfocused Otp_Pin_Field
                    defaultFieldBorderColor: AppColors.primaryTextFieldColor,

                    /// border color for active/focused Otp_Pin_Field
                    activeFieldBorderColor: AppColors.primaryButtonColor,

                    /// Background Color for inactive/unfocused Otp_Pin_Field
                    defaultFieldBackgroundColor:
                        AppColors.primaryTextFieldColor,

                    /// Background Color for active/focused Otp_Pin_Field
                    activeFieldBackgroundColor: AppColors.primaryTextFieldColor,

                    /// Background Color for filled field pin box
                    filledFieldBackgroundColor: AppColors.primaryTextFieldColor,

                    /// border Color for filled field pin box
                    filledFieldBorderColor: AppColors.primaryTextFieldColor,
                  ),
                  maxLength: 4,

                  /// no of pin field
                  showCursor: true,

                  /// bool to show cursor in pin field or not
                  cursorColor: AppColors.primaryButtonColor,

                  showCustomKeyboard: false,

                  ///bool which manage to show custom keyboard
                  // customKeyboard: Container(),
                  /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                  showDefaultKeyboard: true,

                  ///bool which manage to show default OS keyboard
                  cursorWidth: 2,

                  /// to select cursor width
                  mainAxisAlignment: MainAxisAlignment.center,

                  /// place otp pin field according to yourself

                  /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                  ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                  otpPinFieldDecoration:
                      OtpPinFieldDecoration.defaultPinBoxDecoration,
                ),
              ),
              //space for the OTP textfields
              const SizedBox(
                height: 20,
              ),
              //3. button to navigate to the reset password screen
              RoundButton(
                onPressed: () {
                  //TODO: navigate to the reset password screen
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                title: "verifier",
                type: RoundButtonType.primary,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous n'avez pas reçu de code?",
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Implement send code
                    },
                    child: const Text(
                      "Renvoyer le code",
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
