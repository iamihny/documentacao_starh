

import 'package:documentacao_starh/widget/listadocumentos.dart';
import 'package:documentacao_starh/widget/logo.dart';
import 'package:documentacao_starh/widget/menu.dart';
import 'package:documentacao_starh/widget/mostra_imagem.dart';
import 'package:flutter/material.dart';


class Documentacao extends StatefulWidget {
  final solucao;

  const Documentacao({ Key? key, this.solucao }) : super(key: key);

  @override
  documentacaostate createState() => documentacaostate();
}

class documentacaostate extends State<Documentacao> {
  
  @override
  void initState(){
    super.initState();
   
  }
  

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Colors.white,
      body:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: [
          //SizedBox(child: Container(color: Colors.white), width:30, height:double.infinity),
          Flexible(
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 280,
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
            child: Container(
              width: double.infinity,
              height: 900, 
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,                
                children: [
                 // SizedBox(child: Container(color: Colors.grey[300]), width:30, height:double.infinity),
                  const SizedBox(height: 20),
                  SizedBox(child: Container(color: Colors.grey[400]), width: double.infinity, height:1),
                  const SizedBox(height: 10),
                  Text(widget.solucao['duvida'], textAlign: TextAlign.center, style: const TextStyle( color: Colors.black, fontSize: 20 )),
                  const SizedBox(height: 10),
                  SizedBox(child: Container(color: Colors.grey[400]), width: double.infinity, height:1),
                  const SizedBox(height: 20),

                  if (widget.solucao['solucao'] != null) 
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(widget.solucao['solucao'],  textAlign: TextAlign.justify, style: const TextStyle( color: Colors.black, fontSize: 18 )),
                    ),
                   
                  const SizedBox(height: 20),
                  
                  if (widget.solucao['imagem'] != null)
                    Container(
                      child: GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (_) => MostraImagem( url: 'http://177.136.76.151:8090/mobileAPI/v1/documentacao/url/'+widget.solucao['imagem'])
                          );
                        },
                        child: Image.network('http://177.136.76.151:8090/mobileAPI/v1/documentacao/url/'+widget.solucao['imagem']),
                      ),
                    ),

            

                  
                  const SizedBox(height: 20),
                  
                  if (widget.solucao['solucao2'] != null) 
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(widget.solucao['solucao2'],  textAlign: TextAlign.justify, style: const TextStyle( color: Colors.black, fontSize: 18 )),
                    ),

                  const SizedBox(height: 20),
                  if (widget.solucao['imagem2'] != null) 
                    Container(
                      child: GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (_) => MostraImagem( url: 'http://177.136.76.151:8090/mobileAPI/v1/documentacao/url/'+widget.solucao['imagem2'])
                          );
                        },
                        child: Image.network('http://177.136.76.151:8090/mobileAPI/v1/documentacao/url/'+widget.solucao['imagem2']),
                      ),
                    ),                  
                 
                  const SizedBox(height: 20),

                  if (widget.solucao['solucao3'] != null)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(widget.solucao['solucao3'],  textAlign: TextAlign.justify, style: const TextStyle( color: Colors.black, fontSize: 18 )),
                    ),

                  const SizedBox(height: 20),

                  if (widget.solucao['imagem3'] != null)
                    Container(
                      child: GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (_) => MostraImagem( url: 'http://177.136.76.151:8090/mobileAPI/v1/documentacao/url/'+widget.solucao['imagem3'])
                          );
                        },
                        child: Image.network('http://177.136.76.151:8090/mobileAPI/v1/documentacao/url/'+widget.solucao['imagem3']),
                      ),
                    ),                  
                  
                  if (widget.solucao['documentos'] != null)
                    ListaDocumentos(documentos: widget.solucao['documentos']),
    
                  
                ],
              ),
            )
          ),
          SizedBox(child: Container(color: Colors.grey[300]), width:30, height:double.infinity),
          
          Container(
            width: 10,
            color: Colors.white,
          )
              /* 
              Container(
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      // ignore: prefer_const_constructors
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),                   
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                      margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                    ),
                    
                    Expanded(
                      child: TextFormField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Pesquisar Assuntos...',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          textInputAction: TextInputAction.done,
                      ),
                    )                  

                  ],
                ),
              ), */

         // SizedBox(child: Container(color: Colors.white), width: 10, height:double.infinity),
        ],
      )
    );
      
  }
}

