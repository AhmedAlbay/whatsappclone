
import 'package:flutter/material.dart';
import 'package:whatsappclone/pages/status_page.dart';

import '../model/chat_model.dart';
import '../pages/camera_page.dart';
import '../pages/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.chatmodel, required this.sourceChat});
final List <ChatModel>chatmodel ;
final ChatModel sourceChat ;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (value){
          
            },
            itemBuilder: (BuildContext context) {
              
              return [
                const PopupMenuItem(
                  value: "New Group",
                  child: Text("New Group"),
                ),
                const PopupMenuItem(
                  value: "New Breaktest",
                  child: Text("New Breaktest"),
                ),
                const PopupMenuItem(
                  value: "WhatsApp Web",
                  child: Text("WhatsApp Web"),
                ),
                const PopupMenuItem(
                  value: "Satred Message",
                  child: Text("Satred Message"),
                ),
                const PopupMenuItem(
                  value: "Settings",
                  child: Text("Settings"),
                ),
              ];
            },
          )
        ],
        title: const Text("WhatsAppClone"),
        bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            labelColor: Colors.black,
            controller: _controller,
            tabs: const [
              Tab(child: Icon(Icons.camera_alt)),
              Tab(child: Text("Chats")),
              Tab(child: Text("Status")),
              Tab(child: Text("Call")),
            ]),
      ),
      body: TabBarView(controller: _controller, children:  [
       const CameraPage(),
        ChatPage(
          sourceChat: widget.sourceChat,
          chatmodel: widget.chatmodel,),
  const   StatusPage(),
        const Text("Call"),
      ]),
    );
  }
}
