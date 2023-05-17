import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:vencarro/resumo.dart';
import 'package:vencarro/util.dart';
import 'package:vencarro/veiculo.dart';

import 'camera.dart';

class ListaVeiculos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lista = [];

    return MaterialApp(
    routes:{'/resumo':(context)=>Resumo(),'/camera':(context)=>Camera(),},
      home: Scaffold(
          appBar: AppBar(title: const Text("Venda de Carros")),
          body: _ListaVeiculo()),
    );
  }
}

class _ListaVeiculo extends StatefulWidget {
  const _ListaVeiculo({Key? key}) : super(key: key);

  @override
  State<_ListaVeiculo> createState() => _ListaVeiculoState();
}

class _ListaVeiculoState extends State<_ListaVeiculo> {
  final List<Veiculo> _listaV = List<Veiculo>.empty(growable: true);

  var _veiculoSelecionado;

  @override
  void initState() {
    Util.obterMarcas().then(
      (marcas) {
        setState(
          () {
            //indica que a interface faça atualização
            _listaV.addAll(marcas);
          },
        );
      },
    );
    //then com função de parametro e injeta na variavel e a sua função, sendo conteudo do Future da classe

    // codigo de inicialização
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (item, index) {
        return ListTile(
          title: Column(children: [
            Text(_listaV.elementAt(index).marca),
            Text(_listaV.elementAt(index).modelo),
            Text(_listaV.elementAt(index).ano),
          ]),
          leading: const Icon(Icons.car_rental),
          trailing: const Icon(Icons.arrow_right_outlined),
          tileColor: index % 2 == 0 ? Colors.grey : Colors.white,
          onTap: () {
            //atualizar veiculo
            _veiculoSelecionado = _listaV.elementAt(index);
            if (_veiculoSelecionado.idModelo == "") {
              Util.obterModelos(_listaV.elementAt(index).idMarca,
                      _listaV.elementAt(index).marca)
                  .then((marcas) {
                setState(() {
                  _listaV.clear();
                  _listaV.addAll(marcas);
                });
              });
            } else if (_veiculoSelecionado.idModelo != '' && _veiculoSelecionado.idAno == '') {
              Util.obterAnos(
                      _listaV.elementAt(index).idMarca,
                      _listaV.elementAt(index).marca,
                      _listaV.elementAt(index).idModelo,
                      _listaV.elementAt(index).modelo)
                  .then((modelos) {
                setState(() {
                  _listaV.clear();
                  _listaV.addAll(modelos);
                });
              });
            }else if(_veiculoSelecionado.idModelo !=''&&_veiculoSelecionado.idAno !=''){
              Util.obterPreco(_listaV.elementAt(index).idMarca, _listaV.elementAt(index).marca, _listaV.elementAt(index).idModelo, _listaV.elementAt(index).modelo, _listaV.elementAt(index).idAno, _listaV.elementAt(index).ano).then((ano){
                _veiculoSelecionado.preco=ano.preco;
                //navegar para a tela de resumo
                Navigator.of(context).pushNamed('/resumo', arguments:_veiculoSelecionado);
              });
            }
          },
        );
      },
      itemCount: _listaV.length,
    );
  }
}
