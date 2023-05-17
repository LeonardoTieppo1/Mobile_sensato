import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hello_world/menu_item.dart';

class Aleatorio extends StatelessWidget {
  const Aleatorio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Randomizer(),
    );
  }
}

class Randomizer extends StatefulWidget {
  const Randomizer({Key? key}) : super(key: key);

  @override
  State<Randomizer> createState() => _RandomizerState();
}

class _RandomizerState extends State<Randomizer> {
  var rng = new Random();
  var rand = 0;
  final itensMenu=[ItemDoMenu('Sortear',Icon(Icons.refresh))];
  PopupMenuButton criarMenu(){
    return PopupMenuButton<ItemDoMenu>(itemBuilder:(BuildContext context){
      //função que vai iterar no menu itens um popUp no menu item
      List<PopupMenuItem<ItemDoMenu>> ret=[
        PopupMenuItem(child:Row (children:[Icon(Icons.refresh),Text("Item 1")])),
        PopupMenuItem(child:const Text("Item 2")),
      ];
      return ret;
      /*
      return itensMenu.map((MenuItem menuItem) => {
        return PopupMenuItem<MenuItem>(
          value: menuItem,
          child:Row 
        );
      }).toList();
    */},icon: const Icon(Icons.menu),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:"Aleatorio",),
        body: Center(
          child: Text(
            '$rand',
            style: const TextStyle(color: Colors.amber, fontSize: 38),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                rand = rng.nextInt(5) + 1;
              });
            },
            child: const Icon(Icons.refresh)));
  }
}

AppBar build