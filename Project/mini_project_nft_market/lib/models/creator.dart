class Creator {
  final int? id;
  final String nickName;
  final String realName;
  final String about;
  final String imgProfile;

  Creator({
    this.id,
    required this.nickName,
    required this.realName,
    required this.imgProfile,
    required this.about,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nickName": nickName,
      "realName": realName,
      "imgProfile": imgProfile,
      "about": about,
    };
  }

  factory Creator.fromMap(Map<String, dynamic> map) {
    return Creator(
      id: map['id']?.toInt() ?? 0,
      nickName: map['nickName'] ?? "",
      realName: map['realName'] ?? "",
      imgProfile: map['imgProfile'] ?? "",
      about: map['about'] ?? "",
    );
  }

  @override
  String toString() =>
      'Creator(id : ${id}, nick name : ${nickName}, real name : ${realName}, \nabout : ${about}, image profile : ${imgProfile})';
}
