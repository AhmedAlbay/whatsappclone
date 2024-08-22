import 'package:flutter/material.dart';
import 'package:whatsappclone/customCard/custom_card.dart';
import 'package:whatsappclone/model/chat_model.dart';

import '../Screens/select_contact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Hello",
      icon: "groups.svg",
      isGroup: true,
      currentMessage: "This is Group",
      time: "10:09",
      status: "done",
    ),
    ChatModel(
      name: "World",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "done",
    ),
    ChatModel(
      name: "Ahmed",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "3:09",
      status: "done",
    ),
    ChatModel(
      name: "Mohamed",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "done",
    ),
    ChatModel(
      name: "Ahmed",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "done",
    ),
    ChatModel(
      name: "Albay",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "done",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SelectContact(),
              ));
        },
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}
