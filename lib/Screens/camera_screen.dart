// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/Screens/video_view_page.dart';
import 'camera_view_page.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key ,required this.onImageSend} );
final Function onImageSend ;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool isRecording = false;
  CameraController? _cameraController;
  Future<void>? cameraValue;
  bool isFlash = false;
    bool iscameraFront = true; 
    double transForm =pi;
  @override
  void initState() {
    super.initState();
    initializeCamera();
  } 

  void initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CameraPreview(_cameraController!));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFlash = !isFlash;
                          });
                          isFlash
                              ? _cameraController!.setFlashMode(FlashMode.torch)
                              : _cameraController!.setFlashMode(FlashMode.off);
                        },
                        icon:  Icon(
                          isFlash ? Icons.flashlight_on : Icons.flash_off,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          await _cameraController!.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          final XFile videoPath =
                              await _cameraController!.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) =>
                                  VideoViewPage(path: videoPath.path),
                            ),
                          );
                        },
                        onTap: () {
                          if (!isRecording) {
                            takePhoto(context);
                          }
                        },
                        child: isRecording
                            ? const Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 70,
                              )
                            : const Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            iscameraFront=!iscameraFront;
                            transForm=transForm+pi;
                          });
                          int camera =iscameraFront ?0 :1 ;
                           _cameraController = CameraController(cameras![camera], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
                        },
                        icon: Transform.rotate(
                          angle: transForm,
                         
                          child: const Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Hold for a video, tap for Photo",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    try {
      final XFile picture = await _cameraController!.takePicture();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => CameraViewPage(path: picture.path ,
          onImageSend: widget.onImageSend,),
        ),

      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
