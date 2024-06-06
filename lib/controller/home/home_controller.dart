import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iris_wheel_assist/data/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/core/constant/routes.dart';
import '../../Constants/Colors.dart';
import '../../core/constant/color.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/children_data.dart';
import '../../data/datasource/remote/homedata.dart';
import '../../data/model/blog_model.dart';

abstract class HomeController extends GetxController {
  initialData();

  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  BlogData blogData = BlogData(Get.find());
  HomeData homeData = HomeData(Get.find());

  List<BlogModel> blog = [];

  late StatusRequest statusRequest;

  List<BlogModel> banner = [];
  List child = [];
  int? currentIndex;

  String? username;
  String? email;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  int index = 0;
  final List<String> images = [
    'https://www.annajah.net/resources/thumbs/article_photos/5jMvZHKyYD-Annajah.jpg_729x410.jpg',
    'https://w7.pngwing.com/pngs/981/206/png-transparent-united-arab-emirates-disability-special-needs-education-health-care-child-child-culture-people.png',
    'https://ghaithfoundation.org/wp-content/uploads/2023/08/%D8%A7%D9%84%D8%AE%D8%AF%D9%85%D8%A7%D8%AA-%D8%A7%D9%84%D8%AA%D9%8A-%D8%AA%D9%82%D8%AF%D9%85-%D9%84%D8%B0%D9%88%D9%8A-%D8%A7%D9%84%D8%A7%D8%AD%D8%AA%D9%8A%D8%A7%D8%AC%D8%A7%D8%AA-%D8%A7%D9%84%D8%AE%D8%A7%D8%B5%D8%A9-1.png',
  ];

  List<Widget> genarateImagesTiles() {
    return images
        .map((element) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  imageUrl: element,
                  width: Get.width,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: blueColor,
                  ),
                ),
              ),
            ))
        .toList();
  }

  final CarouselController carouselController = CarouselController();
  int currentPage = 0;

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() {
    statusRequest = StatusRequest.loading;
    update();
    blogData.getData().then((value) {
      log("========================================================================$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        if (value['status'] == "success") {
          List blogs = value['Blog'];
          blog.addAll(blogs.map((e) => BlogModel.fromJson(e)));
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

  getBanner() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData
        .getLogData(myServices.sharedPreferences.getString("id").toString());
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List log = response['data'];
        banner.addAll(log.map((e) => BlogModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  imgGlr() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    debugPrint('path: ${image?.path}');

    if (image != null) {
      File? img = File(image.path);
      img = await cropped(imageFile: img);
      myFile = img;
      update();
    } else {
      print("No Image Selected");
    }
    update();
  }

  imgCmr() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);
    debugPrint('path: ${image?.path}');

    if (image != null) {
      File? img = File(image.path);
      img = await cropped(imageFile: img);
      myFile = img;
      update();
    } else {
      print("No Image Selected");
    }
    update();
  }

  Future<File?> cropped({required File imageFile}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      cropStyle: CropStyle.rectangle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'IRIS',
            toolbarColor: AppColor.primaryColor,
            toolbarWidgetColor: AppColor.backgroundColor,
            initAspectRatio: CropAspectRatioPreset.ratio16x9,
            activeControlsWidgetColor: AppColor.backgroundColor,
            backgroundColor: AppColor.primaryColor,
            statusBarColor: AppColor.primaryColor,
            showCropGrid: true,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    return File(croppedFile!.path);
  }

  TextEditingController address = TextEditingController();
  TextEditingController text = TextEditingController();
  File? myFile;
  var childId;

  addData() async {
    if (formState.currentState?.validate() == true) {
      statusRequest = StatusRequest.loading;
      var response = await blogData.addData(address.text, text.text,
          myServices.sharedPreferences.getString("id").toString(), myFile!);
      if (kDebugMode) {
        print(
            "========================================================================$response");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          address.clear();
          text.clear();
          myFile = null;
          getData();
          Get.forceAppUpdate();
          Get.back();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }
}
