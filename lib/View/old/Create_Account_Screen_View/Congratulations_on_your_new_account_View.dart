import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Buttons.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';

import '../Botton_Nav_Bar_View/Botton_Nav_Bar_View.dart';

class CongratulationsOnYourNewAccountView extends StatefulWidget {
  const CongratulationsOnYourNewAccountView({super.key});

  @override
  State<CongratulationsOnYourNewAccountView> createState() =>
      _CongratulationsOnYourNewAccountViewState();
}

class _CongratulationsOnYourNewAccountViewState
    extends State<CongratulationsOnYourNewAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const EmptySpace(),
              Container(
                width: Get.width * 0.8,
                height: Get.height * 0.33,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/9.png"), fit: BoxFit.cover)),
              ),
              const EmptySpace(),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                    style: bigstBlueColor,
                    textAlign: TextAlign.center,
                    "Health Profile"),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                    style: bigstBlueColor,
                    textAlign: TextAlign.center,
                    "Confectioned"),
              ),
              const EmptySpace(),
              MainButton(
                nameButton: "let’s Get started",
                onClickButton: () {
                  Get.to(const BottonNavBarView());
                },
              ),
              const EmptySpace(),
            ],
          ),
        ),
      ),
    );
  }
}
