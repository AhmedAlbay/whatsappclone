import 'package:flutter/material.dart';
import 'package:whatsappclone/Screens/camera_screen.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  CameraScreen(
      onImageSend: (){},
    );
  }
}