import 'package:flutter/material.dart';
import 'package:khata_dari/Screens/add_farmer_page.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import 'package:khata_dari/constants.dart';
import 'package:khata_dari/reusable_card.dart';

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
          elevation: 0.0,
          //backgroundColor: Colors.pink,
          title: Text("Muneer Mango Centre")),
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
                    color: Colors.pink,
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyCustomForm.id);
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

    //   Scaffold(
    //   appBar: AppBar(
    //     title: Text('Khata Application'),
    //   ),
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: <Widget>[
    //       // Flexible(
    //       //   child: Hero(
    //       //     tag: 'logo',
    //       //     child: Container(
    //       //       height: 200.0,
    //       //       child: Image.asset('images/logo.png'),
    //       //     ),
    //       //   ),
    //       // ),
    //       Row(
    //
    //       ),
    //       TextField(
    //         keyboardType: TextInputType.name,
    //         textAlign: TextAlign.center,
    //         onChanged: (value) {
    //           username = value;
    //         },
    //         decoration:
    //             kTextFieldDecoration.copyWith(hintText: 'Enter your username'),
    //       ),
    //       SizedBox(
    //         height: 8.0,
    //       ),
    //       TextField(
    //         obscureText: true,
    //         textAlign: TextAlign.center,
    //         onChanged: (value) {
    //           password = value;
    //         },
    //         decoration:
    //             kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
    //       ),
    //       SizedBox(
    //         height: 24.0,
    //       ),
    //       ElevatedButton(
    //         onPressed: () {
    //           Navigator.pushNamed(context, LandingPage.id);
    //         },
    //         child: Text('Login'),
    //         ),
    //     ],
    //   ),
    // );
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
