import 'package:flutter/material.dart';
import 'package:whatsappclone/customCard/contact_card.dart';
import '../model/chat_model.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel>  chatModel = [
    ChatModel(
      name: "Hello",
      icon: "groups.svg",
      isGroup: true,
      currentMessage: "This is Group",
      time: "10:09",
      status: "WordPress Developer",
    ),
    ChatModel(
      name: "World",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "Freelancer",
    ),
    ChatModel(
      name: "Ahmed",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "3:09",
      status: "UI / UX",
    ),
    ChatModel(
      name: "Mohamed",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "BackEnd Developer",
    ),
    ChatModel(
      name: "Ahmed",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "Frontend Developer",
    ),
    ChatModel(
      name: "Albay",
      icon: "person.svg",
      isGroup: false,
      currentMessage: "This is person",
      time: "9:09",
      status: "Flutter Developer",
    ),
  ];
List <ChatModel>groups =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Group",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Add To Group",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chatModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                if (chatModel[index].isSelected == false) {
                  chatModel[index].isSelected = true;
                  groups.add(chatModel[index]);
                } else {
                  chatModel[index].isSelected = false;
                  groups.remove(chatModel[index]);
                }
              });
            },
            child: ContactCard(contact: chatModel[index]),
          );
        },
      ),);
  }
}
