import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class BlogData {
  Crud crud;

  BlogData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.blog, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(address, text, publisher, File myFile) async {
    var response = await crud.postRequestWithFiles(
        AppLink.addBlog,
        {
          "address": address,
          "text": text,
          "publisher": publisher,
        },
        myFile,
        "file");
    return response;
  }

  delete(id) async {
    var response = await crud.postData(AppLink.delete, {
      "blog_id": id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
