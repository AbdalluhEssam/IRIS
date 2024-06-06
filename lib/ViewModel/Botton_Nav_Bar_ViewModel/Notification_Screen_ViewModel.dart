import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';

class DateOfNotification extends StatefulWidget {
  final String dateOfNotification;

  const DateOfNotification({super.key, required this.dateOfNotification});

  @override
  State<DateOfNotification> createState() => _DateOfNotificationState();
}

class _DateOfNotificationState extends State<DateOfNotification> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            children: [
              Text(
                widget.dateOfNotification,
                style: mediumBlueColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

class NotificationDetails extends StatefulWidget {
  //final void Function()? onClickNotificationDetails;
  final String textNotificationDetails;

  const NotificationDetails(
      {super.key,
      //this.onClickNotificationDetails,
      required this.textNotificationDetails});

  @override
  State<NotificationDetails> createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: cyanColor, width: 1.5)),
            child: MaterialButton(
              onPressed: null,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FloatingActionButton(
                        shape: const CircleBorder(
                            side: BorderSide(
                          color: whiteColor,
                        )),
                        backgroundColor: whiteColor,
                        onPressed: null,
                        elevation: 5.0,
                        child: Container(
                          width: Get.width * 0.15,
                          height: Get.height * 0.1,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/10.png"))),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: Get.width * 0.55,
                        //color: Colors.grey,
                        child: Text(
                          widget.textNotificationDetails,
                          style: smallBlueColor,
                          //textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
