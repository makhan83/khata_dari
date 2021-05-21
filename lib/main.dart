import 'package:flutter/material.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import 'Screens/loginpage.dart';

void main() => runApp(KhataDari());

class KhataDari extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        //primaryColor: Color(0xff0A0E21),
        //scaffoldBackgroundColor: Color(0xff0A0E21),
      ),
      // home: HomePage(),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id:(context) => LoginPage(),
        LandingPage.id :(context) => LandingPage(),
      },

    );
  }
}


