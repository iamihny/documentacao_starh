import 'package:documentacao_starh/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Documentação STARH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: Home(),
      routes:  <String , WidgetBuilder> {
        "home" : (BuildContext context) => Home()
      },
    );
  }
}
