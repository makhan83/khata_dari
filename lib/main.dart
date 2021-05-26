import 'package:flutter/material.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import 'package:khata_dari/Screens/new_farmer_page.dart';
import 'Screens/loginpage.dart';
import 'Screens/view_farmer_page.dart';
import 'package:khata_dari/Screens/show_ledger_page.dart';
//import 'package:dropdown_search/dropdown_search.dart';


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
      initialRoute: ShowLedger.id,
      routes: {
        LoginPage.id:(context) => LoginPage(),
        LandingPage.id :(context) => LandingPage(),
        ViewFarmer.id:(context) => ViewFarmer(),
        NewFarmer.id:(context) => NewFarmer(),
        ShowLedger.id:(context) => ShowLedger(),
      },

    );
  }
}


