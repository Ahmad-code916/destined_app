// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  static const tableName = "dating_app_users";

  String? uid;
  String? name;
  String? email;
  String? lastName;
  DateTime? dateOfBirth;
  String? gender;
  List<String>? interestList;
  String? imageUrl;
  String? location;
  String? uploadedId;

  List<String>? likedBy;
  List<String>? myLikes;
  List<String>? myDislikes;
  List<String>? matches;

  bool? page1;
  bool? page2;
  bool? page3;
  bool? page4;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.interestList,
    this.imageUrl,
    this.location,
    this.uploadedId,
    this.likedBy,
    this.myLikes,
    this.myDislikes,
    this.matches,
    this.page1,
    this.page2,
    this.page3,
    this.page4,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map["uid"] ?? "",
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      lastName: map["lastName"] ?? "",
      dateOfBirth:
          map["dateOfBirth"] != null
              ? DateTime.tryParse(map["dateOfBirth"])
              : null,
      gender: map["gender"] ?? "",
      interestList:
          map["interestList"] != null
              ? List<String>.from(map["interestList"])
              : [],
      imageUrl: map["imageUrl"] ?? "",
      location: map["location"] ?? "",
      uploadedId: map["uploadedId"] ?? "",

      likedBy: map["likedBy"] != null ? List<String>.from(map["likedBy"]) : [],
      myLikes: map["myLikes"] != null ? List<String>.from(map["myLikes"]) : [],
      myDislikes:
          map["myDislikes"] != null ? List<String>.from(map["myDislikes"]) : [],
      matches: map["matches"] != null ? List<String>.from(map["matches"]) : [],

      page1: map["page1"] ?? false,
      page2: map["page2"] ?? false,
      page3: map["page3"] ?? false,
      page4: map["page4"] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "lastName": lastName,
      "dateOfBirth": dateOfBirth?.toIso8601String(),
      "gender": gender,
      "interestList": interestList,
      "imageUrl": imageUrl,
      "location": location,
      "uploadedId": uploadedId,

      "likedBy": likedBy,
      "myLikes": myLikes,
      "myDislikes": myDislikes,
      "matches": matches,

      "page1": page1,
      "page2": page2,
      "page3": page3,
      "page4": page4,
    };
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? lastName,
    DateTime? dateOfBirth,
    String? gender,
    List<String>? interestList,
    String? imageUrl,
    String? location,
    String? uploadedId,
    List<String>? likedBy,
    List<String>? myLikes,
    List<String>? myDislikes,
    List<String>? matches,
    bool? page1,
    bool? page2,
    bool? page3,
    bool? page4,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      interestList: interestList ?? this.interestList,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      uploadedId: uploadedId ?? this.uploadedId,

      likedBy: likedBy ?? this.likedBy,
      myLikes: myLikes ?? this.myLikes,
      myDislikes: myDislikes ?? this.myDislikes,
      matches: matches ?? this.matches,

      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
    );
  }
}
