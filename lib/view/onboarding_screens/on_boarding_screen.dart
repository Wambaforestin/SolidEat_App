import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/custom_widgets/round_button.dart';
import 'package:solideat/view/login_screens/welcome_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectPage = 0;
  PageController pageController = PageController();
  List pages = [
    {
      'title': 'Nourriture Gratuite Sans Frais',
      'description':
          'Profitez d\'une sélection de plats gratuits, sans aucun coût supplémentaire.',
      'image': 'assets/images/silde_image1.png'
    },
    {
      'title': 'Trouver un Restaurant à Proximité',
      'description':
          'Découvrez facilement des restaurants à proximité de votre emplacement actuel, en un seul clic.',
      'image': 'assets/images/slide_image2.png'
    },
    {
      'title': 'Plus d\'un Reseaux de Restaurant',
      'description':
          'Explorez un réseau mondial de plus de 500 restaurants partenaires, disponibles en France.',
      'image': 'assets/images/slide_image4.png'
    }
  ];
  @override
  //this function is called when the state object is created and it is used to initialize the state of the object
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        //we use the floor method to get the nearest whole number
        selectPage = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              //the page object is a map and it contains the title, description and image
              var pObject = pages[index] as Map? ?? {};
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width,
                      height: size.width,
                      alignment: Alignment.center,
                      child: Image.asset(
                        pObject['image'].toString(),
                        width: size.width * 0.65,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.2,
                    ),
                    Text(
                      pObject['title'].toString(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      pObject['description'].toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.tertiaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.20,
                    ),
                  ],
                ),
              );
            },
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.6,
              ),
              //creating the dots using the
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pages.map((e) {
                  var index = pages.indexOf(e);

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: index == selectPage
                            ? AppColors.primaryColor
                            : AppColors.tertiaryTextColor,
                        borderRadius: BorderRadius.circular(4)),
                  );
                }).toList(),
              ),
              SizedBox(
                height: size.height * 0.22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundButton(
                  onPressed: () {
                    //TODO: implement the logic to navigate to the next page
                    if (selectPage >= 2) {
                      //Home page
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                    } else {
                      setState(() {
                        //Next Screen
                        //TODO: implement the logic to navigate to the next screen
                        setState(() {
                          selectPage = selectPage + 1;
                          pageController.animateToPage(selectPage,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.bounceInOut);
                        });
                      });
                    }
                  },
                  title: "suivant",
                  type: RoundButtonType.primary,
                ),
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
