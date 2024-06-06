import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Buttons.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';
import 'package:iris_wheel_assist/Constants/Images.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';
import '../../../ViewModel/Create_Account_ViewModel/CreateAccountViewModel.dart';
import '../../../ViewModel/Create_Account_ViewModel/Validators.dart';
import '../Botton_Nav_Bar_View/Botton_Nav_Bar_View.dart';
import 'Sign_Up_Screen_View.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  String? email;
  String? password;
  late GlobalKey<FormState> formKey;
  final String _isValidEmail = "";
  final CheckMarkController _checkMarkControllerEmail = CheckMarkController();
  TextEditingController emailController = TextEditingController();
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
                  "Welcome back",
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
                  height: 100,
                ),
                const GoogleAndFaceBookButton(),
                const SizedBox(
                  height: 20,
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
                    /// للاخطاء داخل ال تيكست فورم فيلد
                    if (value == null || value.isEmpty) {
                      return validateEmail(value!);
                    }

                    if (!value.contains('@')) {
                      return 'Email must contain @ symbol';
                    }
                    return validateLengthEmail(value);
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
                  height: 30,
                ),
                MainButton(
                  nameButton: "Login",
                  onClickButton: () {
                    setState(() {
                      if (_isValidEmail.isEmpty &&
                          _isValidEmail.contains('@') &&
                          _isValidEmail.length <= 50) {
                        _checkMarkControllerEmail._isValid = true;
                      }
                    });
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      ("uri", email!, password!);
                      ("$email || $password");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottonNavBarView()));
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
                      "Don’t have an account ?",
                      style: smallBlueColor,
                    ),
                    TextButton(
                        style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(0.0),
                        ),
                        onPressed: () {
                          Get.to(const SignUpScreenView());
                        },
                        child: const Text(
                          "Join us",
                          style: mediumWhiteColor,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
