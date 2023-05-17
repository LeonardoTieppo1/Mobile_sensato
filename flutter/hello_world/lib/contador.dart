import "package:flutter/material.dart";

class ContadorNum extends StatelessWidget {
  const ContadorNum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Contador")),
        body: const Center(child: (Contador())),
      ),
    );
  }
}



class Contador extends StatefulWidget {
  const Contador({Key? key}) : super(key: key);

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  var cont = 0;

  var txtV = TextEditingController();
  
  Widget contador(){
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      IconButton(
          onPressed: () {
            setState(() {
              cont++;
            });
          },
          icon: const Icon(Icons.plus_one)),
      Text('$cont', style: const TextStyle(color: Colors.red, fontSize: 30)),
      IconButton(
          onPressed: () {
            setState(() {
              cont--;
            });
          },
          icon: const Icon(Icons.exposure_minus_1)),      
    ]);
    /*Scaffold(
    body:Container()
  );*/
  }

  Widget novoValorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextField(
          controller: txtV,
          maxLength: 18,
          decoration: const InputDecoration(constraints: BoxConstraints(maxWidth: 200), border: OutlineInputBorder(),hintText:"Enter search term")),
      IconButton(
          onPressed: () {
            setState(() {
              cont = int.parse(txtV.text);
            });
          },
          icon: const Icon(Icons.check))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment:MainAxisAlignment.center,
    children:[contador(),novoValorWidget()]);
  }
}
