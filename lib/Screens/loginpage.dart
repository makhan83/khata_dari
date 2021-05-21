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
        title: Text('Khata Application'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Flexible(
          //   child: Hero(
          //     tag: 'logo',
          //     child: Container(
          //       height: 200.0,
          //       child: Image.asset('images/logo.png'),
          //     ),
          //   ),
          // ),
          Row(

          ),
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
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, LandingPage.id);
            },
            child: Text('Login'),
            ),
        ],
      ),
    );
  }
}

// Scaffold(
// appBar: AppBar(
// title: Text('Khata Application'),
// ),
// body: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// GestureDetector(
// onTap: () {
// Navigator.pushNamed(context,LandingPage.id);
// },
// child: Container(
// color: Colors.green,
// margin: EdgeInsets.only(top: 10.0),
// width: 50.0,
// height: 50.0,
// child: Center(
// child: Text(
// 'CALCULATE',
// style: TextStyle(
// fontSize: 30.0,
// fontWeight: FontWeight.w500,
// ),
// ),
// ),
// ),
// ),
// ],
// ));
