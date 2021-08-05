import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'listamenu.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<bool> x;
  int statusCode = 0;
  late List listaDados;

  @override
  void initState(){
    super.initState();
    x = carregamenu();
  } 
  
  Future<bool> carregamenu() async {
    var key      = "b8a6b273f109c80d4a204f047ad861f4--93d724d38dfb90908b0171d776c16839";
    var servidor = "http://177.136.76.151:8090/mobileAPI/";
    
    var urlCompleta = Uri.parse(servidor+"v1/documentacao/menuDocumentacao/");
    final response  = await http.get(urlCompleta);

    statusCode = response.statusCode;

    if (response.statusCode == 200){
      var conversor = json.decode(response.body);

        if(conversor['processo'] is List){
          listaDados = conversor['processo'] as List;
        } else if (conversor['processo'] != null) {
          listaDados = List.filled(1, null, growable: false);
          listaDados[0] = conversor['processo'];
        }      

        //print(listaDados);
      return true;
    }else{  
      return false;  
    }

   }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: x,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
              
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child : const CircularProgressIndicator(backgroundColor: Colors.white, color: Colors.white, strokeWidth: 20),
                width: 200,
                height: 200,
              );
            } 

              if (listaDados.isNotEmpty && statusCode == 200 ) {
                 return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  itemCount: listaDados.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListaMenu(item:listaDados[index]['processo'], subMenu: listaDados[index]['listAssunto'], codProcesso: listaDados[index]['codProcesso']); 
                  
                  }
                  
                );

              }
            else
              return Container();              
      
      }

    );
    
  }
}