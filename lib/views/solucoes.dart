import 'dart:convert';

import 'package:documentacao_starh/widget/lista_solucoes.dart';
import 'package:documentacao_starh/widget/logo.dart';
import 'package:documentacao_starh/widget/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Solucoes extends StatefulWidget {
  final codProcesso;
  final codAssunto;
  final processo;
  final assunto;
  

  const Solucoes({ Key? key, this.codProcesso, this.codAssunto, this.processo, this.assunto }) : super(key: key);

  @override
  _SolucoesState createState() => _SolucoesState();
}

class _SolucoesState extends State<Solucoes> {
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
    
    var urlCompleta = Uri.parse(servidor+"v1/documentacao/solucoes/"+widget.codProcesso+"/"+widget.codAssunto);
    final response  = await http.get(urlCompleta);

    statusCode = response.statusCode;

    if (response.statusCode == 200){
      var conversor = json.decode(response.body);

        if(conversor['solucao'] is List){
          listaDados = conversor['solucao'] as List;
        } else if (conversor['solucao'] != null) {
          listaDados = List.filled(1, null, growable: false);
          listaDados[0] = conversor['solucao'];
        }      

        print(listaDados);
      return true;
    }else{  
      return false;  
    }

   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 350,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const PageScrollPhysics(),                
                children: [
                  const Logo(empresa:'STARH Documentação'),
                  Menu(),
                ],  
              )
            )
          ),
          SizedBox(child: Container(color: Colors.grey[300]), width: 30, height:double.infinity),
          Flexible(
            // ignore: sized_box_for_whitespace
            child: Container(
              color: Colors.grey[200],
              height: 900,
              width: 800,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const PageScrollPhysics(),                
                children: [
                  Row(
                    children: [
                      Text(widget.processo),
                      const Text(' >> '),
                      Text(widget.assunto)
                    ],
                  ), 
                  FutureBuilder(
                    future: x,
                    builder: (BuildContext context, AsyncSnapshot snapshot){

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
                              return ListaSolucoes(solucao: listaDados[index]); 
                            
                            }
                            
                          );

                        }
                      else
                        return Container();              

                    },
                  )
                  
                ],  
              )
            )
          ),
        ],
      )
    );    

  }
}