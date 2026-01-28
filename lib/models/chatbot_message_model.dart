// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBotMessageModel {
  static const String tableName = 'AiChat';

  String? id; // 🔹 Document ID
  String? message;
  bool? isSender;
  DateTime? timestamp;

  ChatBotMessageModel({this.id, this.message, this.isSender, this.timestamp});

  /// 🔹 Use this when you already have the document ID
  factory ChatBotMessageModel.fromMap(Map<String, dynamic> map, {String? id}) {
    return ChatBotMessageModel(
      id: id,
      message: map['message'] ?? '',
      isSender: map['isSender'] ?? false,
      timestamp:
          map['timestamp'] != null
              ? (map['timestamp'] as Timestamp).toDate()
              : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'isSender': isSender,
      'timestamp': timestamp != null ? Timestamp.fromDate(timestamp!) : null,
    };
  }

  ChatBotMessageModel copyWith({
    String? id,
    String? message,
    bool? isSender,
    DateTime? timestamp,
  }) {
    return ChatBotMessageModel(
      id: id ?? this.id,
      message: message ?? this.message,
      isSender: isSender ?? this.isSender,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
