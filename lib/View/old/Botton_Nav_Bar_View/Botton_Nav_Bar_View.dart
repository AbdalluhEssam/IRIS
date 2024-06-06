import 'dart:io';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/View/old/Botton_Nav_Bar_View/Control_Screen_View.dart';
import 'package:iris_wheel_assist/View/old/Botton_Nav_Bar_View/Notification_Screen_View.dart';
import 'package:iris_wheel_assist/View/old/Botton_Nav_Bar_View/Profile_Screen_View.dart';
import 'package:iris_wheel_assist/View/old/Botton_Nav_Bar_View/Setting_Screen_View.dart';
import '../../../Constants/Fonts.dart';
import 'Home_Screen_View.dart';

class BottonNavBarView extends StatefulWidget {
  const BottonNavBarView({super.key});

  @override
  State<BottonNavBarView> createState() => _BottonNavBarViewState();
}

class _BottonNavBarViewState extends State<BottonNavBarView> {
  final _pageController = PageController(initialPage: 2);
  final _controller = NotchBottomBarController(index: 2);
  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    const NotificationScreenView(),
    const ControlScreenView(),
    const HomeScreenView(),
    const SettingScreenView(),
    const ProfileScreenView(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: whiteColor,
                elevation: 0.0,
                title: const Text(
                  textAlign: TextAlign.center,
                  "Alert !",
                  style: bigstBlueColor,
                ),
                content: const Text(
                  textAlign: TextAlign.center,
                  "Do you want to Exit ?",
                  style: mediumBlackColor,
                ),
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(width: 3.5, color: cyanColor)),
                titlePadding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 20,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: MaterialButton(
                          padding: const EdgeInsets.all(10),
                          color: blueColor,
                          shape: Border.all(width: 4, color: blueColor),
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text(
                            'No',
                            textAlign: TextAlign.center,
                            style: mediumWhiteColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: MaterialButton(
                            padding: const EdgeInsets.all(10),
                            color: blueColor,
                            shape: Border.all(width: 4, color: blueColor),
                            onPressed: () => exit(0),
                            child: const Text(
                              "Yes",
                              textAlign: TextAlign.center,
                              style: mediumWhiteColor,
                            )),
                      ),
                    ],
                  ),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
                blurFilterX: 5.0,
                blurFilterY: 5.0,
                blurOpacity: 5.0,
                notchBottomBarController: _controller,
                showShadow: true,
                showBlurBottomBar: false,
                color: whiteColor,
                showLabel: true,
                notchColor: cyanColor,
                removeMargins: false,
                bottomBarWidth: Get.width,
                durationInMilliSeconds: 300,
                itemLabelStyle: const TextStyle(
                  //fontSize: 10.5,
                  fontWeight: FontWeight.bold,
                  color: cyanColor,
                ),
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.notifications_active_outlined,
                      color: cyanColor,
                      size: 25,
                    ),
                    activeItem: Icon(
                      Icons.notifications_active_outlined,
                      color: whiteColor,
                      size: 25,
                    ),
                    itemLabel: "Notify",
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.gamepad_outlined,
                      color: cyanColor,
                      size: 25,
                    ),
                    activeItem: Icon(
                      Icons.gamepad_outlined,
                      color: whiteColor,
                      size: 25,
                    ),
                    itemLabel: "Control",
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_outlined,
                      color: cyanColor,
                      size: 25,
                    ),
                    activeItem: Icon(
                      Icons.home_outlined,
                      color: whiteColor,
                      size: 25,
                    ),
                    itemLabel: "Home",
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.settings_outlined,
                      color: cyanColor,
                      size: 25,
                    ),
                    activeItem: Icon(
                      Icons.settings_outlined,
                      color: whiteColor,
                      size: 25,
                    ),
                    itemLabel: "Setting",
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.location_history,
                      color: cyanColor,
                      size: 25,
                    ),
                    activeItem: Icon(
                      Icons.location_history,
                      color: whiteColor,
                      size: 25,
                    ),
                    itemLabel: "Profile",
                  ),
                ],
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
              )
            : null,
      ),
    );
  }
}
