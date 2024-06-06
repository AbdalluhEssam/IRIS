import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';
import 'package:iris_wheel_assist/Constants/Video.dart';
import 'package:iris_wheel_assist/ViewModel/Botton_Nav_Bar_ViewModel/Home_Screen_ViewModel.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int index = 0;
  final List<String> images = [
    'https://gate.ahram.org.eg/Media/News/2021/8/11/2021-637642679521048674-104.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkeLKD0CR7cWHSgeulWx4f_Qn_B-M91lKIaw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4JBFscbVKuqZY0-dxqawZ4y4DmzgIIG8LJw&usqp=CAU',
    'https://www.dostor.org/Upload/libfiles/371/8/790.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTteyqz3YjxFFYatDpbvyAynJsLwALO5kN6iw&usqp=CAU',
  ];

  List<Widget> genarateImagesTiles() {
    return images
        .map((element) => InkWell(
              onTap: () {
                if (_currentPage == 0) {
                } else if (_currentPage == 1) {
                  //Get.to(Conatint_Of_Film_Or_Series());
                } else if (_currentPage == 2) {
                  //Get.to(Conatint_Of_Film_Or_Series());
                } else if (_currentPage == 3) {
                  //Get.to(Conatint_Of_Film_Or_Series());
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    imageUrl: element,
                    width: Get.width,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: blueColor,
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }

  final CarouselController carouselController = CarouselController();
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int currentindex = 0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      return setState(() {
        if (_currentPage < 2) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      });
    });
  }

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: Column(
          children: [
            const UserAppBar(
              nameOfUser: "Kerolos",
            ),
            SizedBox(
              //color: Colors.green,
              height: Get.height * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // const UserAppBar(
                    //   nameOfUser: "Kerolos",
                    // ),
                    const SizedBox(
                      height: 35,
                    ),
                    GradientSlideToAct(
                      width: Get.width * 0.7,
                      dragableIconBackgroundColor: cyanColor,
                      text: "Swipe To Live",
                      textStyle: smallWhiteColor,
                      //textStyle: Get.isDarkMode ? smallWhiteColor : smallBlackColor,
                      backgroundColor: blueColor,
                      onSubmit: () {
                        Get.to(const Video_Play_Screen(
                            video_Url:
                                "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
                      },
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     MaterialButton(
                    //         onPressed: () {
                    //           ThemeService().changeThemeMode();
                    //         },
                    //         child: const Text("change Mode"))
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 35,
                    // ),
                    CarouselSlider(
                        items: genarateImagesTiles(),
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlay: true,
                          reverse: true,
                          viewportFraction: 1,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPageChanged: (index, reason) {
                            setState(() {
                              setState(() {
                                _currentPage = index;
                              });
                            });
                          },
                          //aspectRatio: 500.0,
                          height: MediaQuery.of(context).size.height * 0.24,

                          autoPlayCurve: Curves.ease,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayInterval: const Duration(seconds: 2),
                          aspectRatio: 0.9,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            images.length,
                            (index) => AnimatedContainer(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: _currentPage == index
                                        ? cyanColor
                                        : blueColor,
                                  ),
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  duration: const Duration(seconds: 1),
                                  width: _currentPage == index ? 22 : 8,
                                  height: 7.5,
                                )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Post(
                            imagePost:
                                "https://gate.ahram.org.eg/Media/News/2021/8/11/2021-637642679521048674-104.jpg",
                            textPost:
                                "Lorem Ipsum is simply dummy text of the printing",
                          ),
                          Post(
                            imagePost:
                                "https://gate.ahram.org.eg/Media/News/2021/8/11/2021-637642679521048674-104.jpg",
                            textPost:
                                "Lorem Ipsum is simply dummy text of the printing",
                          ),
                          Post(
                            imagePost:
                                "https://gate.ahram.org.eg/Media/News/2021/8/11/2021-637642679521048674-104.jpg",
                            textPost:
                                "Lorem Ipsum is simply dummy text of the printing",
                          ),
                          Post(
                            imagePost:
                                "https://gate.ahram.org.eg/Media/News/2021/8/11/2021-637642679521048674-104.jpg",
                            textPost:
                                "Lorem Ipsum is simply dummy text of the printing",
                          ),
                        ],
                      ),
                    ),
                    const EmptySpace()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
