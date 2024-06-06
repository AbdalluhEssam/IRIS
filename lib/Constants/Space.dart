import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptySpace extends StatefulWidget {
  const EmptySpace({super.key});

  @override
  State<EmptySpace> createState() => _EmptySpaceState();
}

class _EmptySpaceState extends State<EmptySpace> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.12,
    );
  }
}
