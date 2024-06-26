import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/core/constant/icon_broken.dart';
import 'package:jiffy/jiffy.dart' show Jiffy;
import '../../../../controller/home/notification_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedordatabase.dart';

class NotificationScreen extends GetView<NotificationControllerImp> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationControllerImp());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(translateDataBase("الاشعارات", "Notification")),
          centerTitle: true,
        ),
        body: GetBuilder<NotificationControllerImp>(
          builder: (controller) => HandlingDataViewNot(
              statusRequest: controller.statusRequest,
              widget: ListView.separated(
                itemCount: controller.notification.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.primaryColor.withOpacity(0.5),
                                blurRadius: 5)
                          ]),
                      child: Card(
                          color: AppColor.backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColor.white,
                                  child: Icon(IconBroken.Calendar,color: AppColor.primaryColor,),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${controller.notification[index].usersName}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.primaryColor)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          "${controller.notification[index].message}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColor.black)),
                                    ],
                                  ),
                                ),
                                Text(
                                    Jiffy("${DateTime.parse(controller.notification[index].date!)}")
                                        .fromNow(),
                                    style: const TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor))
                              ],
                            ),
                          )));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 15),
              )),
        ));
  }
}
