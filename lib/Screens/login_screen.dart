import 'package:flutter/material.dart';
import 'package:whatsappclone/Screens/home_screen.dart';
import 'package:whatsappclone/customCard/button_card.dart';

import '../model/chat_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chats = [
    ChatModel(
      name: "Hello",
      icon: "groups.svg",
      isGroup: true,
      currentMessage: "This is Group",
      time: "10:09",
      status: "done",
      id: 1,
    ),
    ChatModel(
      name: "World",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "done",
      id: 2,
    ),
    ChatModel(
      name: "Ahmed",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "3:09",
      status: "done",
      id: 3,
    ),
    ChatModel(
      name: "Mohamed",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "done",
      id: 4,
    ),
    ChatModel(
      name: "Ahmed",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      id: 5,
      status: "done",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  sourceChat = chats.removeAt(index);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => HomeScreen(chatmodel: chats,),
                    ),
                  );
                },
                child: ButtonCard(
                    icon: Icons.person, name: chats[index].name.toString()));
          }),
    );
  }
}
