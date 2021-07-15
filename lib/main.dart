import 'package:flutter/material.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Screens/Sales_page.dart';
import 'package:khata_dari/Screens/account_receivables.dart';
import 'package:khata_dari/Screens/arrivals_page.dart';
import 'package:khata_dari/Screens/dashboard_page.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import 'package:khata_dari/Screens/new_profile_page.dart';
import 'package:khata_dari/Screens/update_profile.dart';
import 'Screens/loginpage.dart';
import 'Screens/view_profile_page.dart';
import 'package:khata_dari/Screens/show_ledger_page.dart';
import 'package:khata_dari/Screens/accounts_payable.dart';

void main() => runApp(KhataDari());

class KhataDari extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.light().copyWith(
      theme: ThemeData(
      brightness: Brightness.light,
      //bottomAppBarColor: Colors.grey,
      //primaryColor: Colors.red[800],
      accentColor: kUnselectedLabelColour,
        //primaryColor: Color(0xff0A0E21),

        //scaffoldBackgroundColor: Color(0xff72AA9B),
      ),
      // home: HomePage(),
      initialRoute: Sales.id,
      routes: {
        LoginPage.id:(context) => LoginPage(),
        LandingPage.id :(context) => LandingPage(),
        ViewProfile.id:(context) => ViewProfile(0),
        NewProfile.id:(context) => NewProfile(),
        ShowLedger.id:(context) => ShowLedger(),
        CashPayment.id:(context) => CashPayment(),
        UpdateFarmer.id:(context) => UpdateFarmer(),
        AcctReceivable.id:(context) => AcctReceivable(),
        Sales.id:(context) => Sales(),
        Arrivals.id:(context) => Arrivals(),
        MyAppDash.id:(context) => MyAppDash(),

      },
    );
  }
}


