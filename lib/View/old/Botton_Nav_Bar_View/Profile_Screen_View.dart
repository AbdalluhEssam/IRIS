import 'package:flutter/material.dart';

import '../../../Constants/Fonts.dart';
import '../../../Constants/Images.dart';
import '../../../Constants/Space.dart';
import '../../../ViewModel/Botton_Nav_Bar_ViewModel/Profile_Screen_ViewModel.dart';


class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({super.key});

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackGroundImage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EmptySpace(),
              Text(
                "Profile",
                style: bigstBlueColor,
              ),
              ProfileUser(
                nameUser: "kerolos  Maher",
                phoneUser: "01025477854",
              ),
              EmptySpace()
            ],
          ),
        ),
      ),
    );
  }
}
