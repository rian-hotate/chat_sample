import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:sample_flutter/model/chatDataModel.dart';

class ChatBloc {
  final _notesReference = FirebaseDatabase.instance.reference();

  final StreamController<ChatDataModel> _sendStream = StreamController<ChatDataModel>();
  final StreamController<ChatDataModel> sendResultStream = StreamController<ChatDataModel>();

  ChatBloc(String userName) {
    _notesReference.onChildAdded.listen((Event event) {
      if (userName != event.snapshot.value["userName"])
      sendResultStream.sink.add(chatDataModelFromSnapShot(event.snapshot));
    });
  }

  send(ChatDataModel data) {
    _notesReference.push().set(data.toJson()).then((_) {
      sendResultStream.sink.add(data);
    });
  }

  dispose() {
    _sendStream.close();
    sendResultStream.close();
  }
}