import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/4047186/pexels-photo-4047186.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
                  fit: BoxFit.cover)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 240,
              child: Stack(children: [
                Container(
                    width: 240,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              width: 250,
                              child: Image.asset("assets/aayu16.png")),
                          Container(
                            width: 200,
                            height: 2,
                            color: Colors.lightBlue,
                          )
                        ])),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text(
                    "Doctor",
                    style:
                        TextStyle(color: Colors.lightBlue[100], fontSize: 24),
                  ),
                ),
              ]),
            ),
            // Text(
            //   "Doctor",
            //   style: TextStyle(color: Colors.lightBlue[100], fontSize: 32),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width - 30,
                // ignore: deprecated_member_use
                child: TextButton(
                    onPressed: () {
                      //go to login screen
                      Navigator.pushNamed(context, "Login");
                    },
                    child: Text("Get Started",
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Colors.white)))),
            // ignore: deprecated_member_use
          ])),
    );
  }
}
