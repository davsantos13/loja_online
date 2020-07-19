import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virt/resources/user_manager.dart';
import 'package:loja_virt/screens/base/base_screen.dart';
import 'package:loja_virt/screens/login/login_screen.dart';
import 'package:loja_virt/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loja Virtual',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SignupScreen(),
              );
            case '/login':
              return MaterialPageRoute(
                builder: (_) => LoginScreen(),
              );
            case '/base':
            default:
              return MaterialPageRoute(
                builder: (_) => BaseScreen(),
              );
          }
        },
      ),
    );
  }
}
