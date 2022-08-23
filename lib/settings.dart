import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.blueGrey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Name"), Text("Arbin")],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Speciality"), Text("Skin")],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Hospital"), Text("Dhulikhel Hospital")],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Department"), Text("Dermatology")],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 30,
                    color: Colors.lightBlue[300],
                    child: Center(child: Text("Edit")),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60,
                      height: 30,
                      color: Colors.lightBlue[300],
                      child: Center(child: Text("Back")),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
