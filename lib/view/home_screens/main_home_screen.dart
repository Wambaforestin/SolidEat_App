import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/custom_widgets/category_cell.dart';
import 'package:solideat/custom_widgets/most_popular_cell.dart';
import 'package:solideat/custom_widgets/popular_restaurant_row.dart';
import 'package:solideat/custom_widgets/recent_item_row.dart';
import 'package:solideat/custom_widgets/text_field.dart';
import 'package:solideat/custom_widgets/view_all_title_row.dart';
import 'package:solideat/view/more/change_address_screen.dart';
import 'package:solideat/view/more/my_order_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  //this is the controller for the search textfield for the search bar
  TextEditingController txtSearch = TextEditingController();
  //this is the list of categories
  List catArr = [
    {"image": "assets/images/food1.png", "name": "Burger"},
    {"image": "assets/images/food1.png", "name": "Burger"},
    {"image": "assets/images/food1.png", "name": "Burger"},
    {"image": "assets/images/food1.png", "name": "Burger"},
    {"image": "assets/images/food1.png", "name": "Burger"},
    {"image": "assets/images/food1.png", "name": "Burger"},
  ];
  //this is the list of popular restaurants
  List popArr = [
    {
      "image": "assets/images/resto1.png",
      "name": "Le Petit Café",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Haut de Seine"
    },
    {
      "image": "assets/images/resto1.png",
      "name": "Le Petit Café",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Haut de Seine"
    },
    {
      "image": "assets/images/resto1.png",
      "name": "Le Petit Café",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Haut de Seine"
    }
  ];
//this is the list of most popular restaurants
  List mostPopArr = [
    {
      "image": "assets/images/resto1.png",
      "name": "Le Petit Café",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Haut de Seine"
    },
    {
      "image": "assets/images/resto1.png",
      "name": "Le Petit Café",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Haut de Seine"
    },
    {
      "image": "assets/images/resto1.png",
      "name": "Le Petit Café",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Haut de Seine"
    },
  ];
  //this is the list of recent items
  List recentArr = [
    {
      "image": "assets/images/resto1.png",
      "name": "Le Petit Café",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Haut de Seine"
    },
    {
      "image": "assets/images/resto1.png",
      "name": "Le Petit Café",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Haut de Seine"
    },
    {
      "image": "assets/images/resto1.png",
      "name": "Le Petit Café",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Haut de Seine"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Bonjour User...",
                      // "Good morning ${ServiceCall.userPayload[KKey.name] ?? ""}!",
                      style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Trouver des restaurants autour de vous",
                      style: TextStyle(
                          color: AppColors.primaryTextColor, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ChangeAddressScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Localisation Actuelle",
                            style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Image.asset(
                          "assets/app_icons/location_icon.png",
                          width: 12,
                          height: 12,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Rechercher des plats...",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/app_icons/search_icon.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: catArr.length,
                  itemBuilder: ((context, index) {
                    var cObj = catArr[index] as Map? ?? {};
                    //calling the category cell widget
                    return CategoryCell(
                      cObj: cObj,
                      onTap: () {},
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Restaurants Populaires",
                  onView: () {},
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: popArr.length,
                itemBuilder: ((context, index) {
                  var pObj = popArr[index] as Map? ?? {};
                  //calling the popular restaurant row widget
                  return PopularRestaurantRow(
                    pObj: pObj,
                    onTap: () {},
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Plus Populaires",
                  onView: () {},
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: mostPopArr.length,
                  itemBuilder: ((context, index) {
                    var mObj = mostPopArr[index] as Map? ?? {};
                    return MostPopularCell(
                      mObj: mObj,
                      onTap: () {},
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                //calling the view all title row widget
                child: ViewAllTitleRow(
                  title: "Offre Spéciale",
                  onView: () {},
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: recentArr.length,
                itemBuilder: ((context, index) {
                  var rObj = recentArr[index] as Map? ?? {};
                  //calling the recent item row widget
                  return RecentItemRow(
                    rObj: rObj,
                    onTap: () {},
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
