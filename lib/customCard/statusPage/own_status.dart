

import 'package:flutter/material.dart';

class OwnStatus extends StatelessWidget {
  const OwnStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.grey,
            backgroundImage:  AssetImage(
              "assets/images/grandfather.png",
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.greenAccent[700],
              child: const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      title: const Text(
        "New Status",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text(
        "Tap to Add Update Status",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
 
