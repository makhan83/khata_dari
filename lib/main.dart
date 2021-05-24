import 'package:flutter/material.dart';
import 'package:khata_dari/Screens/add_farmer_page.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import 'Screens/loginpage.dart';
import 'datatable.dart';


void main() => runApp(KhataDari());

class KhataDari extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        //primaryColor: Color(0xff0A0E21),
        //scaffoldBackgroundColor: Color(0xff0A0E21),
        //test commit
      ),
      // home: HomePage(),
      initialRoute: DataTableDemo.id,
      routes: {
        LoginPage.id:(context) => LoginPage(),
        LandingPage.id :(context) => LandingPage(),
        MyCustomForm.id:(context) => MyCustomForm(),
        DataTableDemo.id:(context) => DataTableDemo(),

      },

    );
  }
}


