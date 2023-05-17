import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
//nenhuma variavel de classe

  Widget criarBotao() {
    return FloatingActionButton(
      child: const Icon(Icons.confirmation_num),
      onPressed: () {
        const Text("OK");
      },
    );
  }

  Widget getTexto(String texto) {
    return Container(
        child: Text(texto, style: const TextStyle(color: Colors.cyanAccent,fontSize: 18)),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple),
        ),
        padding: const EdgeInsets.all(10));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My APP"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getTexto("BEM VINDO"),
              const Text("Olá"),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Text("Texto 1"),
                Text("Texto 2"),
              ]),
            ],
          ),
        ), //Column é horizontal
        backgroundColor: Colors.white,
        floatingActionButton: criarBotao(),
        bottomNavigationBar: const Text("Parabens vc apertou o botão"),
        persistentFooterButtons: [IconButton(onPressed: (){
          print(
            "Ajuda!",
          );
        },
         icon: const Icon(Icons.accessibility)),],
      ),
    );

    //throw UnimplementedError();
  }
}
