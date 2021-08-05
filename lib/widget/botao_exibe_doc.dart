import 'package:flutter/material.dart';
import 'dart:js' as js;

class BotaoExibeDocumento extends StatefulWidget {
  final nomeDocumento;

  const BotaoExibeDocumento ({ Key? key, this.nomeDocumento }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<BotaoExibeDocumento> {
  
  void abrirDocumento(){
    js.context.callMethod('open',['http://177.136.76.151:8090/mobileAPI/v1/documentacao/doc/'+widget.nomeDocumento.toString()]);

  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { 
        abrirDocumento();
        },
      child: Card(
        elevation: 10,
        child: Container(
         width: 800,
         // height: 80,
          child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Row(
            children: [
              const Icon(Icons.description_outlined, color: Colors.blueGrey,),
              Expanded(child: Text(widget.nomeDocumento, style: const TextStyle( color: Colors.blueGrey, fontSize: 16 )))   
            ],
          ) 
              
          ),  
        ),

      )
      
    );
  }
}