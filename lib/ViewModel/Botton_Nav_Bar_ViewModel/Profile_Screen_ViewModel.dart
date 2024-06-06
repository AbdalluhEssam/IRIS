import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';
import '../../Constants/Buttons.dart';
import '../../Constants/Camara.dart';
import '../../View/old/Create_Account_Screen_View/Complete_user_data_View.dart';
import '../Create_Account_ViewModel/CreateAccountViewModel.dart';
import '../Create_Account_ViewModel/Validators.dart';

class CheckMarkController {
  bool _isValid = false;

  bool get isValid => _isValid;

  void updateValidity(bool newValue) {
    _isValid = newValue;
  }
}

class ProfileUser extends StatefulWidget {
  //final String imageUser;
  final String nameUser;
  final String phoneUser;

  //final String passwordUser;

  // final void Function()? onClickEditProfileUser;

  const ProfileUser({
    super.key,
    //required this.imageUser,
    required this.nameUser,
    required this.phoneUser,
    //required this.passwordUser,
  });

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  String? name;
  String? email;
  String? phone;
  String? password;
  late GlobalKey<FormState> formKey;
  final String _isValidName = "";
  final String _isValidEmail = "";
  final String _isValidPhone = "";
  final CheckMarkController _checkMarkControllerName = CheckMarkController();
  final CheckMarkController _checkMarkControllerEmail = CheckMarkController();
  final CheckMarkController _checkMarkControllerPhone = CheckMarkController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Material(
            shape: const CircleBorder(),
            elevation: 5.0,
            child: InkWell(
              onTap: null,
              child: Container(
                width: Get.width * 0.49,
                height: Get.height * 0.25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: whiteColor),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: Get.width * 0.4,
                        height: Get.height * 0.2,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("images/12.png"))),
                        // child: CachedNetworkImage(
                        //   imageUrl: widget.imageUser,
                        //   width: Get.width * 0.4,
                        //   height: Get.height * 0.2,
                        // ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.to(EditProfileUser(
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        CustomTextFormField(
                                          titleOfCustomTextFormField:
                                              "Update Name",
                                          suffixIcon:
                                              _checkMarkControllerName.isValid
                                                  ? const Icon(Icons.check)
                                                  : null,
                                          keyboardType: TextInputType.name,
                                          controller: nameController,
                                          onEditingComplete: () {
                                            /// لاظهار علامة الصح
                                            setState(() {});
                                            return null;
                                          },
                                          onChanged: (value) {
                                            _checkMarkControllerName
                                                .updateValidity(value == null ||
                                                    value.length <= 50);
                                            return null;
                                          },
                                          onSaved: (data) {
                                            name = data;
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return validateName(value!);
                                            }
                                            return validateLengthName(value);
                                          },
                                        ),
                                        CustomTextFormField(
                                          titleOfCustomTextFormField:
                                              "Update Phone",
                                          suffixIcon:
                                              _checkMarkControllerPhone.isValid
                                                  ? const Icon(Icons.check)
                                                  : null,
                                          keyboardType: TextInputType.phone,
                                          controller: phoneController,
                                          onEditingComplete: () {
                                            /// لاظهار علامة الصح
                                            setState(() {});
                                            return null;
                                          },
                                          onChanged: (value) {
                                            _checkMarkControllerPhone
                                                .updateValidity(value == null ||
                                                    value.length >= 10);
                                            return null;
                                          },
                                          onSaved: (data) {
                                            phone = data;
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return validateEmptyPhone(value!);
                                            }
                                            return validatePhone(value);
                                          },
                                        ),
                                        CustomTextFormFieldPassword(
                                          titleOfFormField: "Update Password",
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onSaved: (data) {
                                            password = data;
                                          },
                                          controller: passwordController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return validatePassword(value!);
                                            }
                                            return validateMinLength(value);
                                          },
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        MainButton(
                                          nameButton: "Update",
                                          onClickButton: () {
                                            setState(() {
                                              if (_isValidName.isNotEmpty &&
                                                  _isValidName.length <= 50) {
                                                _checkMarkControllerName
                                                    ._isValid = true;
                                              }
                                            });

                                            setState(() {
                                              if (_isValidPhone.isNotEmpty &&
                                                  _isValidPhone.length >= 10) {
                                                _checkMarkControllerPhone
                                                    ._isValid = true;
                                              }
                                            });

                                            if (formKey.currentState!
                                                .validate()) {
                                              formKey.currentState!.save();
                                              ("uri", name!, email!, phone!);
                                              ("$name || $email || $phone");
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CompleteUserDataView()));
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                              },
                              icon: Container(
                                width: Get.width * 0.1,
                                height: Get.height * 0.06,
                                decoration: const BoxDecoration(
                                    color: blueColor,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage("images/11.png"))),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: SizedBox(
              //color: Colors.green,
              width: Get.width,
              child: Text(
                textAlign: TextAlign.center,
                widget.nameUser,
                style: bigstCyanColor,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ProfileData(
              nameIconProfileData: "Name",
              iconProfileData: const Icon(
                Icons.person_2_outlined,
                color: blueColor,
                size: 30,
              ),
              nameProfileData: widget.nameUser),
          ProfileData(
              nameIconProfileData: "Phone",
              iconProfileData: const Icon(
                Icons.phone_outlined,
                color: blueColor,
                size: 30,
              ),
              nameProfileData: widget.phoneUser),
          const ProfileData(
              nameIconProfileData: "Password",
              iconProfileData: Icon(
                Icons.lock_person_outlined,
                color: blueColor,
                size: 30,
              ),
              nameProfileData: "0 *********"),
          const EmptySpace(),
        ],
      ),
    );
  }
}

class ProfileData extends StatefulWidget {
  final Icon iconProfileData;
  final String nameIconProfileData;
  final String nameProfileData;

  const ProfileData(
      {super.key,
      required this.iconProfileData,
      required this.nameProfileData,
      required this.nameIconProfileData});

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
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
          onPressed: null,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  widget.iconProfileData,
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.nameIconProfileData,
                    style: bigCyanColor,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: Get.width * 0.45,
                    //color: Colors.green,
                    child: Text(
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      widget.nameProfileData,
                      style: bigBlueColor,
                    ),
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

class EditProfileUser extends StatefulWidget {
  final Widget child;

  const EditProfileUser({
    super.key,
    required this.child,
  });

  @override
  State<EditProfileUser> createState() => _EditProfileUserState();
}

class _EditProfileUserState extends State<EditProfileUser> {
  File? image2;

  pickImage(ImageSource source) {
    AppImagePicker_home(source: source).pick(onpick: (File? image) {
      setState(() {
        this.image2 = image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackGroundImage(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const EmptySpace(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: blueColor,
                    iconSize: 25),
                const Text(
                  "Edit Profile",
                  textAlign: TextAlign.center,
                  style: bigstBlueColor,
                ),
                IconButton(
                  onPressed: null,
                  icon: Container(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              pickImage(ImageSource.camera);
            },
            // child: Container(
            //   width: Get.width * 0.6,
            //   height: Get.height * 0.3,
            //   decoration:   BoxDecoration(
            //     image: DecorationImage(image: AssetImage("images/12.png")),
            //       shape: BoxShape.circle, color: Colors.green),
            //   child: const Icon(Icons.photo_camera_back_outlined,color: whiteColor,size: 35,),
            // ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: blueColor,
                  ),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Update Your Image Profile",
                            style: mediumWhiteColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.photo_camera_back_outlined,
                            color: whiteColor,
                            size: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          if (image2 != null)
            Material(
              shape: const CircleBorder(),
              elevation: 5.0,
              child: InkWell(
                onTap: null,
                child: Container(
                  width: Get.width * 0.49,
                  height: Get.height * 0.235,
                  decoration: const BoxDecoration(
                      //image: DecorationImage(image: AssetImage("images/12.png")),
                      shape: BoxShape.circle,
                      color: whiteColor),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(600),
                    child: Material(
                      shape: const CircleBorder(),
                      elevation: 5.0,
                      child: Image.file(
                        image2!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          widget.child,
        ],
      ),
    )));
  }
}
