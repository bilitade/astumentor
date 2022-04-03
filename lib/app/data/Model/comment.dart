import 'user.dart';

class Comment {
  int? id;
  String? comment;
  User? user;
  String? created_at;

  Comment({this.id, this.comment, this.user, this.created_at});

  // map json to comment model
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        id: json['id'],
        comment: json['comment'],
        created_at: json['human_readable_created_at'],
        user: User(
            id: json['user']['id'],
            name: json['user']['name'],
            image: json['user']['profile_image_url']));
  }
}
