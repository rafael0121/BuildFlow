// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'reset-password.page.dart';
import 'signup.page.dart';
import 'database.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? login_insert, password_insert;

  final GlobalKey<FormState> _formKey_Login = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKey_Password = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset('images/construction.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey_Login,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Login",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        onChanged: (String? value) {
                          login_insert = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor insira o login';
                          }
                          return null;
                        },
                      )
                    ])),
            SizedBox(
              height: 10,
            ),
            Form(
                key: _formKey_Password,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor insira a senha';
                          }
                          return null;
                        },
                        onChanged: (String? value) {
                          password_insert = value;
                        },
                      )
                    ])),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                child: Text(
                  "Recuperar Senha",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/passwordreset');
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFFF58524),
                    Color(0XFFF92B7F),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Enter",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("images/fenda.png"),
                            height: 28,
                            width: 28,
                          ),
                        )
                      ],
                    ),
                    onPressed: () async {
                      if (_formKey_Login.currentState!.validate()) {
                        if (_formKey_Password.currentState!.validate()) {
                          if (await check_login(login_insert, password_insert)) {
                            _formKey_Login.currentState!.reset();
                            _formKey_Password.currentState!.reset();
                            Navigator.pushNamed(context, "/home");
                          } else {
                            final snackBar = SnackBar(
                                content: Text(
                                  "Login ou senha incorretos",
                                  style: TextStyle(fontSize: 20),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 255, 17, 0));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      }
                    }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/signup");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
