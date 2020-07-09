import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virt/screens/base/base_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja Virtual',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor: Color.fromARGB(255, 4, 125, 141),
        appBarTheme: const AppBarTheme(elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
