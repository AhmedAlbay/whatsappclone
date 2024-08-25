import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsappclone/model/chat_model.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key, required this.contact});
  final ChatModel? contact;
  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                "assets/images/person.svg",
                height: 37,
                width: 37,
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ),
         widget.contact!.isSelected?   Positioned(
              right: 5,
              bottom: 4,
              child: CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.teal,
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  )),
            ) : Container(),
          ],
        ),
      ),
      title: Text(
        widget.contact!.name ?? '',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        widget.contact?.status ??'',
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
