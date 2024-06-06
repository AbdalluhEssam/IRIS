import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Buttons.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Controller/Controller.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';
import 'Second_Welcome_Screen_View.dart';

class FirstWelcomeScreenView extends StatefulWidget {
  const FirstWelcomeScreenView({super.key});

  @override
  State<FirstWelcomeScreenView> createState() => _FirstWelcomeScreenViewState();
}

class _FirstWelcomeScreenViewState extends State<FirstWelcomeScreenView> {
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
        body: BackGroundImage(
          child: Stack(
            children: [
              const Column(
                children: [
                  EmptySpace(),
                  AppImage(
                    appImage: "images/3.png",
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "first_welcome_screen_description".tr,
                            style: mediumWhiteColor,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SkipAndNextButton(
                          onClickNextButton: () {
                            Get.to(const SecondWelcomeScreenView());
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
      ),
    );
  }
}
