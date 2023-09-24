import 'package:chat/base.dart';
import 'package:chat/dataBaseUtils/database_utils.dart';
import 'package:chat/models/message.dart';
import 'package:chat/screens/chat/chat_navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/my_user.dart';
import '../../models/room.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator> {
  late Room room;
  late MyUser myUser;

  void sendMessage(String content) {
    Message message = Message(
        content: content,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        roomId: room.id,
        senderId: myUser.id,
        senderName: myUser.userName);
    DataBaseUtils.addMessageToFireStore(message).then((value) {
      navigator!.uploadMessageToFireStore();
    });
  }

  Stream<QuerySnapshot<Message>> getMessages() {
    return DataBaseUtils.readMessagesFromFireStore(room.id);
  }

}