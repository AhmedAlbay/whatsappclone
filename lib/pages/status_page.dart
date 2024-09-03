import 'package:flutter/material.dart';
import 'package:whatsappclone/customCard/statusPage/other_status.dart';
import 'package:whatsappclone/customCard/statusPage/own_status.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blueGrey[100],
            onPressed: () {},
            child: Icon(
              Icons.edit,
              size: 28,
              color: Colors.blueGrey[900],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            onPressed: () {},
            child: const Icon(
              Icons.camera_alt,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            OwnStatus(),
            Label(title: "Recen Update",),
            OtherStatus(
              imagename: "assets/images/grandfather.png",
              name: "carlo ancelotti",
              subtitle: "this is status",
              isSeen: false ,
              statusNum: 1,
            ),
              OtherStatus(
              imagename: "assets/images/uncle.png",
              name: "mohamed magdy afsha",
              subtitle: "this is status",
               isSeen: false ,
              statusNum: 20,
            ),
              OtherStatus(
              imagename:  "assets/images/akram.png",
              name: "Akram Tawfik",
              subtitle: "this is status",
               isSeen: false ,
              statusNum: 7,
            ),
            Label(title: "Viewed Update"),
               OtherStatus(
              imagename: "assets/images/uncle.png",
              name: "mohamed magdy afsha",
              subtitle: "this is status",
               isSeen: true ,
              statusNum: 1,
            ),
              OtherStatus(
              imagename: "assets/images/grandfather.png",
              name: "carlo ancelotti",
              subtitle: "this is status",
                isSeen: true ,
              statusNum: 4,
            ),
              OtherStatus(
              imagename: "assets/images/akram.png",
              name: "Akram Tawfik",
              subtitle: "this is status",
                isSeen: true ,
              statusNum: 11,
            ),
          ],
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({
    super.key, required this.title,
  });
 final String title ;
  @override
  Widget build(BuildContext context) {
   
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13 ,vertical: 7),
        child: Text(title ,style: const TextStyle(fontSize: 13 ,fontWeight: FontWeight.bold,),)),
    );
  }
}
