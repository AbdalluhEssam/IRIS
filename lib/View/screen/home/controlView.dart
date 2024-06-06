import 'package:iris_wheel_assist/controller/home/doctors_controller/children_controller.dart';
import 'package:iris_wheel_assist/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Images.dart';
import '../../../core/class/handlingdataview.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChildrenControllerImp());
    return Scaffold(
      appBar: AppBar(

        title: const Text('Control',style: TextStyle(color: Colors.white),),
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: false,
        

      ),
      body: GetBuilder<ChildrenControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: BackGroundImage(
              child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ControlButton(label: 'M1'),
                        ControlButton(label: 'Off/On'),
                        ControlButton(label: 'M2'),
                      ],
                    ),
                    Spacer(),
                    CircularControlPad(),
                    Spacer(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}


class ControlButton extends StatelessWidget {
  final String label;

  ControlButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue, backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        side: BorderSide(color: Colors.blue),
      ),
    );
  }
}

class CircularControlPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            child: ControlArrowButton(icon: Icons.arrow_upward),
          ),
          Positioned(
            bottom: 20,
            child: ControlArrowButton(icon: Icons.arrow_downward),
          ),
          Positioned(
            left: 20,
            child: ControlArrowButton(icon: Icons.arrow_back),
          ),
          Positioned(
            right: 20,
            child: ControlArrowButton(icon: Icons.arrow_forward),
          ),
          ControlCenterButton(),
        ],
      ),
    );
  }
}

class ControlArrowButton extends StatelessWidget {
  final IconData icon;

  ControlArrowButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue, backgroundColor: Colors.white, shape: CircleBorder(),
        padding: EdgeInsets.all(12),
        elevation: 5,
      ),
    );
  }
}

class ControlCenterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.circle, size: 40),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue, backgroundColor: Colors.white, shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        elevation: 5,
      ),
    );
  }
}