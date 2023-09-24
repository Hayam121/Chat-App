import 'package:chat/models/message.dart';
import 'package:chat/providers/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessageWidget extends StatelessWidget {
  Message message;

  MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return provider.myUser!.id == message.senderId
        ? SenderMessage(message)
        : RecievedMessage(message);
  }
}

class SenderMessage extends StatelessWidget {
  Message message;

  SenderMessage(this.message);

  @override
  Widget build(BuildContext context) {
    int ts = message.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);

    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(message.senderName),
        const SizedBox(
          height: 2,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.9),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.content,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                date.substring(
                  12,
                ),
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}

class RecievedMessage extends StatelessWidget {
  Message message;

  RecievedMessage(this.message);

  @override
  Widget build(BuildContext context) {
    int ts = message.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);
    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(message.senderName),
        const SizedBox(
          height: 2,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(248, 248, 248, 1.0),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.content,
                style:
                    const TextStyle(color: Color.fromRGBO(120, 121, 147, 1.0)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.end,
                date.substring(12),
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

//   FirebaseFirestore.instance.collection('Messages').doc(message.id).update({
//   message.id : FieldValue.delete(),
// });
}