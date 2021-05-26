import 'package:flutter/material.dart';
import 'package:khata_dari/Screens/new_farmer_page.dart';
import '../Brains/farmer_profile.dart';
import '../Brains/Services.dart';

class ViewFarmer extends StatefulWidget {
  //
  ViewFarmer() : super();
  static const String id = 'viewfarmer_page';

  final String title = 'Muneer Mango Centre';

  @override
  ViewFarmerState createState() => ViewFarmerState();
}

class ViewFarmerState extends State<ViewFarmer> {
  List<Farmer> _farmers;
  GlobalKey<ScaffoldState> _scaffoldKey;
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

  //Farmer _selectedFarmer;
  //bool _isUpdating;
  String _titleProgress;

  @override
  void initState() {
    super.initState();
    _farmers = [];
    //_isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    // _fullNameController = TextEditingController();
    // _fatherNameController = TextEditingController();
    // _cityNameController = TextEditingController();
    // _pincodeController = TextEditingController();
    // _districtNameController = TextEditingController();
    // _stateNameController = TextEditingController();
    // _mobileNbrController = TextEditingController();
    // _phoneNbrController = TextEditingController();
    // _emailController = TextEditingController();
    // _govtIdController = TextEditingController();
    // _govtIdTypeController = TextEditingController();
    // _bankNameController = TextEditingController();
    // _bankAcctNbrController = TextEditingController();
    // _bankAcctTypeController = TextEditingController();
    // _ifscCodeController = TextEditingController();
    // _createdAtController = TextEditingController();
    // _createdByController = TextEditingController();
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
      print("Length ${farmers.length}");
    });
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


  // Method to clear TextField values
  // _clearValues() {
    // _fullNameController.text = '';
    // _fatherNameController.text = '';
    // _cityNameController.text = '';
    // _pincodeController.text = '';
    // _districtNameController.text = '';
    // _stateNameController.text = '';
    // _mobileNbrController.text = '';
    // _phoneNbrController.text = '';
    // _emailController.text = '';
    // _govtIdController.text = '';
    // _govtIdTypeController.text = '';
    // _bankNameController.text = '';
    // _bankAcctNbrController.text = '';
    // _bankAcctTypeController.text = '';
    // _ifscCodeController.text = '';
    // //_createdAtController.text = '';
    // //_createdByController.text = '';
  // }

  // _showValues(Farmer farmer) {

    // _fullNameController.text = farmer.full_name;
    // _fatherNameController.text = farmer.father_name;
    // _cityNameController.text = farmer.village_town_city;
    // _pincodeController.text = farmer.pincode;
    // _districtNameController.text = farmer.district;
    // _stateNameController.text = farmer.state_name;
    // _mobileNbrController.text = farmer.mobile_primary;
    // _phoneNbrController.text = farmer.phone_secondary;
    // _emailController.text = farmer.email;
    // _govtIdController.text = farmer.govt_id_nbr;
    // _govtIdTypeController.text = farmer.govt_id_type;
    // _bankNameController.text = farmer.bank_name;
    // _bankAcctNbrController.text = farmer.bank_acct_nbr;
    // _bankAcctTypeController.text = farmer.bank_acct_type;
    // _ifscCodeController.text = farmer.ifsc_code;
    // _createdAtController.text = farmer.created_at;
    // _createdByController.text = farmer.created_by;
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
          columnSpacing: 20.0,
          showBottomBorder: true,
          //headingRowColor: MaterialStateColor.resolveWith((states) => Colors.pink[50]),
          headingTextStyle: TextStyle(
            color: Colors.pink,
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
              label: Text('ALTERNATE NUMBER'),
            ),
            DataColumn(
              label: Text('EMAIL'),
            ),
            DataColumn(
              label: Text('GOVT ID NBR'),
            ),
            DataColumn(
              label: Text('GOVT ID TYPE'),
            ),
            DataColumn(
              label: Text('BANK NAME'),
            ),
            DataColumn(
              label: Text('ACCOUNT NUMBER'),
            ),
            DataColumn(
              label: Text('ACCOUNT TYPE'),
            ),
            DataColumn(
              label: Text('IFSC CODE'),
            ),
            DataColumn(
              label: Text('CHANGED AT'),
            ),
            DataColumn(
              label: Text('CREATED BY'),
            ),
            // Lets add one more column to show a delete button
            DataColumn(
              label: Text('MODIFY'),
             )
          ],
          rows: _farmers
              .map(
                (farmer) => DataRow(cells: [
                  DataCell(
                    Text(farmer.farmer_id),
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
                      farmer.full_name,
                    ),
                    // onTap: () {
                    //   _showValues(farmer);
                    //   // Set the Selected employee to Update
                    //   _selectedFarmer = farmer;
                    //   // Set flag updating to true to indicate in Update Mode
                    //   setState(() {
                    //     _isUpdating = true;
                    //   });
                    // },
                  ),
                  DataCell(
                    Text(
                      farmer.father_name,
                    ),
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
                      farmer.village_town_city,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.pincode,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.district,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.state_name,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.mobile_primary,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.phone_secondary,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.email,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.govt_id_nbr,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.govt_id_type,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.bank_name,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.bank_acct_nbr,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.bank_acct_type,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.ifsc_code,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.created_at,
                    ),
                  ),
                  DataCell(
                    Text(
                      farmer.created_by,
                    ),
                  ),
                  DataCell(IconButton(
                    icon: Icon(Icons.edit),
                          onPressed: () {
                            // _showValues(farmer);
                            // // Set the Selected employee to Update
                            // _selectedFarmer = farmer;
                            // setState(() {
                            //   _isUpdating = true;
                            // });
                          },
                      ))
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
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     _createTable();
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.add,semanticLabel: 'Add new farmer',color: Colors.white,),
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
                color: Colors.pink,
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
}