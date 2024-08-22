import 'package:flutter/material.dart';
import 'package:whatsappclone/Screens/create_groups.dart';
import 'package:whatsappclone/customCard/button_card.dart';
import 'package:whatsappclone/customCard/contact_card.dart';

import '../model/chat_model.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "257 contacts",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: "View Contact",
                  child: Text("View Contact"),
                ),
                PopupMenuItem(
                  value: "Media, Links, and Docs",
                  child: Text("Media, Links, and Docs"),
                ),
                PopupMenuItem(
                  value: "WhatsApp Web",
                  child: Text("WhatsApp Web"),
                ),
                PopupMenuItem(
                  value: "Search",
                  child: Text("Search"),
                ),
                PopupMenuItem(
                  value: "Mute Notifications",
                  child: Text("Mute Notifications"),
                ),
                PopupMenuItem(
                  value: "Wallpaper",
                  child: Text("Wallpaper"),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chatModel.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const CreateGroup(),
                  ),
                );
              },
              child: const ButtonCard(icon: Icons.groups, name: "New Group"),
            );
          } else if (index == 1) {
            return const ButtonCard(icon: Icons.person, name: "New Person");
          } else {
            // Adjusted index to correctly reference chatModel items
            return ContactCard(contact: chatModel[index - 2]);
          }
        },
      ),
    );
  }
}
