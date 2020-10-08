import 'package:easyfest/models/user_model.dart';
import 'package:easyfest/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';


class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final GoogleSignIn googleSignIn = GoogleSignIn();

  void _getUser() async {
    try{
      final GoogleSignInAccount googleSignInAccount =
      await googleSignIn.signIn();
    }catch (error){}

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffolfkey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text("Criar conta",
            style: TextStyle(
              fontSize: 15.0
            ),
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignUpScreen())
              );
            },
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "E-mail"
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text){
                    if(text.isEmpty || !text.contains("@")) return " E-mail inválido";
                  },
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Senha"
                  ),
                  obscureText: true,
                  validator: (text){
                    if(text.isEmpty || text.length< 6) return "Senha invalida";
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: (){ },
                    child: Text("Esqueci minha senha",
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.zero,

                  ),
                ),
                SizedBox(height: 16.0,),
                SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      child: Text("Entrar",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                        }
                       model.signIn();

                      },
                    )
                ),
                Divider(),
                SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      child: Text("Login com o google",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        _getUser();
                      },
                    )
                ),

              ],
            ),
          );
        },
      )

    );
  }
}
