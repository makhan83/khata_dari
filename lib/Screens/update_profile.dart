import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_dari/Brains/Services.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import '../Brains/farmer_model.dart';
import 'view_profile_page.dart';


class UpdateFarmer extends StatefulWidget {
  const UpdateFarmer({Key? key}) : super(key: key);

  static const String id = 'updatefarmer_page';

  final String title = 'Muneer Mango Centre';

  @override
  _UpdateFarmerState createState() => _UpdateFarmerState();
}

class _UpdateFarmerState extends State<UpdateFarmer> {

  List<FarmerModel>? _farmers;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  TextEditingController? _fullNameController;
  TextEditingController? _fatherNameController;
  TextEditingController? _cityNameController;
  TextEditingController? _pincodeController;
  TextEditingController? _districtNameController;
  TextEditingController? _stateNameController;
  TextEditingController? _mobileNbrController;
  TextEditingController? _phoneNbrController;
  TextEditingController? _emailController;
  TextEditingController? _govtIdController;
  TextEditingController? _govtIdTypeController;
  TextEditingController? _bankNameController;
  TextEditingController? _bankAcctNbrController;
  TextEditingController? _bankAcctTypeController;
  TextEditingController? _ifscCodeController;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  List<FarmerModel>? _selectedFarmer  ;
  bool _isUpdating = false;
  late String _titleProgress;

  @override
  void initState() {
    super.initState();
    //_farmers = [];
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

  // _updateFarmerRecord() {
  //
  //   _showProgress('Adding Farmer Profile...');
  //   Services.updateFarmer(
  //       //_selectedFarmer!.farmer_id,
  //       _fullNameController!.text,
  //       _fatherNameController!.text,
  //       _cityNameController!.text,
  //       _pincodeController!.text,
  //       _districtNameController!.text,
  //       _stateNameController!.text,
  //       _mobileNbrController!.text,
  //       _phoneNbrController!.text,
  //       _emailController!.text,
  //       _govtIdController!.text,
  //       _govtIdTypeController!.text,
  //       _bankNameController!.text,
  //       _bankAcctNbrController!.text,
  //       _bankAcctTypeController!.text,
  //       _ifscCodeController!.text)
  //       .then((result) {
  //     if ('success' == result) {
  //     print('Row updated successfully');
  //     String showMsg1 =  'Farmer ID :  Updated successfully !';
  //     showAlertDialog(context, showMsg1);
  //     _clearValues();
  //     }
  //   });
  // }

  showAlertDialog(BuildContext context, String msg) {
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
        'Message',
        style: TextStyle(
          color: Colors.pink,
          fontSize: 16.0,
        ),
      ),
      content: Text(msg),
      actions: [ okButton,],
    );

    // show the dialog
    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    },
    );
  }


  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _clearValues() {
    _fullNameController!.text = '';
    _fatherNameController!.text = '';
    _cityNameController!.text = '';
    _pincodeController!.text = '';
    _districtNameController!.text = '';
    _stateNameController!.text = '';
    _mobileNbrController!.text = '';
    _phoneNbrController!.text = '';
    _emailController!.text = '';
    _govtIdController!.text = '';
    _govtIdTypeController!.text = '';
    _bankNameController!.text = '';
    _bankAcctNbrController!.text = '';
    _bankAcctTypeController!.text = '';
    _ifscCodeController!.text = '';
  }

  _showValues(FarmerModel farmer) {

    _fullNameController!.text = farmer.fullName!;
    _fatherNameController!.text = farmer.fatherName!;
    _cityNameController!.text = farmer.villageTownCityName!;
    _pincodeController!.text = farmer.pincode!;
    _districtNameController!.text = farmer.district!;
    _stateNameController!.text = farmer.stateName!;
    _mobileNbrController!.text = farmer.mobilePrimary!;
    _phoneNbrController!.text = farmer.phoneSecondary!;
    _emailController!.text = farmer.email!;
    _govtIdController!.text = farmer.govtIdNbr!;
    _govtIdTypeController!.text = farmer.govtIdType!;
    _bankNameController!.text = farmer.bankName!;
    _bankAcctNbrController!.text = farmer.bankAcctNbr!;
    _bankAcctTypeController!.text = farmer.bankAcctType!;
    _ifscCodeController!.text = farmer.ifscCode!;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text(_titleProgress),
      //   backgroundColor: kPrimaryColour, // we show the progress in the title...
      //   actions: <Widget>[
      //     // IconButton(
      //     //   icon: Icon(Icons.add),
      //     //   onPressed: () {
      //     //     _createTable();
      //     //   },
      //     // ),
      //     IconButton(
      //       icon: Icon(Icons.home),
      //       onPressed: () {
      //         Navigator.pushNamed(context, LandingPage.id);
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.arrow_back),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     )
      //   ],
      // ),
      // drawer: Drawer(
      //     child: Scaffold(
      //         appBar: AppBar(
      //             elevation: 0.0,
      //             title: Text("Menu"),
      //             backgroundColor: kPrimaryColour),
      //         body: Column(children: <Widget>[
      //           ListTile(title: Text("Dashboard")),
      //           ListTile(title: Text("Arrivals")),
      //           ListTile(title: Text("Sales")),
      //           ListTile(title: Text("Ledger and Accounts")),
      //           ListTile(title: Text("Payments")),
      //           ListTile(title: Text("Profiles")),
      //           ListTile(title: Text("Log Out")),
      //         ]))),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Add New Farmer Profile',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: kPrimaryColour,
                ),
              ),
            ),
            Container(
              width: 600.0,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey1,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: _fullNameController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person),
                              hintText: 'Enter the full name',
                              labelText: 'Name',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _mobileNbrController,
                            decoration: const InputDecoration(
                              hintText: 'Enter the mobile number',
                              labelText: 'Mobile Number',
                              icon: Icon(Icons.phone_iphone),
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _cityNameController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.location_city),
                              hintText: 'Enter the city name',
                              labelText: 'Village/Town/City',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _districtNameController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.tour),
                              hintText: 'Enter the district name',
                              labelText: 'District',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _govtIdTypeController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.badge),
                              hintText: 'Enter the ID Card Name',
                              labelText: 'ID Card',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _bankNameController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.account_balance),
                              hintText: 'Enter the Bank Name',
                              labelText: 'Bank Name',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _bankAcctNbrController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.confirmation_number),
                              hintText: 'Enter Bank Account Number',
                              labelText: 'Bank Account Number',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.email),
                              hintText: 'Enter the email address',
                              labelText: 'Email ID',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey2,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: _fatherNameController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person),
                              hintText: 'Enter the father\'s name',
                              labelText: 'Father Name',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _phoneNbrController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.contact_phone),
                              hintText: 'Enter the alternate phone number',
                              labelText: 'Phone Number',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _pincodeController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.push_pin),
                              hintText: 'Enter the pincode',
                              labelText: 'Pincode',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _stateNameController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.flag),
                              hintText: 'Enter the state',
                              labelText: 'State',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _govtIdController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.fingerprint),
                              hintText: 'Enter the ID Number',
                              labelText: 'ID Number',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _bankAcctTypeController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.business_center),
                              hintText: 'Enter the Account Type',
                              labelText: 'Account Type',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _ifscCodeController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.tag),
                              hintText: 'Enter the IFSC Code',
                              labelText: 'IFSC Code',
                              hintStyle: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Expanded(
              child: Container(
                width: 600.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Material(
                            borderRadius: BorderRadius.circular(5.0),
                            color: kPrimaryColour,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey1.currentState!.validate() || _formKey2.currentState!.validate())
                                {
                                  //_addFarmer();
                                }
                                //Navigator.pushNamed(context, ViewFarmer.id);
                              },
                              // minWidth: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Icon(Icons.save),
                                  SizedBox(width: 4.0,),
                                  Text(
                                    "Submit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0,),
                    Container(
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Material(
                            borderRadius: BorderRadius.circular(5.0),
                            color: kPrimaryColour,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ViewProfile.id);
                              },
                              // minWidth: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Icon(Icons.remove_red_eye),
                                  SizedBox(width: 4.0,),
                                  Text(
                                    " View ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
