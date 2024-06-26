import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/custom_widgets/round_button.dart';
import 'package:solideat/custom_widgets/text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Image picker instance
  final ImagePicker picker = ImagePicker();
  XFile? image;
  //Text editing controllers for the text fields in the form
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 46,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Profil",
                  style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                IconButton(
                  onPressed: () {
                    //TODO: Implement the navigation to the MyOrderView
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MyOrderScreen(),
                    //   ),
                    // );
                  },
                  icon: Image.asset(
                    "assets/app_icons/shopping_cart_icon.png",
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.primaryTextFieldColor,
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(File(image!.path),
                        width: 100, height: 100, fit: BoxFit.cover),
                  )
                : const Icon(
                    Icons.person,
                    size: 65,
                    color: AppColors.secondaryTextColor,
                  ),
          ),
          //The following code snippet is used to pick an image from the gallery
          TextButton.icon(
            //This is an asyn function that will return the image file
            onPressed: () async {
              //This will open the gallery to pick an image
              image = await picker.pickImage(source: ImageSource.gallery);
              setState(() {});
            },
            icon: const Icon(
              Icons.edit,
              color: AppColors.primaryTextColor,
              size: 12,
            ),
            label: const Text(
              "Changer l'image de profil",
              style: TextStyle(color: AppColors.primaryTextColor, fontSize: 12),
            ),
          ),
          const Text(
            "Salut User...........",
            style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Sign Out",
              style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: RoundTitleTextfield(
              title: "Nom",
              hintText: "...",
              controller: txtName,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: RoundTitleTextfield(
              title: "Email",
              hintText: "...",
              keyboardType: TextInputType.emailAddress,
              controller: txtEmail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: RoundTitleTextfield(
              title: "Numéro de téléphone",
              hintText: "...",
              controller: txtMobile,
              keyboardType: TextInputType.phone,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: RoundTitleTextfield(
              title: "Addresse",
              hintText: "...",
              controller: txtAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: RoundTitleTextfield(
              title: "Mot de passe",
              hintText: "* * * * * * * * * *",
              obscureText: true,
              controller: txtPassword,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: RoundTitleTextfield(
              title: "Confirmer le mot de passe",
              hintText: "* * * * * * * * * *",
              obscureText: true,
              controller: txtConfirmPassword,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RoundButton(
                title: "Sauvegarder",
                onPressed: () {
                  //TODO: Implement the save profile logic
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Center(
                        child: Text("Profil mis à jour"),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/popup_image2.png",
                            width: media.width * 0.35,
                          ),
                          const Text(
                            "Votre profil a été mis à jour avec succès",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundButton(
                              title: "OK",
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    ));
  }
}
