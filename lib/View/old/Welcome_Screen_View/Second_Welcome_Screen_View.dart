import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Buttons.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';
import 'Third_Welcome_Screen_View.dart';

class SecondWelcomeScreenView extends StatefulWidget {
  const SecondWelcomeScreenView({super.key});

  @override
  State<SecondWelcomeScreenView> createState() =>
      _SecondWelcomeScreenViewState();
}

class _SecondWelcomeScreenViewState extends State<SecondWelcomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: Stack(
          children: [
            const Column(
              children: [
                EmptySpace(),
                AppImage(
                  appImage: "images/4.png",
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: Get.width,
                  //height: Get.height,
                  decoration: const BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 12,
                            color: whiteColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: Get.width * 0.1,
                            height: Get.height * 0.01,
                            decoration: BoxDecoration(
                              color: cyanColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.circle,
                            size: 12,
                            color: whiteColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Learn Learn Learn Learn Learn Learn Learn Learn or Learn the Learn Learn Learn Learn",
                          style: mediumWhiteColor,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SkipAndNextButton(
                        onClickNextButton: () {
                          Get.to(const ThirdWelcomeScreenView());
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
