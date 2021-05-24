import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  static const String id = 'landing_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.pink,
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
                    onPressed: () {},
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  'Dashboard',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.pink,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DashContainer(),
                  //SizedBox(width: 50.0,),
                  DashContainer(),
                  //SizedBox(width: 50.0,),
                  DashContainer(),
                  //SizedBox(width: 50.0,),
                  DashContainer(),
                  DashContainer(),
            ]
          ),
              //SizedBox(height: 50.0,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashContainer(),
                    //SizedBox(width: 50.0,),
                    DashContainer(),
                    //SizedBox(width: 50.0,),
                    DashContainer(),
                    //SizedBox(width: 50.0,),
                    DashContainer(),
                    DashContainer(),
                  ]
              ),

    ],)
    )
    );
  }
}

class DashContainer extends StatelessWidget {
  const DashContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155.0,
      width: 195.0,
      decoration: BoxDecoration(
          color: Colors.pink[700],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
              spreadRadius: 5.0,
            )
          ]
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      onPressed: onPressed,
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
