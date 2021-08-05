import 'package:flutter/material.dart';

class MostraImagem extends StatefulWidget {
  final url;

  const MostraImagem({ Key? key, this.url }) : super(key: key);

  @override
  _MostraImagemState createState() => _MostraImagemState();
}

class _MostraImagemState extends State<MostraImagem> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.url),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}