import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';
import 'package:iris_wheel_assist/ViewModel/Botton_Nav_Bar_ViewModel/Setting_Screen_ViewModel/Setting_Screen_ViewModel.dart';

import '../../../Constants/Controller/Controller.dart';
import '../../../Constants/Fonts.dart';
import '../../../Constants/Images.dart';

class SettingScreenView extends StatefulWidget {
  const SettingScreenView({super.key});

  @override
  State<SettingScreenView> createState() => _SettingScreenViewState();
}

class _SettingScreenViewState extends State<SettingScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const EmptySpace(),
              const Text(
                "Setting",
                style: bigstBlueColor,
              ),
              const SizedBox(
                height: 50,
              ),
              const LogoAppImage(),
              const SizedBox(
                height: 25,
              ),
              SettingButton(
                iconSettingButton: const Icon(
                  Icons.person_2_outlined,
                  color: blueColor,
                  size: 30,
                ),
                nameSettingButton: "health profile",
                child: Container(),
              ),
              SettingButton(
                iconSettingButton: const Icon(
                  Icons.language_rounded,
                  color: blueColor,
                  size: 30,
                ),
                nameSettingButton: "Language",
                child: Column(
                  children: [
                    const EmptySpace(),
                    const EmptySpace(),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AppLanguage>(
                      init: AppLanguage(),
                      builder: (controller) {
                        return DropdownButton(
                          underline: const Divider(
                            height: 2,
                            thickness: 2,
                            color: blueColor,
                          ),
                          style: mediumCyanColor,
                          elevation: 2,
                          icon: const Icon(Icons.arrow_drop_down,
                              color: cyanColor),
                          borderRadius: BorderRadius.circular(12),
                          dropdownColor: whiteColor,
                          items: const [
                            DropdownMenuItem(
                              value: 'ar',
                              child: Text("Arabic"),
                            ),
                            DropdownMenuItem(
                              value: 'en',
                              child: Text("English"),
                            ),
                          ],
                          value: controller.appLocale,
                          onChanged: (value) {
                            controller.changeLanguage(value!);
                            Get.updateLocale(Locale(value));
                          },
                        );
                      },
                    ),
                    Text(
                      "Chose Your Language",
                      style: TextStyle(color: blackColor),
                    )
                  ],
                ),
              ),
              SettingButton(
                iconSettingButton: const Icon(
                  Icons.error_outline,
                  color: blueColor,
                  size: 30,
                ),
                nameSettingButton: "Help Center",
                child: Container(),
              ),
              SettingButton(
                iconSettingButton: const Icon(
                  Icons.lock_person_outlined,
                  color: blueColor,
                  size: 30,
                ),
                nameSettingButton: "Privacy Policy",
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: SizedBox(
                  width: Get.width,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        showDialog(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        width: 3.5, color: cyanColor)),
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
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: MaterialButton(
                                          padding: const EdgeInsets.all(10),
                                          color: blueColor,
                                          shape: Border.all(
                                              width: 4, color: blueColor),
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
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
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: MaterialButton(
                                            padding: const EdgeInsets.all(10),
                                            color: blueColor,
                                            shape: Border.all(
                                                width: 4, color: blueColor),
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
                      });
                    },
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.login_rounded,
                              color: blueColor,
                              size: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Log Out",
                              style: bigCyanColor,
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: blueColor,
                              size: 25,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                          color: blueColor,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SettingButton(
              //   iconSettingButton: const Icon(
              //     Icons.login_rounded,
              //     color: blueColor,
              //     size: 30,
              //   ),
              //   nameSettingButton: "Log Out",
              //   onClickSettingButton: () {
              //     setState(() {
              //       showDialog(
              //           context: context,
              //           builder: (context) {
              //             return AlertDialog(
              //               backgroundColor: whiteColor,
              //               elevation: 0.0,
              //               title: const Text(
              //                 textAlign: TextAlign.center,
              //                 "Alert !",
              //                 style: bigstBlueColor,
              //               ),
              //               content: const Text(
              //                 textAlign: TextAlign.center,
              //                 "Do you want to Exit ?",
              //                 style: mediumBlackColor,
              //               ),
              //               shape: const OutlineInputBorder(
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(15)),
              //                   borderSide:
              //                       BorderSide(width: 3.5, color: cyanColor)),
              //               titlePadding: const EdgeInsets.only(
              //                 left: 10,
              //                 right: 10,
              //                 top: 20,
              //               ),
              //               actions: [
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     ClipRRect(
              //                       borderRadius: const BorderRadius.all(
              //                           Radius.circular(10)),
              //                       child: MaterialButton(
              //                         padding: const EdgeInsets.all(10),
              //                         color: blueColor,
              //                         shape: Border.all(
              //                             width: 4, color: blueColor),
              //                         onPressed: () =>
              //                             Navigator.of(context).pop(false),
              //                         child: const Text(
              //                           'No',
              //                           textAlign: TextAlign.center,
              //                           style: mediumWhiteColor,
              //                         ),
              //                       ),
              //                     ),
              //                     const SizedBox(
              //                       width: 20,
              //                     ),
              //                     ClipRRect(
              //                       borderRadius: const BorderRadius.all(
              //                           Radius.circular(10)),
              //                       child: MaterialButton(
              //                           padding: const EdgeInsets.all(10),
              //                           color: blueColor,
              //                           shape: Border.all(
              //                               width: 4, color: blueColor),
              //                           onPressed: () => exit(0),
              //                           child: const Text(
              //                             "Yes",
              //                             textAlign: TextAlign.center,
              //                             style: mediumWhiteColor,
              //                           )),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             );
              //           });
              //     });
              //     return null;
              //   },
              // ),
              const EmptySpace(),
            ],
          ),
        ),
      ),
    );
  }
}
