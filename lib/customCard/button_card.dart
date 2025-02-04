import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, required this.icon, required this.name});
 final IconData icon ;
 final String name ;
  @override
  Widget build(BuildContext context) {
   return ListTile(
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: const Color(0xFF25D366),
        child: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}