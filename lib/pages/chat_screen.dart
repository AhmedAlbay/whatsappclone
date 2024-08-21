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
      "Hello",
      "groups.svg",
      true,
      "This is Group",
      "10:09", "done",
    ),
    ChatModel(
      "World",
      "person.svg",
      false,
      "This is person",
      "9:09", "done",
    ),
    ChatModel(
      "Ahmed",
      "person.svg",
      false,
      "This is person",
      "3:09", "done",
    ),
    ChatModel(
      "Mohamed",
      "person.svg",
      false,
      "This is person",
      "9:09",
      "done",
    ),
    ChatModel(
      "Ahmed",
      "person.svg",
      false,
      "This is person",
      "9:09", "done",
    ),
    ChatModel(
      "Albay",
      "person.svg",
      false,
      "This is person",
      "9:09", "done",
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
                builder: (context) => const SelectContact()
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
