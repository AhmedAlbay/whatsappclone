import 'package:flutter/material.dart';
import 'package:whatsappclone/customCard/button_card.dart';
import 'package:whatsappclone/customCard/contact_card.dart';

import '../model/chat_model.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> chatModel = [
    ChatModel(
      "Hello",
      "groups.svg",
      true,
      "This is Group",
      "10:09",
      "WordPress Developer",
    ),
    ChatModel(
      "World",
      "person.svg",
      false,
      "This is person",
      "9:09",
      "Freelancer",
    ),
    ChatModel(
      "Ahmed",
      "person.svg",
      false,
      "This is person",
      "3:09",
      "UI / UX",
    ),
    ChatModel(
      "Mohamed",
      "person.svg",
      false,
      "This is person",
      "9:09",
      "BackEnd Developer",
    ),
    ChatModel(
      "Ahmed",
      "person.svg",
      false,
      "This is person",
      "9:09",
      "Frontend Developer",
    ),
    ChatModel(
      "Albay",
      "person.svg",
      false,
      "This is person",
      "9:09",
      "Flutter Developer",
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
            )
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
            return ButtonCard(icon: Icons.groups, name: "New Group");
          } else if (index == 1) {
            return ButtonCard(icon: Icons.person, name: "New Person");
          } else {
            // Adjusted index to correctly reference chatModel items
            return ContactCard(contact: chatModel[index - 2]);
          }
        },
      ),
    );
  }
}
