import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        getLogo(),
        getBackgroundImage(),
        getContainerInferior(),
        getTextGerencieFinal(),
      ],
    ));
  }

  getLogo() {
    return SizedBox(
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        "assets/images/montanha.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  getBackgroundImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          "assets/images/logo.png",
        ),
      ),
    );
  }

  getContainerInferior() {
    return Padding(
      padding: const EdgeInsets.only(top: 170),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(150),
            topRight: Radius.circular(170),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, right: 60, left: 60, bottom: 30),
          child: Column(
            children: [
              getTextLegenda('Login'),
              getTextFormFieldLogin(),
              SizedBox(
                height: 40,
              ),
              getTextLegenda('Senha'),
              getTextFormFieldSenha(),
              SizedBox(
                height: 20,
              ),
              getBotaoEntrar(context),
            ],
          ),
        ),
      ),
    );
  }

  getTextLegenda(String texto) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        style: TextStyle(color: Colors.deepPurple[700], fontSize: 26),
      ),
    );
  }

  getTextFormFieldLogin() {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Digite seu login',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 3.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 3.0,
          ),
        ),
      ),
    );
  }

  getTextFormFieldSenha() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      obscureText: _obscureText,
      decoration: InputDecoration(
          hintText: 'Digite sua senha',
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.deepPurple,
              width: 3.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.purple,
              width: 3.0,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              _toggle();
            },
          )),
    );
  }

  getBotaoEntrar(context) {
    return SizedBox(
      height: 56,
      width: 220,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: Text(
          'Entrar',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  getTextGerencieFinal() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Gerencie suas Tarefas',
          style: TextStyle(
            color: Colors.deepPurple[700],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
