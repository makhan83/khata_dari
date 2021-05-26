import 'package:flutter/material.dart';
import '../Brains/Services.dart';
import '../Brains/ledger_class.dart';

class ShowLedger extends StatefulWidget {
  //
  ShowLedger() : super();
  static const String id = 'showledger_page';

  final String title = 'Muneer Mango Centre';

  @override
  ShowLedgerState createState() => ShowLedgerState();
}

class ShowLedgerState extends State<ShowLedger> {
  List<Ledger> _ledger;
  GlobalKey<ScaffoldState> _scaffoldKey;
  String _titleProgress;
  TextEditingController _iDController;

  @override
  void initState() {
    super.initState();
    _ledger = [];
    //_isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _iDController = TextEditingController();
    //_getLedger();
  }

  // Method to update title in the AppBar Title
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  // _showSnackBar(context, message) {
  //   _scaffoldKey.currentState.showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  _getLedger() {
    _showProgress('Loading Ledger...');
    Services.getLedger(_iDController.text).then((ledger) {
      setState(() {
        _ledger = ledger;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${ledger.length}");
    });
  }

  // DataTable and show the farmer list in it.
  SingleChildScrollView _dataBody() {
    // Both Vertical and Horizontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 20.0,
          showBottomBorder: true,
          //headingRowColor: MaterialStateColor.resolveWith((states) => Colors.pink[50]),
          headingTextStyle: TextStyle(
            color: Colors.pink,
          ),
          //dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
          columns: [
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('DATE'),
            ),
            DataColumn(
              label: Text('DESCRIPTION'),
            ),
            DataColumn(
              label: Text('REFERENCE'),
            ),
            DataColumn(
              label: Text('DEBIT'),
            ),
            DataColumn(
              label: Text('CREDIT'),
            ),
            // DataColumn(
            //   label: Text('CHANGED DATE'),
            // ),
            // DataColumn(
            //   label: Text('CHANGED BY'),
            // ),
          ],
          rows: _ledger
              .map(
                (ledger) => DataRow(cells: [
                  DataCell(
                    Text(ledger.transactionId),
                          ),
                  DataCell(
                    Text(ledger.transactionDate),
                  ),
                  DataCell(
                    Text(ledger.descriptionMsg),
                  ),
                  DataCell(
                    Text(ledger.postRef),
                  ),
                  DataCell(
                    Text(ledger.debitAmount),
                  ),
                  DataCell(
                    Text(ledger.creditAmount),
                  ),
                  // DataCell(
                  //   Text(ledger.descriptionMsg),
                  // ),
                  // DataCell(
                  //   Text(ledger.changedBy),
                  // ),
                ]),
          )
              .toList(),
        ),
      ),
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
        backgroundColor: Colors.pink,// we show the progress in the title...
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add,),
            tooltip: 'Add new farmer',
            onPressed: () {

            },
          )
        ],
      ),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //: Container(),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Ledger',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: Colors.pink,
                      ),
                    ), //Ledger name
      ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: 200,
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: TextField(
                                    controller: _iDController,
                                    keyboardType: TextInputType.name,
                                    textAlign: TextAlign.left,
                                    decoration:
                                    InputDecoration(labelText: "Full Name")),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: 200,
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: TextField(
                                  //controller: _mobileNbrController,
                                    keyboardType: TextInputType.name,
                                    textAlign: TextAlign.left,
                                    decoration:
                                    InputDecoration(labelText: "Date")),
                              ),
                            ),
                          ),


                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        OutlinedButton(onPressed: (){

                          if (_iDController.text.isEmpty ) {
                            print('Fill the required fields');
                            return;
                          }
                          _getLedger();
                          //_showProgress('Adding Farmer Profile...');
                        }, child: Text('Search'),),
                        SizedBox(width: 20.0),
                        OutlinedButton(onPressed: (){}, child: Text('Cancel'),),
                      ],
                    ),


                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: _dataBody(),
            ),
          ],
        ),
      ),
    );
  }
}