import 'package:flutter/material.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final String titleOfCustomTextFormField;
  final Widget? suffixIcon;
  final String? Function()? onEditingComplete;

  //final Icon iconOfCustomTextFormField;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CustomTextFormField(
      {super.key,
      required this.titleOfCustomTextFormField,
      //required this.iconOfCustomTextFormField,
      this.validator,
      this.onSaved,
      this.keyboardType,
      this.controller,
      this.onChanged,
      this.suffixIcon, this.onEditingComplete});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              onEditingComplete: widget.onEditingComplete,
              onChanged: widget.onChanged,
              controller: widget.controller,
              validator: widget.validator ??
                  (value) {
                    if (value!.isEmpty) {
                      return "  please fill out the field!";
                    }
                    return null;
                  },
              onSaved: widget.onSaved,
              keyboardType: widget.keyboardType,
              style: mediumBlueColor,
              cursorColor: blackColor,
              cursorOpacityAnimates: true,
              decoration: InputDecoration(
                //prefixIcon: widget.iconOfCustomTextFormField,
                suffixIcon: widget.suffixIcon,
                suffixIconColor: Colors.green,
                labelText: " ${widget.titleOfCustomTextFormField}...",
                labelStyle: mediumBlueColor,
                contentPadding: const EdgeInsets.all(13),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: cyanColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    )),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: cyanColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    )),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: cyanColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    )),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class CustomTextFormFieldPassword extends StatefulWidget {
  final String titleOfFormField;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CustomTextFormFieldPassword(
      {super.key,
      required this.titleOfFormField,
      this.validator,
      this.onSaved,
      this.keyboardType,
      this.controller});

  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  bool iconEye = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator ??
                  (value) {
                    if (value!.isEmpty) {
                      return "  please fill out the field!";
                    }
                    return null;
                  },
              onSaved: widget.onSaved,
              keyboardType: TextInputType.emailAddress,
              obscureText: iconEye,
              style: mediumBlueColor,
              cursorColor: blackColor,
              cursorOpacityAnimates: true,
              decoration: InputDecoration(
                // prefixIcon: const Icon(
                //   Icons.key_outlined,
                //   color: blueColor,
                // ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      iconEye = !iconEye;
                    });
                  },
                  icon: iconEye
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          //size: 30,
                          color: blueColor,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          //size: 30,
                          color: blueColor,
                        ),
                ),
                labelText: " ${widget.titleOfFormField}...",
                labelStyle: mediumBlueColor,
                contentPadding: const EdgeInsets.all(13),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: cyanColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    )),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: cyanColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    )),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: cyanColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    )),
              ),
            ),
          ),
        ),
        // const SizedBox(
        //   height: 5,
        // ),
      ],
    );
  }
}
