import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';

class SettingButton extends StatefulWidget {
  final Icon iconSettingButton;
  final String nameSettingButton;
  final Widget child;

  //final String? Function()? onClickSettingButton;

  const SettingButton({
    super.key,
    required this.iconSettingButton,
    required this.nameSettingButton,
    required this.child,
    //this.onClickSettingButton
  });

  @override
  State<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: SizedBox(
        width: Get.width,
        child: MaterialButton(
          onPressed: () {
            Get.to(SettingButtonDetails(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const EmptySpace(),
                    Text(
                      widget.nameSettingButton,
                      style: bigstBlueColor,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(child: widget.child),
                  ],
                ),
              ),
            ));
          },
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  widget.iconSettingButton,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.nameSettingButton,
                    style: bigCyanColor,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: blueColor,
                    size: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                height: 2,
                thickness: 2,
                color: blueColor,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingButtonDetails extends StatefulWidget {
  final Widget child;

  const SettingButtonDetails({super.key, required this.child});

  @override
  State<SettingButtonDetails> createState() => _SettingButtonDetailsState();
}

class _SettingButtonDetailsState extends State<SettingButtonDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImage(
        child: widget.child,
      ),
    );
  }
}
