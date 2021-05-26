import 'package:flutter/material.dart';
import 'package:khata_dari/Brains/Services.dart';
import 'package:khata_dari/Screens/view_farmer_page.dart';
import '../Brains/farmer_profile.dart';

class NewFarmer extends StatefulWidget {
  const NewFarmer({Key key}) : super(key: key);

  static const String id = 'addfarmer_page';

  final String title = 'Muneer Mango Centre';

  @override
  _NewFarmerState createState() => _NewFarmerState();
}

class _NewFarmerState extends State<NewFarmer> {
  List<Farmer> _farmers;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _fullNameController;
  TextEditingController _fatherNameController;
  TextEditingController _cityNameController;
  TextEditingController _pincodeController;
  TextEditingController _districtNameController;
  TextEditingController _stateNameController;
  TextEditingController _mobileNbrController;
  TextEditingController _phoneNbrController;
  TextEditingController _emailController;
  TextEditingController _govtIdController;
  TextEditingController _govtIdTypeController;
  TextEditingController _bankNameController;
  TextEditingController _bankAcctNbrController;
  TextEditingController _bankAcctTypeController;
  TextEditingController _ifscCodeController;

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
    _fullNameController = TextEditingController();
    _fatherNameController = TextEditingController();
    _cityNameController = TextEditingController();
    _pincodeController = TextEditingController();
    _districtNameController = TextEditingController();
    _stateNameController = TextEditingController();
    _mobileNbrController = TextEditingController();
    _phoneNbrController = TextEditingController();
    _emailController = TextEditingController();
    _govtIdController = TextEditingController();
    _govtIdTypeController = TextEditingController();
    _bankNameController = TextEditingController();
    _bankAcctNbrController = TextEditingController();
    _bankAcctTypeController = TextEditingController();
    _ifscCodeController = TextEditingController();
  }

  _addFarmer() {
    if (_fullNameController.text.isEmpty ||
        _fatherNameController.text.isEmpty ||
        _mobileNbrController.text.isEmpty ||
        _cityNameController.text.isEmpty) {
      print('Fill the required fields');
      return;
    }
    _showProgress('Adding Farmer Profile...');
    Services.addFarmer(
            _fullNameController.text,
            _fatherNameController.text,
            _cityNameController.text,
            _pincodeController.text,
            _districtNameController.text,
            _stateNameController.text,
            _mobileNbrController.text,
            _phoneNbrController.text,
            _emailController.text,
            _govtIdController.text,
            _govtIdTypeController.text,
            _bankNameController.text,
            _bankAcctNbrController.text,
            _bankAcctTypeController.text,
            _ifscCodeController.text)
        .then((result) {
      if ('success' == result) {
        print('Row inserted successfully');
        _clearValues();
      }
    });
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _clearValues() {
    _fullNameController.text = '';
    _fatherNameController.text = '';
    _cityNameController.text = '';
    _pincodeController.text = '';
    _districtNameController.text = '';
    _stateNameController.text = '';
    _mobileNbrController.text = '';
    _phoneNbrController.text = '';
    _emailController.text = '';
    _govtIdController.text = '';
    _govtIdTypeController.text = '';
    _bankNameController.text = '';
    _bankAcctNbrController.text = '';
    _bankAcctTypeController.text = '';
    _ifscCodeController.text = '';
  }
  // _showValues(Farmer farmer) {
  //
  //   _fullNameController.text = farmer.full_name;
  //   _fatherNameController.text = farmer.father_name;
  //   _cityNameController.text = farmer.village_town_city;
  //   _pincodeController.text = farmer.pincode;
  //   _districtNameController.text = farmer.district;
  //   _stateNameController.text = farmer.state_name;
  //   _mobileNbrController.text = farmer.mobile_primary;
  //   _phoneNbrController.text = farmer.phone_secondary;
  //   _emailController.text = farmer.email;
  //   _govtIdController.text = farmer.govt_id_nbr;
  //   _govtIdTypeController.text = farmer.govt_id_type;
  //   _bankNameController.text = farmer.bank_name;
  //   _bankAcctNbrController.text = farmer.bank_acct_nbr;
  //   _bankAcctTypeController.text = farmer.bank_acct_type;
  //   _ifscCodeController.text = farmer.ifsc_code;
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
        backgroundColor: Colors.pink, // we show the progress in the title...
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     _createTable();
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Add New Farmer Profile',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
                color: Colors.pink,
              ),
            ),
          ),
          Center(
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: TextField(
                            controller: _mobileNbrController,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.left,
                            decoration:
                                InputDecoration(labelText: "Mobile Number")),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: TextField(
                            controller: _fullNameController,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.left,
                            decoration:
                                InputDecoration(labelText: "Full Name")),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: TextField(
                          controller: _fatherNameController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            labelText: "Father Name",
                            labelStyle: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
          Center(
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _cityNameController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration:
                              InputDecoration(labelText: "Village/Town/City")),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _pincodeController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: "Pincode")),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _districtNameController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: "District")),
                    ),
                  ),
                ),
              ],
            )),
          ),
          Center(
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _stateNameController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: "State")),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _phoneNbrController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration:
                              InputDecoration(labelText: "Alternate Number")),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: "Email")),
                    ),
                  ),
                ),
              ],
            )),
          ),
          Center(
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _bankNameController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: "Bank Name")),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _bankAcctNbrController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              labelText: "Bank Account Number")),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _bankAcctTypeController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration:
                              InputDecoration(labelText: "Account Type")),
                    ),
                  ),
                ),
              ],
            )),
          ),
          Center(
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _ifscCodeController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: "IFSC Code")),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _govtIdController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration:
                              InputDecoration(labelText: "Govt ID Number")),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                          controller: _govtIdTypeController,
                          keyboardType: TextInputType.name,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(labelText: "ID Type")),
                    ),
                  ),
                ),
              ],
            )),
          ),
          SizedBox(height: 50.0),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Material(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.pink,
                elevation: 0.0,
                child: MaterialButton(
                  onPressed: () {
                    _addFarmer();
                    Navigator.pushNamed(context, ViewFarmer.id);
                  },
                  // minWidth: MediaQuery.of(context).size.width,
                  child: Text(
                    "Add Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
