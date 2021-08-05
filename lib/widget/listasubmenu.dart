import 'package:documentacao_starh/views/solucoes.dart';
import 'package:flutter/material.dart';

class ListaSubMenu  extends StatefulWidget {
  final listAssunto; 
  final processo;
  final codProcesso;

  const ListaSubMenu({ Key? key, this.listAssunto, this.processo, this.codProcesso }) : super(key: key);

  @override
  _ListaSubMenu createState() => _ListaSubMenu();
}

class _ListaSubMenu extends State<ListaSubMenu> {
  late List listaDados;

  @override
  void initState() {
    if (widget.listAssunto is List<dynamic>) {
      listaDados = (widget.listAssunto) as List;
    }
    else {
      listaDados = List.filled(1, null, growable: false);
      listaDados[0] = widget.listAssunto;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const PageScrollPhysics(),
      itemCount: listaDados.length ,
      itemBuilder: (BuildContext context, int index) {
        return 
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all (width: 0.8, color: Colors.white),
            ),
            child: TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                              Text(listaDados[index]['assunto'], style: const TextStyle( color: Colors.black, fontSize: 14 ) ),
                            ],
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Solucoes(assunto: listaDados[index]['assunto'], processo: widget.processo, codProcesso: widget.codProcesso, codAssunto: listaDados[index]['codAssunto'])));
                      }
                  ),
          );        
      }      
      
    );
  }
}