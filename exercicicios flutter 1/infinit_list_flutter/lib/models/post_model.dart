class PostModel {
  late int id;
  late int userId;
  late String title;
  late String body;

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }
}
