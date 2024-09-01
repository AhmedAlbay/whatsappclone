import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsappclone/Screens/individual_page.dart';
import 'package:whatsappclone/model/chat_model.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.chatModel, required this.sourceChat});
  final ChatModel chatModel;
    final ChatModel sourceChat ;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualPage(
          
              sourchat: widget.sourceChat, chatModel:  widget.chatModel,),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                widget.chatModel.isGroup == true
                    ? "assets/images/groups.svg"
                    : "assets/images/person.svg",
                height: 37,
                width: 37,
                color: Colors.white,
              ),
            ),
            trailing: Text(widget.chatModel.time ?? ''), // Handle nullable time
            title: Text(
              widget.chatModel.name ?? 'No Name', // Handle nullable name
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(width: 3),
                Text(
                  widget.chatModel.currentMessage ?? 'No Message', // Handle nullable message
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
