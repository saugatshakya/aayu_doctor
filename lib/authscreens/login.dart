import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PageController _pageController = PageController(initialPage: 0);
  Map doctor = {};
  String username = "";
  String password = "";
  hasPassword() async {
    final response = await http.post(
        Uri.parse('http://128.199.21.216:9191/api/doctor/doctordetails'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"username": username}));
    log(response.body);
    if (response.statusCode == 200 && response.body != "null") {
      var serverResponse = response.body;
      doctor = jsonDecode(serverResponse);
      print(doctor);
      setState(() {});
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    } else {
      print(response.reasonPhrase);
    }
  }

  setPassword(id) async {
    final response = await http.post(
        Uri.parse('http://128.199.21.216:9191/api/doctor/addpassword/$id'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"password": password}));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  checkPassword() async {
    final response = await http.post(
        Uri.parse('http://128.199.21.216:9191/api/doctor/checkdoctor'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"username": username, "password": password}));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Material(
            child: Container(
              color: Colors.lightBlue[100],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            username = val;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Username",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        onPressed: username == ""
                            ? () {}
                            : () {
                                hasPassword();
                              },
                        child: Text("NEXT")),
                  ]),
            ),
          ),
          Material(
            child: Container(
              color: Colors.lightBlue[100],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctor["password"] == null
                          ? "Set Password"
                          : "Enter Password",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 350,
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        onPressed: password == ""
                            ? () {}
                            : doctor["password"] == null
                                ? () {
                                    setPassword(doctor["doctor_id"]);
                                  }
                                : () {
                                    checkPassword();
                                  },
                        child: Text("CONTINUE")),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
