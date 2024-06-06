import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/core/functions/translatedordatabase.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/icon_broken.dart';
import '../../../core/functions/alertextiapp.dart';
import '../../../core/functions/validinput.dart';
import '../../Constant.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: WillPopScope(
                onWillPop: alertExitApp,
                child: GetBuilder<SignUpControllerImp>(
                    builder: (controller) => HandlingDataRequest(
                          statusRequest: controller.statusRequest,
                          widget: Form(
                            key: controller.formState,
                            child: BackGroundImage(
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text("Sign Up",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge?.copyWith(fontSize: 25)),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GetBuilder<SignUpControllerImp>(
                                      builder: (controller) => InkWell(
                                        onTap: () {
                                          controller.imgGlr();
                                          controller.update();
                                        },
                                        child: Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle,
                                          ),
                                          width: 150,
                                          height: 150,
                                          child: Center(
                                            child: controller.myFile == null
                                                ? const Icon(IconBroken.Image_2)
                                                : Image.file(
                                                    controller.myFile!,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    CustomFormAuth(
                                      isNamber: false,

                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 100, "Username");
                                      },
                                      onChanged: (val) {
                                        controller.formState.currentState!
                                            .validate();
                                        return null;

                                        // return  EmailValidator.validate(controller.email.text);
                                      },
                                      mycontroller: controller.username,
                                      label: "Username",
                                      hinttext: "Enter your username",
                                      iconData: Icons.person,
                                      // mycontroller: ,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    CustomFormAuth(
                                      isNamber: false,
                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 100, "email");
                                      },
                                      onChanged: (val) {
                                        controller.formState.currentState!
                                            .validate();
                                        return null;

                                        // return  EmailValidator.validate(controller.email.text);
                                      },
                                      mycontroller: controller.email,
                                      label: "Email",
                                      hinttext: "Enter your email address",
                                      iconData: Icons.email_outlined,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    CustomFormAuth(
                                      isNamber: false,
                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 100, "phone");
                                      },
                                      onChanged: (val) {
                                        controller.formState.currentState!
                                            .validate();
                                        return null;

                                        // return  EmailValidator.validate(controller.email.text);
                                      },
                                      mycontroller: controller.phone,
                                      label: "phone",
                                      hinttext: "Enter your phone",
                                      iconData: Icons.call,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    GetBuilder<SignUpControllerImp>(
                                      builder: (controller) => CustomFormAuth(
                                        isNamber: false,
                                        onTap: () {
                                          controller.showPassword();
                                        },
                                        obscureText: controller.isShowPassword,
                                        onChanged: (val) {
                                          controller.formState.currentState!
                                              .validate();
                                          return null;

                                          // return  EmailValidator.validate(controller.email.text);
                                        },
                                        valid: (val) {
                                          return validInput(
                                              val!, 5, 40, "password");
                                        },
                                        mycontroller: controller.password,
                                        label: "password".tr,
                                        hinttext: "Enter your password".tr,
                                        iconData: IconBroken.Lock,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${translateDataBase("القدرة على التحدث", "Ability to talk")}",
                                          style: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: GetBuilder<
                                                  SignUpControllerImp>(
                                              init: SignUpControllerImp(),
                                              builder: (controllerImp) =>
                                                  DropdownButton(
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          AppColor.primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    isExpanded: true,
                                                    alignment:
                                                        AlignmentDirectional
                                                            .centerEnd,
                                                    hint: Text(
                                                      "${translateDataBase("القدرة على التحدث", "ability to talk")}",
                                                      style: const TextStyle(
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    items: List.generate(
                                                            controllerImp
                                                                .yesOrNo.length,
                                                            (index) =>
                                                                controllerImp
                                                                        .yesOrNo[
                                                                    index])
                                                        .map((e) =>
                                                            DropdownMenuItem(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .centerEnd,
                                                              value: controller
                                                                  .yesOrNo
                                                                  .lastIndexOf(
                                                                      e)
                                                                  .toString(),
                                                              onTap: () {
                                                                // percentage = e['percentage'];
                                                              },
                                                              child: Text(
                                                                  e.toString()),
                                                            ))
                                                        .toList(),
                                                    onChanged: (val) {
                                                      controller.talk =
                                                          val.toString();
                                                      controller.update();

                                                      controllerImp.update();
                                                    },
                                                    value: controller.talk,
                                                  )),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${translateDataBase("القدرة على الاستماع", "Ability to listen")}",
                                          style: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: GetBuilder<
                                                  SignUpControllerImp>(
                                              init: SignUpControllerImp(),
                                              builder: (controllerImp) =>
                                                  DropdownButton(
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          AppColor.primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    isExpanded: true,
                                                    alignment:
                                                        AlignmentDirectional
                                                            .centerEnd,
                                                    hint: Text(
                                                      "${translateDataBase("القدرة على الاستماع", "Ability to listen")}",
                                                      style: const TextStyle(
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    items: List.generate(
                                                            controllerImp
                                                                .yesOrNo.length,
                                                            (index) =>
                                                                controllerImp
                                                                        .yesOrNo[
                                                                    index])
                                                        .map((e) =>
                                                            DropdownMenuItem(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .centerEnd,
                                                              value: controller
                                                                  .yesOrNo
                                                                  .lastIndexOf(
                                                                      e)
                                                                  .toString(),
                                                              onTap: () {
                                                                // percentage = e['percentage'];
                                                              },
                                                              child: Text(
                                                                  e.toString()),
                                                            ))
                                                        .toList(),
                                                    onChanged: (val) {
                                                      controller.listen =
                                                          val.toString();
                                                      controller.update();

                                                      controllerImp.update();
                                                    },
                                                    value: controller.listen,
                                                  )),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${translateDataBase("فصيله الدم", "blood type")}",
                                          style: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: GetBuilder<
                                                  SignUpControllerImp>(
                                              init: SignUpControllerImp(),
                                              builder: (controllerImp) =>
                                                  DropdownButton(
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          AppColor.primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    isExpanded: true,
                                                    alignment:
                                                        AlignmentDirectional
                                                            .centerEnd,
                                                    hint: Text(
                                                      "${translateDataBase("فصيله الدم", "blood type")}",
                                                      style: const TextStyle(
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    items: List.generate(
                                                            controllerImp
                                                                .bloodType
                                                                .length,
                                                            (index) =>
                                                                controllerImp
                                                                        .bloodType[
                                                                    index])
                                                        .map((e) =>
                                                            DropdownMenuItem(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .centerEnd,
                                                              value: controller
                                                                  .bloodType
                                                                  .lastIndexOf(
                                                                      e)
                                                                  .toString(),
                                                              onTap: () {
                                                                // percentage = e['percentage'];
                                                              },
                                                              child: Text(
                                                                  e.toString()),
                                                            ))
                                                        .toList(),
                                                    onChanged: (val) {
                                                      controller
                                                              .bloodTypeChooess =
                                                          val.toString();
                                                      controller.update();

                                                      controllerImp.update();
                                                    },
                                                    value: controller
                                                        .bloodTypeChooess,
                                                  )),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${translateDataBase("النوع", "Gender")}",
                                          style: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: GetBuilder<
                                                  SignUpControllerImp>(
                                              init: SignUpControllerImp(),
                                              builder: (controllerImp) =>
                                                  DropdownButton(
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          AppColor.primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    isExpanded: true,
                                                    alignment:
                                                        AlignmentDirectional
                                                            .centerEnd,
                                                    hint: Text(
                                                      "${translateDataBase("النوع", "Gender")}",
                                                      style: const TextStyle(
                                                        color: AppColor
                                                            .primaryColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    items: List.generate(
                                                            controllerImp
                                                                .gender.length,
                                                            (index) =>
                                                                controllerImp
                                                                        .gender[
                                                                    index])
                                                        .map((e) =>
                                                            DropdownMenuItem(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .centerEnd,
                                                              value: controller
                                                                  .gender
                                                                  .lastIndexOf(
                                                                      e)
                                                                  .toString(),
                                                              onTap: () {
                                                                // percentage = e['percentage'];
                                                              },
                                                              child: Text(
                                                                  e.toString()),
                                                            ))
                                                        .toList(),
                                                    onChanged: (val) {
                                                      controller.genderChooess =
                                                          val.toString();
                                                      controller.update();

                                                      controllerImp.update();
                                                    },
                                                    value: controller
                                                        .genderChooess,
                                                  )),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${translateDataBase("تاريخ الميلاد", "Date of Birth")}",
                                          style: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            style: const TextStyle(
                                                color: AppColor.primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            controller: controller.dateOfBirth,
                                            decoration: const InputDecoration(
                                              icon: Icon(
                                                Icons.calendar_month,
                                                color: AppColor.primaryColor,
                                                size: 30,
                                              ),
                                              labelText: "تاريخ الميلاد",
                                              labelStyle: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              hintStyle: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              hintText: "تاريخ الميلاد",
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 8),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          AppColor.primaryColor,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          AppColor.primaryColor,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppColor
                                                              .primaryColor,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                            ),
                                            onTap: () async {
                                              DateTime? start =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(2200));

                                              if (start != null) {
                                                controller.dateOfBirth.text =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(start);
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    CustomButtonAuth(
                                        text: "signup".tr,
                                        onPressed: () {
                                          controller.signUp();
                                        }),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextSignUpOrIn(
                                      text1: "youhave".tr,
                                      text2: "signin".tr,
                                      onTap: () {
                                        controller.goToSignIn();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )))));
  }
}
