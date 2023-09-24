import 'package:chat/base.dart';
import 'package:chat/models/message.dart';
import 'package:chat/models/room.dart';
import 'package:chat/providers/my_provider.dart';
import 'package:chat/screens/chat/chat_navigator.dart';
import 'package:chat/screens/chat/chat_viewmodel.dart';
import 'package:chat/screens/chat/message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = 'chat-screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseView<ChatScreen, ChatViewModel>
    implements ChatNavigator {
  var messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var room = ModalRoute.of(context)!.settings.arguments as Room;
    var provider = Provider.of<MyProvider>(context);
    viewModel.myUser = provider.myUser!;
    viewModel.room = room;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Stack(children: [
          Image.asset(
            'assets/images/main_bg.png',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                room.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 30,
                  ),
                ),
              ],
            ),
            body: Form(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Column(
                  children: [
                    Expanded(
                        child: StreamBuilder<QuerySnapshot<Message>>(
                      stream: viewModel.getMessages(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Text("Something went wrong");
                        }
                        var messages =
                            snapshot.data?.docs.map((e) => e.data()).toList();
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return MessageWidget((messages![index]));
                          },
                          itemCount: messages?.length ?? 0,
                        );
                      },
                    )),
                    Container(
                      padding: EdgeInsets.only(bottom: 6,left: 4),
                      child: Row(
                        children: [
                          Expanded(                           
                            child: TextFormField(
                              controller: messageController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                  hintText: "Type a Message",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12)),
                                 borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2))),
                        ),
                      ),
                          InkWell(
                            onTap: () {
                              viewModel.sendMessage(messageController.text);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: const [
                                  Text(
                                    'Send',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.send,
                                    size: 15,
                                    
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
@override
  void clearMessage() {
    // TODO: implement clearMessage
    messageController.clear();
  }

  @override
  void uploadMessageToFireStore() {
    messageController.clear();
    setState(() {});
  }

  @override
  ChatViewModel initViewModel() {
    return ChatViewModel();
  }
}