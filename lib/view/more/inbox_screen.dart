import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/view/more/my_order_screen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List inboxArr = [
    {
      "title": "Votre réservation a été mise à jour !",
      "detail": "Votre réservation a été mise à jour !",
    },
    {
      "title": "Un nouveau restaurant a été ajouté à notre liste !",
      "detail": "Un nouveau restaurant a été ajouté à notre liste !",
    },
    {
      "title":
          "Profitez de la livraison gratuite pour votre prochaine commande !",
      "detail":
          "Profitez de la livraison gratuite pour votre prochaine commande !",
    },
    {
      "title": "Félicitations ! Vous avez gagné un bon de réduction.",
      "detail": "Félicitations ! Vous avez gagné un bon de réduction.",
    },
    {
      "title": "Découvrez nos offres du jour !",
      "detail": "Découvrez nos offres du jour !",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryTextColor,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Expanded(
                      child: Text(
                        "Boîte de réception",
                        style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyOrderScreen(),
                          ),
                        );
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
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: inboxArr.length,
                separatorBuilder: ((context, index) => Divider(
                      indent: 25,
                      endIndent: 25,
                      color: AppColors.primaryIconColor.withOpacity(0.4),
                      height: 1,
                    )),
                itemBuilder: ((context, index) {
                  var cObj = inboxArr[index] as Map? ?? {};
                  return Container(
                    //the color of the container is based on the index
                    decoration: BoxDecoration(
                        color: index % 4 != 1
                            ? AppColors.whiteColor
                            : AppColors.primaryTextFieldColor),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryTextColor,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cObj["title"].toString(),
                                style: const TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                cObj["detail"].toString(),
                                maxLines: 2,
                                style: const TextStyle(
                                    color: AppColors.tertiaryTextColor,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
