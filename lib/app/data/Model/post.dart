import 'user.dart';

class Post {
  int? id;
  String? body;
  String? image;
  int? likesCount;
  int? commentsCount;
  User? user;
  bool? selfLiked;
  String? created_at;

  Post({
    this.id,
    this.body,
    this.image,
    this.likesCount,
    this.commentsCount,
    this.user,
    this.selfLiked,
    this.created_at,
  });

// map json to post model

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        body: json['body'],
        image: json['image_url'],
        likesCount: json['likes_count'],
        commentsCount: json['comments_count'],
        created_at: json["human_readable_created_at"],
        selfLiked: json['likes'].length > 0,
        user: User(
            id: json['user']['id'],
            name: json['user']['name'],
            image: json['user']['profile_image_url']));
  }
}
