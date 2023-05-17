import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vencarro/veiculo.dart';

class Util{
  static Future<List<Veiculo>> obterMarcas() async {
    const URL='https://parallelum.com.br/fipe/api/v1/carros/marcas';
    var ret=List<Veiculo>.empty(growable: true);
    var res=await http.get(Uri.parse(URL));
       jsonDecode(res.body).forEach((item){
        ret.add(Veiculo(idMarca:item["codigo"],marca:item["nome"]));
       });     
    return ret;
  }
  
  static Future<List<Veiculo>> obterModelos(String idMarca, String marca) async {
    var URLModelos='https://parallelum.com.br/fipe/api/v1/carros/marcas/${idMarca}/modelos';
    var ret=List<Veiculo>.empty(growable: true);
    var res=await http.get(Uri.parse(URLModelos));
       jsonDecode(res.body)['modelos'].forEach((item){
        ret.add(Veiculo(idMarca:idMarca, marca: marca, idModelo:item["codigo"].toString(),modelo:item["nome"]));
       });     
    return ret;
  }

    static Future<List<Veiculo>> obterAnos(String idMarca, String marca,String idModelo, String modelo) async {
    var URLAno='https://parallelum.com.br/fipe/api/v1/carros/marcas/${idMarca}/modelos/${idModelo}/anos';
    var ret=List<Veiculo>.empty(growable: true);
    var res=await http.get(Uri.parse(URLAno));
       jsonDecode(res.body).forEach((item){
        ret.add(Veiculo(idMarca:idMarca, marca: marca, idModelo:idModelo,modelo:modelo,idAno:item['codigo'],ano:item['nome']));
       });     
    return ret;
  }
    static Future<Veiculo> obterPreco(String idMarca, String marca,String idModelo, String modelo,String idAno, String ano) async {
    var URLPreco='https://parallelum.com.br/fipe/api/v1/carros/marcas/${idMarca}/modelos/${idModelo}/anos/${idAno}';
    var ret=Veiculo();
    var res=await http.get(Uri.parse(URLPreco));
    var json=jsonDecode(res.body);
    ret=Veiculo(idMarca:idMarca,marca:marca,idModelo: idModelo, modelo:modelo,idAno:idAno,ano:ano,preco:json['Valor']);     
    return ret;
  }
}