import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/controller/home/homescreen_controller.dart';
import 'package:iris_wheel_assist/core/constant/color.dart';
import 'package:iris_wheel_assist/core/constant/icon_broken.dart';
import 'package:iris_wheel_assist/likeapi.dart';
import '../../../Constants/Colors.dart';
import '../../../Constants/Fonts.dart';
import '../../../Constants/Space.dart';
import '../../../Constants/Video.dart';
import '../../../ViewModel/Botton_Nav_Bar_ViewModel/Home_Screen_ViewModel.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextformauth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    HomeScreenControllerImp controllerImp= Get.put(HomeScreenControllerImp());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        floatingActionButton: Visibility(
            child: GetBuilder<HomeControllerImp>(
          builder: (controller) => FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Form(
                              key: controller.formState,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  GetBuilder<HomeControllerImp>(
                                    builder: (controller) => InkWell(
                                      onTap: () {
                                        controller.imgGlr();
                                        controller.update();
                                      },
                                      child: Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                        width: 150,
                                        height: 150,
                                        child: Center(
                                          child: controller.myFile == null
                                              ? const Icon(IconBroken.Image_2)
                                              : Image.file(
                                                  controller.myFile!,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  CustomFormAdd(
                                    isNamber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 1, 500, "address");
                                    },
                                    mycontroller: controller.address,
                                    label: "Title",
                                    hinttext: "Title",
                                    iconData: IconBroken.Location,
                                  ),
                                  const SizedBox(height: 16),
                                  CustomFormAdd(
                                    isNamber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 1, 10000, "Log Details");
                                    },
                                    mycontroller: controller.text,
                                    label: "Details",
                                    hinttext: "Details",
                                    iconData: IconBroken.Document,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Add more TextFormField widgets for other fields like phone, etc.
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add your logic to save employee data
                                          controller.addData();
                                        },
                                        child: Text(
                                            '${translateDataBase("اضافة", "Add")}'),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add your logic to save employee data
                                          Get.back();
                                        },
                                        child: Text(
                                            '${translateDataBase("الغاء", "Cancel")}'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
              // Get.toNamed(AppRoute.addEmployees,
              //     arguments: {"status": 1.toString()});
            },
            backgroundColor: AppColor.primaryColor,
            child: const Icon(
              Icons.add,
            ),
          ),
        )),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => BackGroundImage(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UserAppBar(
                          nameOfUser:
                              "${controller.myServices.sharedPreferences.getString("username")}",
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            GradientSlideToAct(
                              height: 80,
                              gradient: const LinearGradient(
                                  colors: [blueColor, cyanColor]),
                              dragableIcon: IconBroken.Arrow___Right_2,
                              width: Get.width * 0.7,
                              dragableIconBackgroundColor: Colors.white,
                              text:
                                  "${translateDataBase("اسحب بمشاهده البث", "Swipe To Live")}",
                              textStyle: smallWhiteColor,
                              backgroundColor: cyanColor,
                              onSubmit: () {
                                Get.to( Video_Play_Screen(
                                    video_Url:
                                        "${controllerImp.usersModel.liveLink}"));
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CarouselSlider(
                                items: controller.genarateImagesTiles(),
                                options: CarouselOptions(
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  reverse: true,
                                  viewportFraction: 1,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  onPageChanged: (index, reason) {
                                    controller.currentPage = index;
                                  },
                                  //aspectRatio: 500.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.24,

                                  autoPlayCurve: Curves.ease,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayInterval: const Duration(seconds: 2),
                                  aspectRatio: 0.9,
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     ...List.generate(
                            //         images.length,
                            //         (index) => AnimatedContainer(
                            //               decoration: BoxDecoration(
                            //                 borderRadius:
                            //                     BorderRadius.circular(15),
                            //                 color: _currentPage == index
                            //                     ? cyanColor
                            //                     : blueColor,
                            //               ),
                            //               alignment: Alignment.center,
                            //               margin: const EdgeInsets.symmetric(
                            //                   horizontal: 5, vertical: 10),
                            //               duration:
                            //                   const Duration(seconds: 1),
                            //               width:
                            //                   _currentPage == index ? 22 : 8,
                            //               height: 7.5,
                            //             )),
                            //   ],
                            // ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: Get.width * 0.7,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Post(
                                        imagePost:
                                            "${AppLink.imageBlog}/${controller.blog[index].image}",
                                        textPost:
                                            "${controller.blog[index].text}",
                                      ),
                                  separatorBuilder: (context, index) => const SizedBox(
                                        width: 12,
                                      ),
                                  itemCount: controller.blog.length),
                            ),
                            const EmptySpace()
                          ],
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
