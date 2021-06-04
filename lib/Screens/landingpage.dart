import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Screens/cash_payment.dart';
import 'package:khata_dari/Screens/loginpage.dart';
import 'package:khata_dari/Screens/new_farmer_page.dart';
import 'package:khata_dari/Screens/show_ledger_page.dart';
import 'view_farmer_page.dart';


class LandingPage extends StatelessWidget {
  static const String id = 'landing_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColour,
            title: Text("Muneer Mango Centre"),
            elevation: 0.0,
            actions: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Arrivals",
                        style: TextStyle(color: Colors.white),
                      ))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sales",
                        style: TextStyle(color: Colors.white),
                      ))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Ledger",
                        style: TextStyle(color: Colors.white),
                      ))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Payments",
                        style: TextStyle(color: Colors.white),
                      ))),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Profiles",
                        style: TextStyle(color: Colors.white),
                      ))),
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
                    backgroundColor: Colors.pink),
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
                              color: Colors.pink,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DashContainer(
                                buttonName: 'Ledger',
                                onPressed: (){
                                  Navigator.pushNamed(context, ShowLedger.id);
                                }
                            ),
                            SizedBox(
                              width: 50.0,
                            ),
                            DashContainer(
                                buttonName: 'Add New Farmer',
                                onPressed: (){
                                  Navigator.pushNamed(context, NewFarmer.id);
                                }
                            ),
                            SizedBox(
                              width: 50.0,
                            ),
                            DashContainer(
                                buttonName: 'Farmer List',
                                onPressed: (){
                                  Navigator.pushNamed(context,ViewFarmer.id);
                                }
                            ),
                            SizedBox(
                              width: 50.0,
                            ),
                            DashContainer(
                                buttonName: 'Cash Payments',
                                onPressed: (){
                                  Navigator.pushNamed(context,CashPayment.id);
                                }
                            ),
                          ],),
                      ],
                    ),
                  ),

                  // Expanded(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     //crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         DashContainer(
                  //           buttonName: 'Ledger',
                  //           onPressed: (){
                  //             Navigator.pushNamed(context, ShowLedger.id);
                  //           }
                  //           ),
                  //         SizedBox(
                  //           width: 50.0,
                  //         ),
                  //         DashContainer(
                  //             buttonName: 'Farmer Profile',
                  //             onPressed: (){
                  //               Navigator.pushNamed(context, NewFarmer.id);
                  //             }
                  //         ),
                  //       ],),
                  // ),
            //SizedBox(height: 50.0,),
            // Expanded(
            //   child:
            //       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //     DashContainer(),
            //     SizedBox(
            //       width: 50.0,
            //     ),
            //     DashContainer(),
            //     SizedBox(
            //       width: 50.0,
            //     ),
            //     DashContainer(),
            //     SizedBox(
            //       width: 50.0,
            //     ),
            //     DashContainer(),
            //     SizedBox(
            //       width: 50.0,
            //     ),
            //     DashContainer(),
            //   ]),
            // ),
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
