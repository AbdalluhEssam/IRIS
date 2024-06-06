import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import '../Welcome_Screen_View/First_Welcome_Screen_View.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 6),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 6)).then((value) {
      Get.to(const FirstWelcomeScreenView());
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
