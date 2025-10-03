// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/user_model.dart';

class ThreadModel {
  static const tableName = "threads";

  String? id;
  String? lastMessage;
  DateTime? lastMessageTime;
  List<String>? participantsList;
  String? senderId;
  UserModel? userDetails;
  int? unseenMessageCount;
  UserModel? userModel;

  ThreadModel({
    this.id,
    this.lastMessage,
    this.lastMessageTime,
    this.participantsList,
    this.senderId,
    this.userDetails,
    this.unseenMessageCount,
    this.userModel,
  });

  factory ThreadModel.fromMap(Map<String, dynamic> map) {
    return ThreadModel(
      id: map["id"] ?? "",
      lastMessage: map["lastMessage"] ?? "",
      lastMessageTime:
          map["lastMessageTime"] != null
              ? (map["lastMessageTime"] as Timestamp).toDate()
              : null,
      participantsList:
          map["participantsList"] != null
              ? List<String>.from(map["participantsList"])
              : [],
      senderId: map["senderId"] ?? "",
      unseenMessageCount: map["unseenMessageCount"] ?? 0,
      userModel:
          map["userModel"] != null ? UserModel.fromMap(map["userModel"]) : null,
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
      "userModel": userModel?.toMap(),
    };
  }

  ThreadModel copyWith({
    String? id,
    String? lastMessage,
    DateTime? lastMessageTime,
    List<String>? participantsList,
    String? senderId,
    int? unseenMessageCount,
    UserModel? userModel,
  }) {
    return ThreadModel(
      id: id ?? this.id,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      participantsList: participantsList ?? this.participantsList,
      senderId: senderId ?? this.senderId,
      unseenMessageCount: unseenMessageCount ?? this.unseenMessageCount,
      userModel: userModel ?? this.userModel,
    );
  }
}
