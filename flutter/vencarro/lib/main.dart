import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import "package:splashscreen/splashscreen.dart";
import 'package:vencarro/resumo.dart';

import 'listaVeiculos.dart';

var camera;

Future<void> main() async{
  runApp(const Splash());
  WidgetsFlutterBinding.ensureInitialized();
  final cameras=await availableCameras();
  camera=cameras.first;
  print(cameras.length);
  //criar controlador e captura de imagem
}

class Splash extends StatelessWidget{
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:SplashScreen(
        seconds: 10,
        title: const Text("Venda de Carros",style:TextStyle(fontSize:30.0)),
        backgroundColor: Colors.grey,
        image: Image.network('https://cdn.pixabay.com/photo/2012/04/12/19/39/volga-30332_1280.png'),
        navigateAfterSeconds: ListaVeiculos(),
        photoSize:100.0,
      ),
    );
  }
}
