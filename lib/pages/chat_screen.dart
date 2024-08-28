import 'package:flutter/material.dart';
import 'package:whatsappclone/customCard/custom_card.dart';
import 'package:whatsappclone/model/chat_model.dart';

import '../Screens/select_contact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.chatmodel});
final List <ChatModel>chatmodel ;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

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
      body
      
  : 
      
       ListView.builder(
        itemCount: widget.chatmodel.length,
        itemBuilder: (context, index) => CustomCard(chatModel: widget.chatmodel[index]),
      ),
    );
  }
}
