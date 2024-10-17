import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';

class ReplyFieldCard extends StatelessWidget {
  const ReplyFieldCard({
    super.key,
    required this.path,
    required this.message,
    required this.time,
  });

  final String path;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.8,
        height: MediaQuery.of(context).size.height / 2.3,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Card(
          margin: const EdgeInsets.all(3),
          shape: RoundedRectangleBorder(
        //    borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
             //     borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                          "http://192.168.1.4:5000/uploads/$path", // Ensure the path is correct
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                            child: Text('Network image not available'),
                          ),
                        ),
                ),
              ),
              message.isNotEmpty ?
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          message,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          time,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
             
               : Container(),
              
                
            ],
          ),
        ),
      ),
    );
  }
}
