import 'package:flutter/material.dart';
import 'package:solideat/common_custom_widgets/colors.dart';
import 'package:solideat/custom_widgets/tab_buttons.dart';
import 'package:solideat/view/home_screens/main_home_screen.dart';
import 'package:solideat/view/menu/menu_screen.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int selctTab = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPage = const MainHomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPage),
      backgroundColor: AppColors.primaryBackgroundColor,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (selctTab != 2) {
              selctTab = 2;
              selectPage = const MainHomeScreen();
            }
            if (mounted) {
              setState(() {});
            }
          },
          shape: const CircleBorder(),
          backgroundColor: selctTab == 2
              ? AppColors.whiteColor
              : AppColors.tertiaryTextColor,
          child: Image.asset(
            "assets/app_icons/home_icon.png",
            width: 30,
            height: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
        notchMargin: 12,
        height: 64,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                  title: "Menu",
                  icon: "assets/app_icons/menu_icon.png",
                  onTap: () {
                    if (selctTab != 0) {
                      selctTab = 0;
                      selectPage = const MenuScreen();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isSelected: selctTab == 0),
              TabButton(
                  title: "Panier",
                  icon: "assets/app_icons/order_icon.png",
                  onTap: () {
                    if (selctTab != 1) {
                      selctTab = 1;
                      selectPage = const MainHomeScreen();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isSelected: selctTab == 1),
              const SizedBox(
                width: 40,
                height: 40,
              ),
              TabButton(
                  title: "Profil",
                  icon: "assets/app_icons/profile_icon.png",
                  onTap: () {
                    if (selctTab != 3) {
                      selctTab = 3;
                      selectPage = const MainHomeScreen();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isSelected: selctTab == 3),
              TabButton(
                  title: "More",
                  icon: "assets/app_icons/more_icon.png",
                  onTap: () {
                    if (selctTab != 4) {
                      selctTab = 4;
                      selectPage = const MainHomeScreen();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isSelected: selctTab == 4),
            ],
          ),
        ),
      ),
    );
  }
}
