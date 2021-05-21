import 'package:flutter/material.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import 'package:khata_dari/constants.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounting App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          // Flexible(
          //   child: Hero(
          //     tag: 'l  ogo',
          //     child: Container(
          //       height: 200.0,
          //       child: Image.asset('images/logo.png'),
          //     ),
          //   ),
          // ),
          TextField(
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            onChanged: (value) {
              username = value;
            },
            decoration:
                kTextFieldDecoration.copyWith(hintText: 'Enter your username'),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            obscureText: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              password = value;
            },
            decoration:
                kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
          ),
          SizedBox(
            height: 24.0,
          ),
          ButtonTheme(
            minWidth: 200.0,
            height: 100.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LandingPage.id);
              },
              child: Text(
                'Login',
              ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                        fontSize: 20,
                        )),

              ),
          ),

        ],
      ),
    );
  }
}


