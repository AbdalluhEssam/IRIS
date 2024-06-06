import '../../../../core/class/crud.dart';
import '../../../../likeapi.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postData(String password, String email) async {
    var response = await crud.postData(AppLink.login, {
      "password": password,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

  getUserData(String id) async {
    var response = await crud.postData(AppLink.usersView, {
      "id": id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
