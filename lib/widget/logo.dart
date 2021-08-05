import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  final empresa;

  const Logo({Key? key, this.empresa}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset(
              "assets/starh.png"
          ),
          padding: const EdgeInsets.all(8.0),
        ),
        const SizedBox( height: 5 ),
        SizedBox(child: Container(color: Colors.grey[300]), width: double.infinity, height:1),
        const SizedBox( height: 10 ),
        Text(widget.empresa, style: const TextStyle( color: Colors.black, fontSize: 20 )),
        const SizedBox( height: 10 ),
        SizedBox(child: Container(color: Colors.grey[300]), width: double.infinity, height:1),
        const SizedBox( height: 5 ),
      ],
      
    );
  }
}