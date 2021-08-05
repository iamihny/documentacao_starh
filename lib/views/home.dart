import 'package:documentacao_starh/widget/logo.dart';
import 'package:documentacao_starh/widget/menu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _homeState createState() => _homeState();
}


class _homeState extends State<Home> {
  final textoController = TextEditingController();

  Future<bool> carregaPesquisa() async {
    String texto = textoController.text;
    
    texto = texto.replaceAll('?','').toUpperCase();
    texto = texto.replaceAll('º',' ');
    texto = texto.replaceAll('ª','A');
    texto = texto.replaceAll('Á','A');
    texto = texto.replaceAll('Ã','A');
    texto = texto.replaceAll('Â','A');
    texto = texto.replaceAll('À','A');
    texto = texto.replaceAll('É','E');
    texto = texto.replaceAll('Ê','E');
    texto = texto.replaceAll('È','E');
    texto = texto.replaceAll('Í','I');
    texto = texto.replaceAll('Ó','O'); 
    texto = texto.replaceAll('Õ','O');
    texto = texto.replaceAll('Ô','O');
    texto = texto.replaceAll('Ú','U');
    texto = texto.replaceAll('Ü','U'); 
    texto = texto.replaceAll('Ç','C');
    texto = texto.replaceAll('&','E');
    texto = texto.replaceAll(' ','');

    print(texto); 
    

    return true;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,        
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
              height: 900,
              width: 800,              
              child : Column(
                //scrollDirection: Axis.vertical,
               // shrinkWrap: true,
                //physics: const PageScrollPhysics(),                
                children :[
                 // Image.asset("assets/abelha.png"),                
                  const SizedBox(height: 20),
                  SizedBox(child: Container(color: Colors.grey[400]), width: double.infinity, height:1),
                  const SizedBox(height: 10),
                  const Text('Bem-vindo à Documentação Web do STARH', textAlign: TextAlign.center, style: TextStyle( color: Colors.black, fontSize: 20 )),  
                  const SizedBox(height: 10),
                  SizedBox(child: Container(color: Colors.grey[400]), width: double.infinity, height:1),
                  const SizedBox(height: 20),
                  Image.asset("assets/abelha.png"),
                  const SizedBox(height: 20),
                  const Text('Pesquise um Assunto ou acesse o Menu a esquerda, para dicas e tutoriais do STARH!', textAlign: TextAlign.center, style: TextStyle( color: Colors.black, fontSize: 18 )),  
                  const SizedBox(height: 20),
                  Container(
                    width: 500,
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
                        Container(
                          width: 1.0,
                          color: Colors.white,
                          margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                        ),                        
                        // ignore: prefer_const_constructors
                        Expanded(
                          child: TextFormField(
                              autofocus: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Como Posso Ajudar ?',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              textInputAction: TextInputAction.done,
                              controller: textoController,
                          ),
                        ),                  
                        Container(
                          height: 30.0,
                          width: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                          margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                        ),
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          // ignore: prefer_const_constructors
                          child: TextButton(
                              onPressed: () {carregaPesquisa();},
                              // ignore: prefer_const_constructors
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                          ),
                        )
                      ],
                    ),
                  ),  
                  const SizedBox(height: 20),

                ]
              )
            )
          ),
        
          SizedBox(child: Container(color: Colors.grey[300]), width:30, height:double.infinity),
          Container(
            width: 10,
            color: Colors.white,
            /*
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
               //   const SizedBox(height: 20),
               //   SizedBox(child: Container(color: Colors.grey[400]), width: double.infinity, height:1),
                  const SizedBox(height: 10),
               //   const Text('Assuntos em Destaques', textAlign: TextAlign.center, style: TextStyle( color: Colors.black, fontSize: 20 )),  
                  const SizedBox(height: 10),
                //  SizedBox(child: Container(color: Colors.grey[400]), width: double.infinity, height:1),

              ],
            ), */
          ) 



        ],
      )
    );
  }



}