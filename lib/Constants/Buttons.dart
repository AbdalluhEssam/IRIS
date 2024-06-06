import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import '../View/old/Create_Account_Screen_View/Login_Screen_View.dart';

class MainButton extends StatefulWidget {
  final String nameButton;
  final void Function()? onClickButton;

  const MainButton({super.key, required this.nameButton, this.onClickButton});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      height: Get.height * 0.065,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: blueColor),
      child: MaterialButton(
        elevation: 0.0,
        //hoverColor: backGroundColor,
        onPressed: widget.onClickButton,
        child: Text(
          widget.nameButton,
          style: bigWhiteColor,
        ),
      ),
    );
  }
}

class SkipAndNextButton extends StatefulWidget {
  final void Function()? onClickNextButton;

  const SkipAndNextButton({super.key, this.onClickNextButton});

  @override
  State<SkipAndNextButton> createState() => _SkipAndNextButtonState();
}

class _SkipAndNextButtonState extends State<SkipAndNextButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width * 0.35,
          height: Get.height * 0.06,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: whiteColor),
          child: MaterialButton(
            elevation: 0.0,
            onPressed: () {
              Get.to(const LoginScreenView());
            },
            child: const Text(
              "SKIP",
              style: bigBlueColor,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: Get.width * 0.35,
          height: Get.height * 0.06,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: cyanColor),
          child: MaterialButton(
            elevation: 0.0,
            //hoverColor: backGroundColor,
            onPressed: widget.onClickNextButton,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NEXT",
                  style: bigWhiteColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: whiteColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GoogleAndFaceBookButton extends StatefulWidget {
  const GoogleAndFaceBookButton({super.key});

  @override
  State<GoogleAndFaceBookButton> createState() =>
      _GoogleAndFaceBookButtonState();
}

class _GoogleAndFaceBookButtonState extends State<GoogleAndFaceBookButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width * 0.4,
          height: Get.height * 0.07,
          decoration: BoxDecoration(
            //color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.5,
              color: cyanColor,
            ),
          ),
          child: MaterialButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("images/6.png")),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Google",
                  style: mediumBlueColor,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: Get.width * 0.4,
          height: Get.height * 0.07,
          decoration: BoxDecoration(
            //color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.5,
              color: cyanColor,
            ),
          ),
          child: MaterialButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("images/7.png")),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Facebook",
                  style: mediumBlueColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
