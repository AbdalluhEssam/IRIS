import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iris_wheel_assist/Constants/Buttons.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';
import 'package:iris_wheel_assist/Constants/Space.dart';

import '../../../Constants/Fonts.dart';
import '../../../Constants/Images.dart';
import 'Congratulations_on_your_new_account_View.dart';


class CompleteUserDataView extends StatefulWidget {
  const CompleteUserDataView({super.key});

  @override
  State<CompleteUserDataView> createState() => _CompleteUserDataViewState();
}

class _CompleteUserDataViewState extends State<CompleteUserDataView> {
  String selectedGender = '';
  String selectedOption1 = '';
  String selectedOption2 = '';

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void selectOption1(String option) {
    setState(() {
      selectedOption1 = option;
    });
  }

  void selectOption2(String option) {
    setState(() {
      selectedOption2 = option;
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
            const Text(
              "Complete user data",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: Get.width * 0.38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: cyanColor, width: 3)),
                  child: ChoiceChip(
                    selectedColor: blueColor,
                    side: BorderSide(
                        color:
                            selectedGender == "Male" ? whiteColor : whiteColor,
                        width: 1.5),
                    elevation: 0.0,
                    showCheckmark: false,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male_outlined,
                          color:
                              selectedGender == 'Male' ? whiteColor : blueColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: selectedGender == 'Male'
                                ? whiteColor
                                : blueColor,
                          ),
                        ),
                      ],
                    ),
                    selected: selectedGender == 'Male',
                    //selectedColor: Colors.blue, // Change the color when selected
                    onSelected: (selected) {
                      selectGender(selected ? 'Male' : '');
                    },
                  ),
                ),
                const SizedBox(width: 25),
                Container(
                  width: Get.width * 0.38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: cyanColor, width: 3)),
                  child: ChoiceChip(
                    selectedColor: blueColor,
                    side: BorderSide(
                        color: selectedGender == "Female"
                            ? whiteColor
                            : whiteColor,
                        width: 1.5),
                    elevation: 0.0,
                    showCheckmark: false,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female_outlined,
                          color: selectedGender == 'Female'
                              ? whiteColor
                              : blueColor,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: selectedGender == 'Female'
                                ? whiteColor
                                : blueColor,
                          ),
                        ),
                      ],
                    ),
                    selected: selectedGender == 'Female',
                    //selectedColor: Colors.pink, // Change the color when selected
                    onSelected: (selected) {
                      selectGender(selected ? 'Female' : '');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Is the case being heard ?",
                  style: TextStyle(
                      fontSize: 13,
                      color: blueColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: Get.width * 0.21,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: selectedOption1 == 'Yes' ? blueColor : whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: cyanColor, width: 3)),
                  child: ChoiceChip(
                    selectedColor: blueColor,
                    side: BorderSide(
                        color:
                            selectedOption1 == 'Yes' ? whiteColor : whiteColor,
                        width: 1.5),
                    elevation: 0.0,
                    showCheckmark: false,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Yes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: selectedOption1 == 'Yes'
                                ? whiteColor
                                : blueColor,
                          ),
                        ),
                      ],
                    ),
                    selected: selectedOption1 == 'Yes',
                    //selectedColor: Colors.green, // Change the color when selected
                    onSelected: (selected) {
                      selectOption1(selected ? 'Yes' : '');
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  width: Get.width * 0.21,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: selectedOption1 == 'No' ? blueColor : whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: cyanColor, width: 3)),
                  child: ChoiceChip(
                    selectedColor: blueColor,
                    side: BorderSide(
                        color:
                            selectedOption1 == 'No' ? whiteColor : whiteColor,
                        width: 1.5),
                    elevation: 0.0,
                    showCheckmark: false,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' No ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: selectedOption1 == 'No'
                                ? whiteColor
                                : blueColor,
                          ),
                        ),
                      ],
                    ),
                    selected: selectedOption1 == 'No',
                    //selectedColor: Colors.red, // Change the color when selected
                    onSelected: (selected) {
                      selectOption1(selected ? 'No' : '');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Is the case being speak ?",
                  style: TextStyle(
                      fontSize: 13,
                      color: blueColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: Get.width * 0.21,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: selectedOption2 == 'Yes' ? blueColor : whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: cyanColor, width: 3)),
                  child: ChoiceChip(
                    selectedColor: blueColor,
                    side: BorderSide(
                        color:
                            selectedOption2 == 'Yes' ? whiteColor : whiteColor,
                        width: 1.5),
                    elevation: 0.0,
                    showCheckmark: false,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Yes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: selectedOption2 == 'Yes'
                                ? whiteColor
                                : blueColor,
                          ),
                        ),
                      ],
                    ),
                    selected: selectedOption2 == 'Yes',
                    //selectedColor: Colors.green, // Change the color when selected
                    onSelected: (selected) {
                      selectOption2(selected ? 'Yes' : '');
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  width: Get.width * 0.21,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: selectedOption2 == 'No' ? blueColor : whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: cyanColor, width: 3)),
                  child: ChoiceChip(
                    selectedColor: blueColor,
                    side: BorderSide(
                        color:
                            selectedOption2 == 'No' ? whiteColor : whiteColor,
                        width: 1.5),
                    elevation: 0.0,
                    showCheckmark: false,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' No ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: selectedOption2 == 'No'
                                ? whiteColor
                                : blueColor,
                          ),
                        ),
                      ],
                    ),
                    selected: selectedOption2 == 'No',
                    //selectedColor: Colors.red, // Change the color when selected
                    onSelected: (selected) {
                      selectOption2(selected ? 'No' : '');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            MainButton(
                nameButton: "Confirmation",
                onClickButton: () {
                  setState(() {
                    if ((selectedGender == "Male" ||
                            selectedGender == "Female") &&
                        (selectedOption1 == "Yes" || selectedOption1 == "No") &&
                        (selectedOption2 == "Yes" || selectedOption2 == "No")) {
                      Get.to(const CongratulationsOnYourNewAccountView());
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: whiteColor,
                              elevation: 0.0,
                              title: const Text(
                                textAlign: TextAlign.center,
                                "Alert !",
                                style: bigstBlueColor,
                              ),
                              content: const Text(
                                textAlign: TextAlign.center,
                                "You must answer all questions to complete the login process",
                                style: mediumBlackColor,
                              ),
                              shape: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(width: 3.5, color: cyanColor)),
                              titlePadding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 20,
                              ),
                              actions: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: MaterialButton(
                                      padding: const EdgeInsets.all(10),
                                      color: blueColor,
                                      shape: Border.all(
                                          width: 4, color: blueColor),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the AlertDialog
                                      },
                                      child: const Text(
                                        'Close',
                                        textAlign: TextAlign.center,
                                        style: mediumWhiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    }
                  });
                }),
          ],
        ),
      )),
    );
  }
}
