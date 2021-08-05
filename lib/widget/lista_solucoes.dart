import 'package:documentacao_starh/views/documentacao.dart';
import 'package:flutter/material.dart';

class ListaSolucoes extends StatefulWidget {
  final solucao;

  const ListaSolucoes({ Key? key, this.solucao }) : super(key: key);

  @override
  _ListaSolucoesState createState() => _ListaSolucoesState();
}

class _ListaSolucoesState extends State<ListaSolucoes> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { 
        Navigator.push(context, MaterialPageRoute(builder: (context) => Documentacao(solucao: widget.solucao)));
        },
      child: Card(
        child: Container(
          width: 600,
          height: 40,
          child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Text(widget.solucao['duvida'], style: const TextStyle( color: Colors.black, fontSize: 16 ))
          ),  
        ),
      )
      
    );
    
  }
}