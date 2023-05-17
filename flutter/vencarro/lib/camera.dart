import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vencarro/main.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  
  @override
  void initState(){
    super.initState();
    _controller=CameraController(camera,ResolutionPreset.ultraHigh,imageFormatGroup: Platform.isAndroid
        ? ImageFormatGroup.jpeg
        : ImageFormatGroup.yuv420);
     _initializeControllerFuture=_controller.initialize();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Camera"),
        ),
        body: FutureBuilder<void>(
          future:_initializeControllerFuture,
          builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.done) {
              return CameraPreview(_controller);
            }else{
              return Center(child:CircularProgressIndicator());
            }
          }, 
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() async{
            await _initializeControllerFuture;
            final image=await _controller.takePicture();
            Navigator.of(context).pop(image.path);
          },child:const Icon(Icons.camera),
        ),
      ),
    );
  }
}
