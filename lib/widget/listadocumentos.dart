import 'package:documentacao_starh/widget/botao_exibe_doc.dart';
import 'package:flutter/material.dart';

class ListaDocumentos extends StatefulWidget {
  final documentos;

  const ListaDocumentos({ Key? key, this.documentos }) : super(key: key);

  @override
  _ListaDocumentosState createState() => _ListaDocumentosState();
}



class _ListaDocumentosState extends State<ListaDocumentos> {
  late List listaDados;

  @override
  void initState(){
    super.initState();
    
    if (widget.documentos is List){
      listaDados = widget.documentos;
    } else {
      listaDados = List.filled(1, null, growable: false);
      listaDados[0] = widget.documentos;        
    }
     
  } 


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 20),
        SizedBox(child: Container(color: Colors.grey[400]), width: double.infinity, height:1),
        const SizedBox(height: 10),
        const Text('Documentos Relacionados', textAlign: TextAlign.start, style: TextStyle( color: Colors.black, fontSize: 18 )),
        const SizedBox(height: 10),
        SizedBox(child: Container(color: Colors.grey[400]), width: double.infinity, height:1),
        const SizedBox(height: 20),

        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const PageScrollPhysics(),
          itemCount: listaDados.length,
          itemBuilder: (BuildContext context, int index){
            return BotaoExibeDocumento(nomeDocumento: listaDados[index]['nome']); 

          }         
        ),
        const SizedBox(height: 20),

      ],
      
    );
  }
}