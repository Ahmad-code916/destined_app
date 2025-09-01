import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  static const tableName = 'messages';
  String? id;
  String? message;
  DateTime? timestamp;
  String? senderId;
  String? receiverId;
  String? messageType;
  bool? isSeen;

  ChatModel({
    this.id,
    this.message,
    this.timestamp,
    this.senderId,
    this.receiverId,
    this.messageType,
    this.isSeen,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'],
      message: map['message'],
      timestamp:
          map['timestamp'] != null
              ? (map['timestamp'] as Timestamp).toDate()
              : null,
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      messageType: map['messageType'] ?? 'text',
      isSeen: map['isSeen'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'timestamp': timestamp != null ? Timestamp.fromDate(timestamp!) : null,
      'senderId': senderId,
      'receiverId': receiverId,
      'messageType': messageType,
      'isSeen': isSeen,
    };
  }
}
