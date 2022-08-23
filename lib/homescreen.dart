import 'package:aayu_doctor/authscreens/welcome.dart';
import 'package:aayu_doctor/settings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool onPremises = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Settings()));
                      },
                      child: Text("Settings"),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Welcome()));
                        },
                        child: Text("LogOut")),
                  ]),
            ),
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("On Premises"),
                  Checkbox(
                      value: onPremises,
                      onChanged: (val) {
                        setState(() {
                          onPremises = !onPremises;
                        });
                      })
                ],
              ),
            ),
            Container(
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Active"),
                  Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.redAccent[700],
                          borderRadius: BorderRadius.circular(15)))
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Active Case",
                    style: TextStyle(
                        color: Colors.lightBlue[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  Card(
                    color: Colors.lightBlue[100],
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name:   xyz",
                              style: TextStyle(color: Colors.lightBlue)),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Sex:       Male",
                              style: TextStyle(color: Colors.lightBlue)),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Age:       32",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Case:                Burn;    Emergency",
                              style: TextStyle(color: Colors.lightBlue),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "BloodGroup:    O+",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Date:                 September " + 24.toString(),
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
