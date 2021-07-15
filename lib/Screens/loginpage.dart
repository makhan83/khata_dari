import 'package:flutter/material.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Others/add_farmer_page.dart';
import 'package:khata_dari/Screens/landingpage.dart';


class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kPrimaryColour,
          title: Text(kTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/FruitnetLogo_1.png',
              width: 150.0,
              height: 150.0,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: 450,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: TextField(
                      //controller: userName,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(labelText: "User Name")),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: 450,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: TextField(
                      //controller: passWord,
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(labelText: "Password")),
                ),
              ),
            ),
            Container(
              width: 450,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: kPrimaryColour,
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context,LandingPage.id);
                      },
//                      minWidth: MediaQuery.of(context).size.width,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

