//---- Packages
import 'package:flutter/material.dart';

//---- Screens
import 'package:github/src/auth/Login.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  //---- Variables
  bool obscureText = true;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _snack = GlobalKey<ScaffoldState>();

  //---- Functions

  void snackBar(String message) {
    _snack.currentState.showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _snack,
      backgroundColor: Colors.black,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/github.png",
              filterQuality: FilterQuality.high,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Digite seu nome",
                      contentPadding: EdgeInsets.only(left: 16)),
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  controller: _nameController,
                ),
                width: size.width * 0.94,
                height: size.height * 0.06),
            Divider(
              color: Colors.black,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Digite seu E-mail",
                      contentPadding: EdgeInsets.only(left: 16)),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                width: size.width * 0.94,
                height: size.height * 0.06),
            Divider(
              color: Colors.black,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye, color: Colors.black),
                          onPressed: () => setState(() {
                                obscureText = !obscureText;
                              })),
                      border: InputBorder.none,
                      hintText: "Digite sua senha",
                      contentPadding: EdgeInsets.only(left: 16, top: 15)),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscureText,
                  controller: _passwordController,
                ),
                width: size.width * 0.94,
                height: size.height * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("You have acount?", style: TextStyle(color: Colors.white)),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => false);
                    },
                    child: Text("Sign In"))
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () async {
                      if (_emailController.text != "" &&
                          _passwordController.text != "" &&
                          _nameController.text != "") {
                      } else {
                        snackBar("Inválido");
                      }
                    },
                    child: Text("Sign Up"),
                  ),
                  width: size.width * 0.4,
                  height: size.height * 0.06),
            ),
            Divider(
              color: Colors.black,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () async {},
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icon-google.png",
                          fit: BoxFit.contain,
                          height: size.height * 0.036,
                        ),
                        Text(" Sign Up Google"),
                      ],
                    ),
                  ),
                  width: size.width * 0.4,
                  height: size.height * 0.06),
            )
          ],
        ),
      ),
    );
  }
}
