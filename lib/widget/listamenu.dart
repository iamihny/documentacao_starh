import 'package:documentacao_starh/widget/listasubmenu.dart';
import 'package:flutter/material.dart';

class ListaMenu extends StatefulWidget {
  final item;
  final subMenu;
  final codProcesso;

  const ListaMenu({ Key? key, this.item, this.subMenu, this.codProcesso }) : super(key: key);

  @override
  _listaProcessoState createState() => _listaProcessoState();
}

// ignore: camel_case_types
class _listaProcessoState extends State<ListaMenu> {
  bool _expanded = false;
  
  


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
              color: Colors.white,
              width: 400,            
              child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        color: Colors.grey,
                        icon: Icon(
                            _expanded ? Icons.expand_less : Icons
                                .expand_more),
                        onPressed: () {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        }      
                      ),                      
                      Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Text(widget.item, style: const TextStyle( color: Colors.black, fontSize: 14 ))
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  }
              )
          ),
          if ((_expanded ) && (widget.subMenu != null))
            ListaSubMenu(listAssunto: widget.subMenu, processo: widget.item, codProcesso: widget.codProcesso) 
        ],
      ),
      
    );
  }
}