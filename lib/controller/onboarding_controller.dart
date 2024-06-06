import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:iris_wheel_assist/core/functions/translatedordatabase.dart';

import '../core/services/services.dart';

abstract class OnBoardingController extends GetxController {
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  final List<Introduction> list = [
    Introduction(
      titleTextStyle:
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      subTitleTextStyle:
      const TextStyle(fontSize: 16 , fontWeight: FontWeight.bold, color: Color.fromRGBO(
          206, 206, 206, 1.0)),
      imageWidth: 500,
      imageHeight: 300,
      title: '${translateDataBase("طريقة سهله لرعاية\n اصحاب الاعاقات", "An easy way to care for \npeople with disabilities")}',
      subTitle: '${translateDataBase("يقدم نظام Iris Wheelchair care طرق سهله وفعالة لرعاية اصحاب الاعاقات الحركية من الاستقلالية و الامان", "The Iris Wheelchair care system provides easy and effective ways to care for people with mobility disabilities in independence and safety.")}',
      imageUrl: 'assets/images/3.png',
    ),
    Introduction(
      titleTextStyle:
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      subTitleTextStyle:
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(
          201, 198, 198, 1.0)),
      imageWidth: 500,
      imageHeight: 300,
      title: '${translateDataBase("الاستقلالية", "Independence")}',
      subTitle: '${translateDataBase("يوفر النظام طرق سهلة و مبتكرة للتنقل مما يوفر قدر كبير من الاستقلالية للمرضى دون الحاجه لمرافق ملازم دائما", "The system provides easy and innovative ways of transportation, which provides a great deal of independence for patients without the need for a constant companion")}',

      imageUrl: 'assets/images/4.png',
    ),
  ];

  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
