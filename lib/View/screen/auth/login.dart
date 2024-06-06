import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertextiapp.dart';
import '../../../core/functions/validinput.dart';
import '../../Constant.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formState,
                      child: BackGroundImage(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const ImageLogoApp(),
                              const BigSpace(),
                              CustomFormAuth(
                                isNamber: false,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "email");
                                },
                                onChanged: (val) {
                                  controller.formState.currentState!.validate();
                                  return null;

                                  // return  EmailValidator.validate(controller.email.text);
                                },
                                mycontroller: controller.email,
                                label: "email".tr,
                                hinttext: "Enter your email address",
                                iconData: Icons.email,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              GetBuilder<LoginControllerImp>(
                                builder: (controller) => CustomFormAuth(
                                  isNamber: false,
                                  onTap: () {
                                    controller.showPassword();
                                  },
                                  obscureText: controller.isShowPassword,
                                  valid: (val) {
                                    return validInput(val!, 5, 40, "password");
                                  },
                                  onChanged: (val) {
                                    controller.formState.currentState!
                                        .validate();
                                    return null;

                                    // return  EmailValidator.validate(controller.email.text);
                                  },
                                  mycontroller: controller.password,
                                  label: "password".tr,
                                  hinttext: "Enter your password".tr,
                                  iconData: Icons.lock,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: controller.isChecked,
                                        activeColor: babyZoneColor,
                                        onChanged: (newBool) {
                                          controller.isChecked = newBool;
                                          controller.update();
                                        },
                                      ),
                                      const Text("Remember me",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13)),
                                    ],
                                  ),
                                  TextButton(
                                    style: const ButtonStyle(
                                        overlayColor: MaterialStatePropertyAll(
                                            Colors.white)),
                                    onPressed: () {
                                      controller.goToForgetPassword();
                                    },
                                    child: const Text("Forget Password",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: babyZoneColor,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              CustomButtonAuth(
                                  text: "signin".tr,
                                  onPressed: () {
                                    controller.login();
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextSignUpOrIn(
                                text1: "have".tr,
                                text2: "signup".tr,
                                onTap: () {
                                  controller.goToSignUp();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )))));
  }
}
