import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Brains/constants.dart';
import '../Screens/account_receivables.dart';
import '../Screens/arrivals_page.dart';
import '../Screens/accounts_payable.dart';
import '../Screens/loginpage.dart';
import '../Screens/new_profile_page.dart';
import '../Screens/show_ledger_page.dart';
import 'view_profile_page.dart';


class LandingPage extends StatelessWidget {
  static const String id = 'landing_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColour,
            title: Text(kTitle),
            elevation: 0.0,
            actions: [
              Padding(
                padding: EdgeInsets.all(8.0),

                child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white),
                    )),
                //child: Text("Log Out",style: TextStyle(color: Colors.white),),),
              ),
            ]),
        drawer: Drawer(
            child: Scaffold(
                appBar: AppBar(
                    elevation: 0.0,
                    title: Text("Menu"),
                    backgroundColor: kPrimaryColour),
                body: Column(children: <Widget>[
                  ListTile(title: Text("Dashboard")),
                  ListTile(title: Text("Arrivals")),
                  ListTile(title: Text("Sales")),
                  ListTile(title: Text("Ledger and Accounts")),
                  ListTile(title: Text("Payments")),
                  ListTile(title: Text("Profiles")),
                  ListTile(title: Text("Log Out")),
                ]))),
        body: Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: Text(
                            'Dashboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                              color: kPrimaryColour,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DashContainer(
                                    buttonName: 'Ledger Statement',
                                    onPressed: (){
                                      Navigator.pushNamed(context, ShowLedger.id);
                                    }
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 50.0,
                            // ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DashContainer(
                                    buttonName: 'New Profile',
                                    onPressed: (){
                                      Navigator.pushNamed(context, NewProfile.id);
                                    }
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 50.0,
                            // ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DashContainer(
                                    buttonName: 'Profile List',
                                    onPressed: (){
                                      Navigator.pushNamed(context,ViewProfile.id);
                                    }
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 50.0,
                            // ),

                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DashContainer(
                                    buttonName: 'Accounts Payable',
                                    onPressed: (){
                                      Navigator.pushNamed(context,CashPayment.id);
                                    }
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 50.0,
                            // ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DashContainer(
                                    buttonName: 'Accounts Receivable',
                                    onPressed: (){
                                      Navigator.pushNamed(context,AcctReceivable.id);
                                    }
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DashContainer(
                                    buttonName: 'Arrivals',
                                    onPressed: (){
                                      Navigator.pushNamed(context,Arrivals.id);
                                    }
                                ),
                              ),
                            ),
                          ],),
                      ],
                    ),
                  ),
          ],
        )
      )
    );
  }
}

class DashContainer extends StatelessWidget {

  DashContainer({this.onPressed,this.buttonName});
  final Function? onPressed;
  final String? buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 100.0,
      child: TextButton(
        child: Text(
          buttonName!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed as void Function()?,
      ),
      decoration: BoxDecoration(
          color: kPrimaryColour,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
              spreadRadius: 5.0,
            )
          ]),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData? icon;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      onPressed: onPressed as void Function()?,
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
