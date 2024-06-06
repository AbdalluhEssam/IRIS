import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../likeapi.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  getData() async {
    var response = await crud.postData(
      AppLink.viewPermission,
      {},
    );
    return response.fold((l) => l, (r) => r);
  }

  postData(
    String username,
    String password,
    String email,
    String phone,
    String gender,
    String dateOfBirth,
    String bloodType,
    String talk,
    String listen,
    File image,
  ) async {
    var response = await crud.postRequestWithImage(
        AppLink.signUp,
        {
          "username": username,
          "password": password,
          "email": email,
          "phone": phone,
          "gender": gender,
          "date_of_birth": dateOfBirth,
          "blood_type": bloodType,
          "ability_to_talk": talk,
          "ability_to_listen": listen,
        },
        image,
        "file");
    return response;
  }
}
