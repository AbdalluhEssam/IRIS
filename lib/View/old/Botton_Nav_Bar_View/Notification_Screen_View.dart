import 'package:flutter/material.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';

import '../../../ViewModel/Botton_Nav_Bar_ViewModel/Notification_Screen_ViewModel.dart';

class NotificationScreenView extends StatefulWidget {
  const NotificationScreenView({super.key});

  @override
  State<NotificationScreenView> createState() => _NotificationScreenViewState();
}

class _NotificationScreenViewState extends State<NotificationScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackGroundImage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EmptySpace(),
              Text(
                "Notifications",
                style: bigstBlueColor,
              ),
              SizedBox(
                height: 25,
              ),
              DateOfNotification(
                dateOfNotification: "Today - 20 Sep, 2020",
              ),
              NotificationDetails(
                textNotificationDetails:
                    "have appointment with mahbuba isl am at 9:00 pm today",
                // onClickNotificationDetails: () {},
              ),
              NotificationDetails(
                textNotificationDetails:
                    "have appointment with mahbuba isl am at 9:00 pm today",
                // onClickNotificationDetails: () {},
              ),
              NotificationDetails(
                textNotificationDetails:
                    "have appointment with mahbuba isl am at 9:00 pm today",
                // onClickNotificationDetails: () {},
              ),
              DateOfNotification(
                dateOfNotification: "Yesterday",
              ),
              NotificationDetails(
                textNotificationDetails:
                    "have appointment with mahbuba isl am at 9:00 pm today",
                // onClickNotificationDetails: () {},
              ),
              NotificationDetails(
                textNotificationDetails:
                    "have appointment with mahbuba isl am at 9:00 pm today",
                // onClickNotificationDetails: () {},
              ),
              NotificationDetails(
                textNotificationDetails:
                    "have appointment with mahbuba isl am at 9:00 pm today",
                // onClickNotificationDetails: () {},
              ),
              NotificationDetails(
                textNotificationDetails:
                    "have appointment with mahbuba isl am at 9:00 pm today",
                // onClickNotificationDetails: () {},
              ),
              NotificationDetails(
                textNotificationDetails:
                    "have appointment with mahbuba isl am at 9:00 pm today",
                //onClickNotificationDetails: () {},
              ),
              EmptySpace(),
            ],
          ),
        ),
      ),
    );
  }
}
