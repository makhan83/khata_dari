import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key key}) : super(key: key);
  static const String id = 'MyCustomForm';

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.pink,
            title: Text("Muneer Mango Centre")),
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
      body: Center(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(

            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: 400.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                        TextFormField(
                        // The validator receives the text that the user has entered.
                        decoration: InputDecoration(
                          labelText: 'Farmer Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        decoration: InputDecoration(
                          labelText: 'Village/Town',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text('Creating new farmer profile...')));
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
      ),

    ) ;




  }
}







