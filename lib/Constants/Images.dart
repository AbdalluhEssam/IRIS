import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackGroundImage extends StatelessWidget {
  final Widget child;

  const BackGroundImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/1.png",
            ),
            fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}

class LogoAppImage extends StatefulWidget {
  const LogoAppImage({super.key});

  @override
  State<LogoAppImage> createState() => _LogoAppImageState();
}

class _LogoAppImageState extends State<LogoAppImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: Get.width * 0.4,
        height: Get.height * 0.2,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/2.png"), fit: BoxFit.fill)),
      ),
    );
  }
}

class AppImage extends StatefulWidget {
  final String appImage;

  const AppImage({super.key, required this.appImage});

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: Get.width * 0.8,
        height: Get.height * 0.37,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.appImage), fit: BoxFit.fill)),
      ),
    );
  }
}
