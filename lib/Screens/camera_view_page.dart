import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewPage extends StatelessWidget {
  const CameraViewPage(
      {super.key, required this.path, required this.onImageSend});
  final String path;
  final Function onImageSend;
  static final TextEditingController _controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.crop_rotate,
              size: 27,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.emoji_emotions_rounded,
              size: 27,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.title,
              size: 27,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 27,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                    color: Colors.black38,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 8,
                    ),
                    child: TextFormField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                      maxLines: 6,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: "Add a Caption.....",
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            size: 27,
                            color: Colors.white,
                          ),
                        ),
                        suffixIcon: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.tealAccent[700],
                          child: IconButton(
                            icon: const Icon(Icons.done,
                                color: Colors.white, size: 27),
                            onPressed: () {
                              onImageSend(path ,_controller.text.trim());
                            },
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
