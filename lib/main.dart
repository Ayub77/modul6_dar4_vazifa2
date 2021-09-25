import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modul6_dar4vazifa2/pages/homepage.dart';
import 'package:modul6_dar4vazifa2/pages/secondpage.dart';



void main() async{

  await Hive.initFlutter();
  await Hive.openBox("ishonch");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SecondPage(),
      routes: {
        HomePage.id: (context)=>HomePage(),
        SecondPage.id: (context)=>SecondPage(),
      },
    );
  }
}

