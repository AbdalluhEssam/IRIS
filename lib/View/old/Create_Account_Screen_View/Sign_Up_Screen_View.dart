import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Buttons.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/ViewModel/Create_Account_ViewModel/CreateAccountViewModel.dart';
import 'package:iris_wheel_assist/ViewModel/Create_Account_ViewModel/Validators.dart';

import '../../../Constants/Fonts.dart';
import '../../../Constants/Space.dart';
import 'Complete_user_data_View.dart';
import 'Login_Screen_View.dart';


class SignUpScreenView extends StatefulWidget {
  const SignUpScreenView({super.key});

  @override
  State<SignUpScreenView> createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  bool? isChecked = false;
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
    return Scaffold(
      body: BackGroundImage(
          child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const EmptySpace(),
              const Text(
                "Join us to start searching",
                style: bigstBlueColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting",
                  style: mediumCyanColor,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const GoogleAndFaceBookButton(),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                titleOfCustomTextFormField: "Name",
                suffixIcon: _checkMarkControllerName.isValid
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
                      .updateValidity(value == null || value.length <= 50);
                  return null;
                },
                onSaved: (data) {
                  name = data;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return validateName(value!);
                  }
                  return validateLengthName(value);
                },
              ),
              CustomTextFormField(
                titleOfCustomTextFormField: "Email",
                suffixIcon: _checkMarkControllerEmail.isValid
                    ? const Icon(Icons.check)
                    : null,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                onEditingComplete: () {
                  /// لاظهار علامة الصح
                  setState(() {});
                  return null;
                },
                onChanged: (value) {
                  _checkMarkControllerEmail.updateValidity(value == null ||
                      value.contains('@') && value.length <= 50);
                  return null;
                },
                onSaved: (data) {
                  email = data;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return validateEmail(value!);
                  }

                  if (!value.contains('@')) {
                    return 'Email must contain @ symbol';
                  }
                  return validateLengthEmail(value);
                },
              ),
              CustomTextFormField(
                titleOfCustomTextFormField: "Phone",
                suffixIcon: _checkMarkControllerPhone.isValid
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
                      .updateValidity(value == null || value.length >= 10);
                  return null;
                },
                onSaved: (data) {
                  phone = data;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return validateEmptyPhone(value!);
                  }
                  return validatePhone(value);
                },
              ),
              CustomTextFormFieldPassword(
                titleOfFormField: "Password",
                keyboardType: TextInputType.emailAddress,
                onSaved: (data) {
                  password = data;
                },
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return validatePassword(value!);
                  }
                  return validateMinLength(value);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    shape: const CircleBorder(
                        side: BorderSide(width: 1.5, color: cyanColor)),
                    activeColor: cyanColor,
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = newBool;
                      });
                    },
                  ),
                  const Text(
                    "I agree with the Terms of Service & Privacy Policy",
                    style: TextStyle(
                        color: blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 11),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MainButton(
                nameButton: "Sign up",
                onClickButton: () {
                  setState(() {
                    if (_isValidName.isNotEmpty && _isValidName.length <= 50) {
                      _checkMarkControllerName._isValid = true;
                    }
                  });

                  setState(() {
                    if (_isValidEmail.isEmpty &&
                        _isValidEmail.contains('@') &&
                        _isValidEmail.length <= 50) {
                      _checkMarkControllerEmail._isValid = true;
                    }
                  });

                  setState(() {
                    if (_isValidPhone.isNotEmpty &&
                        _isValidPhone.length >= 10) {
                      _checkMarkControllerPhone._isValid = true;
                    }
                  });

                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ("uri", name!, email!, phone!, password!);
                    ("$name || $email || $phone|| $password");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompleteUserDataView()));
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account ?",
                    style: smallBlueColor,
                  ),
                  TextButton(
                      style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(0.0),
                      ),
                      onPressed: () {
                        Get.to(const LoginScreenView());
                      },
                      child: const Text(
                        "Log in",
                        style: mediumWhiteColor,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class CheckMarkController {
  bool _isValid = false;

  bool get isValid => _isValid;

  void updateValidity(bool newValue) {
    _isValid = newValue;
  }
}
