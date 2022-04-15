List<UserModel> fromJsonToUser(var json) {  // conversion of json to list
  List jsonData = json;
  return jsonData.map((map) => UserModel.fromJson(map)).toList();
}

class UserModel {

  int? id;
  String? name;
  List<dynamic>? subjects;
  String? profileImage;
  List<dynamic>? qualification;

  UserModel(
      {this.id,
        this.name,
        this.subjects,
        this.profileImage,
        this.qualification});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(

        id: json['id'] ?? 0,
        name: json['name']?? '',
        subjects: json['subjects'],
        profileImage: json['profileImage'] ?? '',
      qualification:  json['qualification'],
    );
  }
}



