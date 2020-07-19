import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virt/helpers/validators.dart';
import 'package:loja_virt/models/user.dart';
import 'package:loja_virt/resources/user_manager.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Criar conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __) {
                return ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(16),
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      enabled: !userManager.loading,
                      decoration: InputDecoration(
                          hintText: 'Nome',
                          contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                      validator: (name) {
                        if (name.isEmpty) {
                          return 'Campo obrigatório';
                        } else if (name.trim().split(' ').length <= 1) {
                          return 'Preencha nome completo';
                        }
                      },
                      onSaved: (name) => user.nome = name,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      enabled: !userManager.loading,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding: EdgeInsets.symmetric(horizontal: 8)),
                      validator: (email) {
                        if (email.isEmpty) {
                          return 'Campo obrigatório';
                        } else if (!emailValido(email)) {
                          return 'E-mail inválido';
                        }

                        return null;
                      },
                      onSaved: (email) => user.email = email,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        obscureText: true,
                        enabled: !userManager.loading,
                        decoration: InputDecoration(
                            hintText: 'Senha',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8)),
                        validator: (senha) {
                          if (senha.isEmpty) {
                            return 'Campo obrigatório';
                          } else if (senha.length < 6) {
                            return 'Senha muito curta';
                          }
                          return null;
                        },
                        onSaved: (senha) => user.senha = senha),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                        obscureText: true,
                        enabled: !userManager.loading,
                        decoration: InputDecoration(
                            hintText: 'Confirmar senha',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8)),
                        validator: (confirmar) {
                          if (confirmar.isEmpty) {
                            return 'Campo obrigatório';
                          }

                          return null;
                        },
                        onSaved: (confirmPass) =>
                            user.confirmaSenha = confirmPass),
                    SizedBox(
                      height: 44,
                    ),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        onPressed: userManager.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();

                                  if (user.senha != user.confirmaSenha) {
                                    scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text('Senhas não coincidem'),
                                      backgroundColor: Colors.amber[100],
                                    ));
                                    return;
                                  }

                                  context.read<UserManager>().signUp(
                                      user: user,
                                      onSuccess: () {
                                        Navigator.of(context)
                                            .pushNamed('/base');
                                      },
                                      onFail: (e) {
                                        scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text('Falha ao cadastrar: $e'),
                                          backgroundColor: Colors.redAccent,
                                        ));
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
                                'Cadastrar',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32))),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
