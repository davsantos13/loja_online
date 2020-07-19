import 'package:flutter/material.dart';
import 'package:loja_virt/helpers/validators.dart';
import 'package:loja_virt/models/user.dart';
import 'package:loja_virt/resources/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Entrar'),
          centerTitle: true,
          actions: [
            FlatButton(
              padding: EdgeInsets.only(top: 8, right: 8),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/signup');
              },
              child: Text('Cadastre-se'),
              textColor: Colors.white,
            )
          ],
        ),
        body: Center(
            child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: formKey,
              child: Consumer<UserManager>(
                builder: (_, userManager, __) {
                  return ListView(
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        enabled: !userManager.loading,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email) {
                          if (!emailValido(email)) {
                            return 'Email inválido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        enabled: !userManager.loading,
                        controller: senhaController,
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
                          onPressed: userManager.loading
                              ? null
                              : () {
                                  if (formKey.currentState.validate()) {
                                    context.read<UserManager>().signIn(
                                        user: User(
                                            email: emailController.text,
                                            senha: senhaController.text),
                                        onFail: (e) {
                                          scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                            content: Text(e),
                                            backgroundColor: Colors.red,
                                          ));
                                        },
                                        onSuccess: () {
                                          Navigator.of(context).pop();
                                        });
                                  }
                                },
                          color: Theme.of(context).primaryColor,
                          disabledColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          child: userManager.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text(
                                  'Entrar',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32))),
                        ),
                      )
                    ],
                  );
                },
              )),
        )));
  }
}
