import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';

class ControlScreenView extends StatefulWidget {
  const ControlScreenView({super.key});

  @override
  State<ControlScreenView> createState() => _ControlScreenViewState();
}

class _ControlScreenViewState extends State<ControlScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const EmptySpace(),
              const Text(
                "Control",
                style: bigstBlueColor,
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.6,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/13.png"),
                          fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
