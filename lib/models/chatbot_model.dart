// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBotModel {
  static final String tableName = 'ChatWithAi';

  String? id;
  String? message;
  String? senderId;
  DateTime? timeStamp;

  ChatBotModel({this.id, this.message, this.senderId, this.timeStamp});

  factory ChatBotModel.fromMap(Map<String, dynamic> map) {
    return ChatBotModel(
      id: map['id'] ?? '',
      message: map['message'] ?? '',
      senderId: map['senderId'] ?? '',
      timeStamp:
          map['timeStamp'] != null
              ? (map['timeStamp'] as Timestamp).toDate()
              : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'senderId': senderId,
      'timeStamp': timeStamp != null ? Timestamp.fromDate(timeStamp!) : null,
    };
  }

  ChatBotModel copyWith({
    String? id,
    String? message,
    String? senderId,
    DateTime? timeStamp,
  }) {
    return ChatBotModel(
      id: id ?? this.id,
      message: message ?? this.message,
      senderId: senderId ?? this.senderId,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }
}
