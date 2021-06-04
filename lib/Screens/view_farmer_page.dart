import 'package:flutter/material.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import 'package:khata_dari/Screens/new_farmer_page.dart';
import '../Brains/Services.dart';
import '../Brains/farmer_model.dart';

class ViewFarmer extends StatefulWidget {
  //
  ViewFarmer() : super();
  static const String id = 'viewfarmer_page';

  final String title = 'Muneer Mango Centre';

  @override
  ViewFarmerState createState() => ViewFarmerState();
}

class ViewFarmerState extends State<ViewFarmer> {
  List<FarmerModel>? _farmers;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  // TextEditingController _fullNameController;
  // TextEditingController _fatherNameController;
  // TextEditingController _cityNameController;
  // TextEditingController _pincodeController;
  // TextEditingController _districtNameController;
  // TextEditingController _stateNameController;
  // TextEditingController _mobileNbrController;
  // TextEditingController _phoneNbrController;
  // TextEditingController _emailController;
  // TextEditingController _govtIdController;
  // TextEditingController _govtIdTypeController;
  // TextEditingController _bankNameController;
  // TextEditingController _bankAcctNbrController;
  // TextEditingController _bankAcctTypeController;
  // TextEditingController _ifscCodeController;
  // TextEditingController _createdAtController;
  // TextEditingController _createdByController;

  FarmerModel? _selectedFarmer;
  //bool _isUpdating;
  late String _titleProgress;

  @override
  void initState() {
    super.initState();
    _farmers = [];
    //_isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _getFarmers();
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

  _getFarmers() {
    _showProgress('Loading Farmer Profiles...');
    Services.getFarmers().then((farmers) {
      setState(() {
        _farmers = farmers;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${farmers!.length}");
    });
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        'More Details',
        style: TextStyle(
          color: Colors.pink,
          fontSize: 16.0,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Text(
              'Alternate Number : ' +
                  _selectedFarmer!.phone_secondary.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Email ID : ' + _selectedFarmer!.email.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'ID Card : ' + _selectedFarmer!.govt_id_type.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'ID Number : ' + _selectedFarmer!.govt_id_nbr.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Divider(),
            Text(
              'Bank Details',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.pink,
              ),
            ),
            Text(
              'Bank Name : ' + _selectedFarmer!.bank_name.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Account Type : ' + _selectedFarmer!.bank_acct_type.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Account Number : ' + _selectedFarmer!.bank_acct_nbr.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'IFSC Code : ' + _selectedFarmer!.ifsc_code.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  // _updateFarmer(Farmer farmer) {
  //   setState(() {
  //     _isUpdating = true;
  //   });
  //   _showProgress('Updating Employee...');
  //   Services.updateFarmer(
  //       farmer.farmer_id, _fullNameController.text, _fatherNameController.text, _cityNameController.text, _pincodeController.text,   _districtNameController.text,   _stateNameController.text, _mobileNbrController.text,   _phoneNbrController.text,   _emailController.text,   _govtIdController.text,   _govtIdTypeController.text,   _bankNameController.text,   _bankAcctNbrController.text,   _bankAcctTypeController.text,   _ifscCodeController.text) //, _createdAtController.text,_createdByController.text)
  //       .then((result) {
  //     if ('success' == result) {
  //       _getFarmers(); // Refresh the list after update
  //       setState(() {
  //         _isUpdating = false;
  //       });
  //       _clearValues();
  //     }
  //   });
  // }

  // DataTable and show the farmer list in it.
  SingleChildScrollView _dataBody() {
    // Both Vertical and Horizontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 10.0,
          showBottomBorder: true,
          dataRowHeight: 30.0,
          //headingRowColor: MaterialStateColor.resolveWith((states) => Colors.pink[50]),
          headingTextStyle: TextStyle(
            color: kPrimaryColour,
          ),
          //dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
          columns: [
            DataColumn(
              label: Text('FARMER ID'),
            ),
            DataColumn(
              label: Text('FULL NAME'),
            ),
            DataColumn(
              label: Text('FATHER NAME'),
            ),
            DataColumn(
              label: Text('CITY'),
            ),
            DataColumn(
              label: Text('PINCODE'),
            ),
            DataColumn(
              label: Text('DISTRICT'),
            ),
            DataColumn(
              label: Text('STATE'),
            ),
            DataColumn(
              label: Text('MOBILE'),
            ),
            DataColumn(
              label: Text('CHANGED AT'),
            ),
            DataColumn(
              label: Text('CREATED BY'),
            ),
            DataColumn(
              label: Text('MORE DETAILS'),
            ),
            DataColumn(
              label: Text('MODIFY'),
            ),
            // DataColumn(
            //   label: Text('ALTERNATE NUMBER'),
            // ),
            // DataColumn(
            //   label: Text('EMAIL'),
            // ),
            // DataColumn(
            //   label: Text('GOVT ID NBR'),
            // ),
            // DataColumn(
            //   label: Text('GOVT ID TYPE'),
            // ),
            // DataColumn(
            //   label: Text('BANK NAME'),
            // ),
            // DataColumn(
            //   label: Text('ACCOUNT NUMBER'),
            // ),
            // DataColumn(
            //   label: Text('ACCOUNT TYPE'),
            // ),
            // DataColumn(
            //   label: Text('IFSC CODE'),
            // ),

            // Lets add one more column to show a delete button
          ],
          rows: _farmers!
              .map(
                (farmer) => DataRow(
                  cells: [
                    DataCell(
                      Text(
                        farmer.farmer_id_ext!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),

                      // Add tap in the row and populate the
                      // textfields with the corresponding values to update
                      // onTap: () {
                      //   _showValues(farmer);
                      //   // Set the Selected employee to Update
                      //   _selectedFarmer = farmer;
                      //   setState(() {
                      //     _isUpdating = true;
                      //   });
                      // },
                    ),
                    DataCell(
                      Text(
                        farmer.full_name!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        farmer.father_name!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        farmer.village_town_city!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        farmer.pincode!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        farmer.district!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        farmer.state_name!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        farmer.mobile_primary!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    // DataCell(
                    //   Text(
                    //     farmer.phone_secondary!,
                    //     style: TextStyle(
                    //       fontSize: 14.0,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // DataCell(
                    //   Text(
                    //     farmer.email!,
                    //     style: TextStyle(
                    //       fontSize: 14.0,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // DataCell(
                    //   Text(
                    //     farmer.govt_id_nbr!,
                    //     style: TextStyle(
                    //       fontSize: 14.0,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // DataCell(
                    //   Text(
                    //     farmer.govt_id_type!,
                    //     style: TextStyle(
                    //       fontSize: 14.0,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // DataCell(
                    //   Text(
                    //     farmer.bank_name!,
                    //     style: TextStyle(
                    //       fontSize: 14.0,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // DataCell(
                    //   Text(
                    //     farmer.bank_acct_nbr!,
                    //     style: TextStyle(
                    //       fontSize: 14.0,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // DataCell(
                    //   Text(
                    //     farmer.bank_acct_type!,
                    //     style: TextStyle(
                    //       fontSize: 14.0,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // DataCell(
                    //   Text(
                    //     farmer.ifsc_code!,
                    //     style: TextStyle(
                    //       fontSize: 14.0,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    DataCell(
                      Text(
                        farmer.created_at!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        farmer.created_by!,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.info),
                        color: Colors.grey,
                        onPressed: () {
                          _selectedFarmer = farmer;
                          showAlertDialog(context);
                          // _showValues(farmer);
                          // // Set the Selected employee to Update
                          // setState(() {
                          //   _isUpdating = true;
                          // });
                        },
                      ),
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.grey,
                        alignment: Alignment.center,
                        onPressed: () {
                          //_selectedFarmer = farmer;
                          //showAlertDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
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
        backgroundColor: kPrimaryColour, // we show the progress in the title...
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     _createTable();
          //   },
          // ),
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            tooltip: 'Add new farmer',
            onPressed: () {
              Navigator.pushNamed(context, LandingPage.id);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            tooltip: 'Add new farmer',
            onPressed: () {
              Navigator.pushNamed(context, NewFarmer.id);
            },
          )
        ],
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //: Container(),
            Column(
              children: [
                Text(
                  'Farmer Profile',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: kPrimaryColour,
                  ),
                ),
              ],
            ),
            Expanded(
              child: _dataBody(),
            ),
            // Padding(
            //   padding: EdgeInsets.all(20.0),
            //   child: TextField(
            //     controller: _mobileNbrController,
            //     decoration: InputDecoration.collapsed(
            //       hintText: 'Mobile Number',
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.all(20.0),
            //   child: TextField(
            //     controller: _createdByController,
            //     decoration: InputDecoration.collapsed(
            //       hintText: 'Changed By',
            //     ),
            //   ),
            // ),
            // Add an update button and a Cancel Button
            // show these buttons only when updating an employee
            // _isUpdating
            //     ? Row(
            //   children: <Widget>[
            //     OutlineButton(
            //       child: Text('UPDATE'),
            //       onPressed: () {
            //         _updateFarmer(_selectedFarmer);
            //       },
            //     ),
            //     OutlineButton(
            //       child: Text('CANCEL'),
            //       onPressed: () {
            //         setState(() {
            //           _isUpdating = false;
            //         });
            //         _clearValues();
            //       },
            //     ),
            //   ],
          ],
        ),
      ),
    );
  }

  showDetails(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text(_selectedFarmer!.farmer_id.toString()),
          Text(_selectedFarmer!.farmer_id.toString()),
          Text(_selectedFarmer!.farmer_id.toString()),
          Text(_selectedFarmer!.farmer_id.toString()),
          Text(_selectedFarmer!.farmer_id.toString()),
        ],
      ),
    );
  }
}
