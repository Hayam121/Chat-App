import 'package:chat/screens/chat/chat_view.dart';
import 'package:flutter/material.dart';

import '../../models/room.dart';

class RoomWidget extends StatelessWidget {
  Room room;

  RoomWidget(this.room);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.routeName, arguments: room);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/${room.catId}.png",
                width: MediaQuery.of(context).size.width * .30,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(room.title),
          ],
        ),
      ),
    );
  }
}