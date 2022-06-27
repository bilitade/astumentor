import 'user.dart';

class Group {
  int? id;
  String? name;
  
  
  Group({
    this.id,
   
    this.name,
  });
// map json to post model
  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
        id: json['id'],
        name: json['name'],
        );
  }
}
