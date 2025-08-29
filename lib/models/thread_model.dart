import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/user_model.dart';

class ThreadModel {
  static const tableName = "threads";

  String? id;
  String? lastMessage;
  DateTime? lastMessageTime;
  List<String>? participantsList;
  String? senderId;
  int? unseenMessageCount;
  UserModel? userModel;
  // bool isDeleted = false;

  ThreadModel({
    this.id,
    this.lastMessage,
    this.lastMessageTime,
    this.participantsList,
    this.senderId,
    this.unseenMessageCount,
    this.userModel,
    // required this.isDeleted,
  });

  factory ThreadModel.fromMap(Map<String, dynamic> map) {
    return ThreadModel(
      id: map["id"] ?? "",
      lastMessage: map["lastMessage"],
      lastMessageTime:
          map["lastMessageTime"] != null
              ? (map["lastMessageTime"] as Timestamp).toDate()
              : null,
      participantsList:
          map["participantsList"] == null
              ? null
              : List<String>.from(map["participantsList"] as List),
      senderId: map["senderId"],
      unseenMessageCount:
          map["unseenMessageCount"] == null
              ? null
              : map["unseenMessageCount"] as int,
      // isDeleted: map["isDeleted"] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "lastMessage": lastMessage,
      "lastMessageTime":
          lastMessageTime != null ? Timestamp.fromDate(lastMessageTime!) : null,
      "participantsList": participantsList,
      "senderId": senderId,
      "unseenMessageCount": unseenMessageCount,
      // "isDeleted": isDeleted,
    };
  }
}
