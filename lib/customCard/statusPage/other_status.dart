import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus({super.key, required this.imagename, required this.name, required this.subtitle});
 final String imagename ;
  final String name ; final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(
              imagename,
            ),
          ),
         
        title: Text(
        name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    subtitle:Text(
        subtitle,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
         
        ),
      ), 
    );

  }
}