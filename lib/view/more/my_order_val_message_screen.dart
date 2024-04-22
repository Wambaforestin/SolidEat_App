import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/custom_widgets/round_button.dart';
import 'package:solideat/view/main_tab/main_tab_screen.dart';
import 'package:solideat/view/more/more_screen.dart';

class MyOrderValMessageScreen extends StatefulWidget {
  const MyOrderValMessageScreen({super.key});

  @override
  State<MyOrderValMessageScreen> createState() =>
      _MyOrderValMessageScreenState();
}

class _MyOrderValMessageScreenState extends State<MyOrderValMessageScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      width: media.width,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.primaryTextColor,
                  size: 25,
                ),
              )
            ],
          ),
          Image.asset(
            "assets/images/popup_image1.png",
            width: media.width * 0.55,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Merci Beaucoup!",
            style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 26,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Pour votre commande!",
            style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Votre commande a été validée avec succès, vous pouvez suivre votre commande en verifiant vos messages ou en cliquant sur le bouton ci-dessous.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.primaryTextColor, fontSize: 14),
          ),
          const SizedBox(
            height: 35,
          ),
          RoundButton(
              title: "Suivre la commande",
              onPressed: () {
                //TODO: Implement the tracking order functionality
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MoreScreen(),
                  ),
                );
              }),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainTabScreen(),
                ),
              );
            },
            child: const Text(
              "Retour à la page d'accueil",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
