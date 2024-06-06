class BlogModel {
  int? blogId;
  String? address;
  String? text;
  String? date;
  int? publisher;
  String? image;

  BlogModel(
      {this.blogId,
        this.address,
        this.text,
        this.date,
        this.publisher,
        this.image});

  BlogModel.fromJson(Map<String, dynamic> json) {
    blogId = json['blog_id'];
    address = json['address'];
    text = json['text'];
    date = json['date'];
    publisher = json['publisher'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_id'] = this.blogId;
    data['address'] = this.address;
    data['text'] = this.text;
    data['date'] = this.date;
    data['publisher'] = this.publisher;
    data['image'] = this.image;
    return data;
  }
}
