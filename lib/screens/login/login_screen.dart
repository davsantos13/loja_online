import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Entrar'),
          centerTitle: true,
        ),
        body: Center(
            child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email) {
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                ),
                autocorrect: false,
                validator: (senha) {
                  if (senha.isEmpty || senha.length < 6) {
                    return 'Senha inválida';
                  }

                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text('Esqueci minha senha'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                ),
              )
            ],
          ),
        )));
  }
}
