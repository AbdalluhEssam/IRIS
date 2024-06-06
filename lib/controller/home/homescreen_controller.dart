import 'package:iris_wheel_assist/View/screen/home/controlView.dart';
import 'package:iris_wheel_assist/View/screen/home/notification_screen.dart';
import 'package:iris_wheel_assist/data/datasource/remote/auth/login.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/data/model/users_model.dart';
import 'package:iris_wheel_assist/view/screen/home/home.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/icon_broken.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/translatedordatabase.dart';
import '../../core/services/services.dart';
import '../../view/screen/home/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  MyServices myServices = Get.find();
  int currentIndex = 0;
  late StatusRequest statusRequest;
  bool canPop = false;

  List<Widget> listPage = [
    const HomePage(),
    const NotificationScreen(),
    const ControlView(),
    const Settings(),
    const Settings(),
  ];

  List<IconData> listOfIcons = [
    IconBroken.Home,
    IconBroken.Notification,
    IconBroken.Game,
    IconBroken.Setting,
    IconBroken.Profile,
  ];

  void updateListOfStrings(String langCode) {
    listOfStrings = [
      translateDataBase("الرئسية", "Home", langCode),
      translateDataBase("الاشعارات", "Notify", langCode),
      translateDataBase("التحكم", "Control", langCode),
      translateDataBase("الاعدادات", "Settings", langCode),
      translateDataBase("ملفك", "Profile", langCode),
    ];
    update(); // Trigger UI update
  }

  List<String> listOfStrings = [
    translateDataBase("الرئسية", "Home"),
    translateDataBase("الاشعارات", "Notify"),
    translateDataBase(
      "التحكم",
      "Control",
    ),
    translateDataBase(
      "الاعدادات",
      "Settings",
    ),
    translateDataBase("ملفك", "Profile"),
  ];

  @override
  changePage(currentPage) {
    currentIndex = currentPage;
    update();
    HapticFeedback.lightImpact();
    update();
  }

  late UsersModel usersModel;
  LoginData loginData = LoginData(Get.find());

  getData() {
    statusRequest = StatusRequest.loading;
    update();
    loginData
        .getUserData(myServices.sharedPreferences.getString("id").toString())
        .then((value) {
      log("========================================================================$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        if (value['status'] == "success") {
          usersModel = UsersModel.fromJson(value['data']);
          update();
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      }
    }).catchError((onError) {
      log("Error=== : ===$onError");
      update();
    });

    update();
  }

  @override
  void onInit() async {
    usersModel = UsersModel();
    getData();

    super.onInit();
  }
}
