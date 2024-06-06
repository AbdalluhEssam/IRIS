import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/core/constant/icon_broken.dart';
import '../../Constants/Colors.dart';

class UserAppBar extends StatefulWidget {
  final String nameOfUser;

  const UserAppBar({super.key, required this.nameOfUser});

  @override
  State<UserAppBar> createState() => _UserAppBarState();
}

class _UserAppBarState extends State<UserAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: blueColor,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Hi, ${widget.nameOfUser}", style: bigWhiteColor),
              const SizedBox(
                width: 12,
              ),
              const Icon(
                FontAwesomeIcons.hand,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: mediumBlueColor,
                    cursorColor: blackColor,
                    cursorOpacityAnimates: true,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      //prefixIcon: widget.iconOfCustomTextFormField,
                      labelText: "Search",
                      labelStyle: mediumBlueColor,
                      prefixIcon: Icon(
                        IconBroken.Search,
                        color: blueColor,
                      ),
                      contentPadding: EdgeInsets.all(13),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.1, color: whiteColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          )),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.1, color: whiteColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.1, color: whiteColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: Get.width * 0.15,
                height: 50,
                decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconBroken.Filter,
                    color: blueColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class CarouselSliderScreen extends StatefulWidget {
  final Widget child;

  const CarouselSliderScreen({super.key, required this.child});

  @override
  State<CarouselSliderScreen> createState() => _CarouselSliderScreenState();
}

class _CarouselSliderScreenState extends State<CarouselSliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: widget.child,
      ),
    );
  }
}

class DetailsOfPost extends StatefulWidget {
  final Widget child;

  const DetailsOfPost({super.key, required this.child});

  @override
  State<DetailsOfPost> createState() => _DetailsOfPostState();
}

class _DetailsOfPostState extends State<DetailsOfPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: widget.child,
      ),
    );
  }
}

class Post extends StatefulWidget {
  //final void Function()? onClickPost;
  final String textPost;
  final String imagePost;

  const Post(
      {super.key,
      //this.onClickPost,
      required this.textPost,
      required this.imagePost});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: Get.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: whiteColor,
          border: Border.all(color: cyanColor, width: 1.5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CachedNetworkImage(
                imageUrl: widget.imagePost,
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
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Text(
                widget.textPost,
                style: smallBlueColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            MaterialButton(
              onPressed: () {
                Get.to(
                  DetailsOfPost(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
const SizedBox(height: 30,),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                  color: blueColor,
                                  iconSize: 25),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Container(
                            margin: const EdgeInsets.all(20),
                            width: Get.width,
                            height: Get.width ,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              color: whiteColor,
                              border: Border.all(color: cyanColor, width: 1.5),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  width: Get.width,
                                  height: Get.height * 0.25,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: whiteColor,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.imagePost,
                                    width: Get.width,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: blueColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15, left: 15),
                                  child: Text(
                                    widget.textPost,
                                    style: smallBlueColor,
                                    textAlign: TextAlign.center,
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                );
              },
              child: Container(
                width: Get.width * 0.5,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: blueColor),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Read More",
                      style: smallWhiteColor,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String nameUser;
//
//   UserAppBar({required this.nameUser});
//
//   @override
//   Size get preferredSize => const Size.fromHeight(100);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: blueColor,
//       title: Text(
//         "Hi, $nameUser",
//         style: bigWhiteColor,
//       ),
//       elevation: 0.0,
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(50.0),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 decoration: const BoxDecoration(
//                     color: whiteColor,
//                     borderRadius: BorderRadius.all(Radius.circular(12))),
//                 child: TextFormField(
//                   keyboardType: TextInputType.text,
//                   style: mediumBlueColor,
//                   cursorColor: blackColor,
//                   cursorOpacityAnimates: true,
//                   decoration: const InputDecoration(
//                     //prefixIcon: widget.iconOfCustomTextFormField,
//                     labelText: "Search",
//                     labelStyle: mediumBlueColor,
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: blueColor,
//                     ),
//                     contentPadding: EdgeInsets.all(13),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(width: 2, color: cyanColor),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(7),
//                         )),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(width: 2, color: cyanColor),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(7),
//                         )),
//                     enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(width: 2, color: cyanColor),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(7),
//                         )),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               width: Get.width * 0.15,
//               height: Get.height * 0.06,
//               decoration: const BoxDecoration(
//                   color: whiteColor,
//                   borderRadius: BorderRadius.all(Radius.circular(12))),
//               child: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.menu,
//                   color: blueColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
