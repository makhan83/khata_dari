import 'package:flutter/material.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Brains/farmer_profile.dart';
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
  List<Ledger>? _ledger;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  late String _titleProgress;
  //TextEditingController _iDController;
  //Dropdown declarations
  List<Farmer>? _farmers;// = DropFarmers.getDropFarmers();
  //List<DropdownMenuItem<Farmer>> _dropdownMenuItems;
  Farmer? _selectedFarmer;

  @override
  void initState() {
    super.initState();
    _ledger = [];
    _farmers = [];
    //_isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    //_iDController = TextEditingController();
    //_getFarmers();
    if(_farmers!.length >0)
    {
      _selectedFarmer = _farmers![0];
    }
  }

  // _getFarmers() {
  //   _showProgress('Loading Farmer Profiles...');
  //   Services.getFarmers().then((farmers) {
  //     setState(() {
  //       _farmers = farmers;
  //     });
  //     _showProgress(widget.title); // Reset the title...
  //     print("Length ${farmers!.length}");
  //   });
  // }



  DropdownMenuItem<Farmer> buildDropdownMenuItem(Farmer item) {
    return DropdownMenuItem(
      value: item, // you must provide a value
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(item.full_name ?? ""),
      ),
    );
  }

  onChangeDropdownItem(Farmer selectedFarmer) {
    setState(() {
      _selectedFarmer = selectedFarmer;
    });
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
    Services.getLedger(_selectedFarmer!.farmer_id).then((ledger) {
      setState(() {
        _ledger = ledger;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${ledger!.length}");
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
            color: kPrimaryColour,
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
          rows: _ledger!
              .map(
                (ledger) => DataRow(cells: [
              DataCell(
                Text(ledger.transactionId!),
              ),
              DataCell(
                Text(ledger.transactionDate!),
              ),
              DataCell(
                Text(ledger.descriptionMsg!),
              ),
              DataCell(
                Text(ledger.postRef!),
              ),
              DataCell(
                Text(ledger.debitAmount!),
              ),
              DataCell(
                Text(ledger.creditAmount!),
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
        backgroundColor: kPrimaryColour,// we show the progress in the title...
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home,),
            tooltip: 'Home',
            onPressed: () {
              Navigator.pop(context);
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Container(
                      child: Text(
                        'Selection',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0,
                          color: kPrimaryColour,
                        ),
                      ), //Ledger name
                    ),
                  ),
                  Divider(),
                  // Padding(
                  //   padding: EdgeInsets.all(8),
                  //   child: Container(
                  //     width: 200,
                  //     child: Padding(
                  //       padding: EdgeInsets.all(0.0),
                  //       child: TextField(
                  //           controller: _iDController,
                  //           keyboardType: TextInputType.name,
                  //           textAlign: TextAlign.left,
                  //           decoration:
                  //           InputDecoration(labelText: "Full Name")),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Select Farmer name"),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropdownButton<Farmer>(
                    isExpanded: true,
                    value: _selectedFarmer,
                    items: _farmers!.map((item) => buildDropdownMenuItem(item)).toList(),
                    onChanged: (Farmer? item){
                      setState(() {
                        _selectedFarmer = item;
                        _getLedger();
                        print(_selectedFarmer!.farmer_id);
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //Text('Selected: ${_selectedFarmer.full_name}'),


                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // OutlinedButton(onPressed: (){
                      //
                      //   // if (_iDController.text.isEmpty ) {
                      //   //   print('Fill the required fields');
                      //   //   return;
                      //   // }
                      //   print(_selectedFarmer.farmer_id);
                      //   _getLedger();
                      //   //_showProgress('Adding Farmer Profile...');
                      // }, child: Text('Search'),),
                      //SizedBox(width: 20.0),
                      //OutlinedButton(onPressed: (){}, child: Text('Cancel'),),
                    ],
                  ),


                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Container(
                      child: Text(
                        'Ledger Statement',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: kPrimaryColour,
                        ),
                      ), //Ledger name
                    ),
                  ),
                  Expanded(child: _dataBody()),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}