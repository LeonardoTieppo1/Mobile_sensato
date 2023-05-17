import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const Mapa());
}

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
  
  Completer<GoogleMapController> controller =Completer();
  final CameraPosition inicio=CameraPosition(target: LatLng(0,0),zoom:10.0);
  var marcador=<Marker>{};


  return MaterialApp(
    title: "Mapa",
    home:Scaffold(
      appBar: AppBar(title:const Text("Mapa"),
      ),
      body:GoogleMap(
        onTap:((param){
          print(param);
          var mAtual=Marker(infoWindow: InfoWindow(title:"Atual",snippet:"Sua localização"),
          markerId: MarkerId("${param.longitude.toString()}-${param.latitude.toString()}"),
          position:LatLng(param.latitude.toDouble(),param.longitude.toDouble()));
          setState((){
            marcador.add(mAtual);
          });
        }),
        markers:marcador,
        initialCameraPosition: inicio,
        mapType:MapType.normal, onMapCreated: (GoogleMapController mapCtr){
          controller.complete(mapCtr);
        },
    ),
  )
  );
  }
}
