import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsappclone/model/chat_model.dart';

class AvtarCard extends StatelessWidget {
  const AvtarCard({super.key, required this.chatModel});
 final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8 ,vertical: 2),
      child: Column(
      
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
        
       Stack(
            children: [
              CircleAvatar(
                radius: 25,
                child: SvgPicture.asset(
                  "assets/images/person.svg",
                  height: 30,
                  width: 30,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blueGrey,
              ),
            Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    )),
              ) ,
            ],
          ),
       SizedBox(height: 2,),
        Text(chatModel.name ??'' ,style: TextStyle(fontSize: 12),)],
      ),
    );
  }
}