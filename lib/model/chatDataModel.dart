import 'package:firebase_database/firebase_database.dart';

ChatDataModel chatDataModelFromSnapShot(DataSnapshot data) => ChatDataModel.fromSnapshot(data);

class ChatDataModel {
  String userName;
  DateTime date;
  String message;

  ChatDataModel({
    this.userName,
    this.date,
    this.message,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        "userName": userName,
        "dateTime": date.toLocal().toIso8601String(),
        "message": message,
      };

  factory ChatDataModel.fromSnapshot(DataSnapshot  snapshot) => ChatDataModel(
        userName: snapshot.value["userName"],
        date: snapshot.value["date"],
        message: snapshot.value["message"],
      );
}


