

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vencarro/veiculo.dart';

class Resumo extends StatefulWidget {
  const Resumo({Key? key}) : super(key: key);

  @override
  State<Resumo> createState() => _ResumoState();
}

class _ResumoState extends State<Resumo> {
  var caminho_image="";
  @override
  Widget build(BuildContext context) {
     Veiculo param = ModalRoute.of(context)?.settings.arguments as Veiculo;
    print(param);
    return MaterialApp(
      title: "Resumo",
      home: Scaffold(
        appBar: AppBar(title: const Text("Resumo")),
        body: Column(children: [
          Row(children: [
            Container(
                padding: EdgeInsets.all(10),
                width: 100,
                child: const Text("Marca:")),
            Text(param.marca)],),
            Row(children: [
            Container(
                padding: EdgeInsets.all(10),
                width: 100,
                child: const Text("Modelo:")),
            Text(param.modelo),],),
            
            Row(children: [
            Container(
                padding: EdgeInsets.all(10),
                width: 100,
                child: const Text("Ano:")),
            Text(param.ano),],),
            Row(children: [
            Container(
                padding: EdgeInsets.all(10),
                width: 100,
                child: const Text("Preco:")),
            Text(param.preco),],),

             Flexible(child:caminho_image==''?
             Image.network('https://cdn.pixabay.com/photo/2012/04/12/19/39/volga-30332_1280.png'):
             Image.file(File(caminho_image))),

    ],),
   
    floatingActionButton: FloatingActionButton(
    onPressed: () async{  
      var imgCaminho= await Navigator.of(context).pushNamed("/camera");
      setState((){
        caminho_image=caminho_image.toString();
      });
    },
    child: const Icon(Icons.camera_alt)),
    ),
    
    );
  }
}