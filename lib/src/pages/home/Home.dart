//---- Packages
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//---- Animation
import 'package:github/src/fadeAnimation/fadeAnimation.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future getData() async {
    String url = "https://api.github.com/users/ramonpaolo";

    http.Response a = await http.get(url, headers: {
      "access-token": "47f60ffc40144c516e47f770ad2cab385859016b",
      "Accept": "application/json"
    });
    print(a.body);
    var decodificado = await jsonDecode(a.body);
    return decodificado;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        FadeAnimation(
          colorInit: Colors.white,
          colorEnd: Colors.black,
        ),
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  FadeAnimationName(
                    child: Text(
                      "Olá, ${snapshot.data["name"]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  FadeAnimationUser(
                    image: "${snapshot.data["avatar_url"]}",
                  ),
                  FadeAnimationBody(Column(
                    children: [
                      Text(
                        "${snapshot.data["repos_url"].toString().replaceAll("api", "www")}",
                      ),
                      Text("Your blog: ${snapshot.data["blog"]}"),
                      Text(
                          "Your GitHub: ${snapshot.data["url"].toString().replaceAll("api", "www")}"),
                      TextButton(
                          onPressed: () async {
                            if (await canLaunch(snapshot.data["url"]
                                .toString()
                                .replaceAll("api", "www"))) {
                              await launch(snapshot.data["url"]
                                  .toString()
                                  .replaceAll("api", "www"));
                            } else {
                              print("error");
                            }
                          },
                          child: Text("Open your GitHub"))
                    ],
                  ))
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          future: getData(),
        )
      ],
    ));
  }
}
