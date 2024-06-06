import 'package:iris_wheel_assist/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/Images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Get.toNamed(AppRoute.homeScreen);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,),
        body: BackGroundImage(
          child: ListView(
            children: [
              SizedBox(
                height: Get.height * 0.33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizeTransition(
                    sizeFactor: _animation,
                    axis: Axis.vertical,
                    axisAlignment: -1,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: LogoAppImage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
