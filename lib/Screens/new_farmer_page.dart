import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khata_dari/Brains/Services.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import 'package:khata_dari/Screens/view_farmer_page.dart';


class NewFarmer extends StatefulWidget {
  const NewFarmer({Key? key}) : super(key: key);

  static const String id = 'addfarmer_page';

  final String title = 'Muneer Mango Centre';

  @override
  _NewFarmerState createState() => _NewFarmerState();
}

class _NewFarmerState extends State<NewFarmer> {
  //List<Farmer>? _farmers;
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

  //Farmer _selectedFarmer;
  //bool _isUpdating;
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

  _addFarmer() {
    if (_fullNameController!.text.isEmpty ||
        _fatherNameController!.text.isEmpty ||
        _mobileNbrController!.text.isEmpty ||
        _cityNameController!.text.isEmpty) {
      print('Fill the required fields');
      return;
    }
    _showProgress('Adding Farmer Profile...');
    Services.addFarmer(
            _fullNameController!.text,
            _fatherNameController!.text,
            _cityNameController!.text,
            _pincodeController!.text,
            _districtNameController!.text,
            _stateNameController!.text,
            _mobileNbrController!.text,
            _phoneNbrController!.text,
            _emailController!.text,
            _govtIdController!.text,
            _govtIdTypeController!.text,
            _bankNameController!.text,
            _bankAcctNbrController!.text,
            _bankAcctTypeController!.text,
            _ifscCodeController!.text)
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
        backgroundColor: kPrimaryColour, // we show the progress in the title...
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     _createTable();
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, LandingPage.id);
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_back),
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
      body: Column(
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
          
          ///Comment TextFiled Code from here
          // Center(
          //   child: Container(
          //       child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: Padding(
          //           padding: EdgeInsets.all(8),
          //           child: Container(
          //             width: 300,
          //             child: Padding(
          //               padding: EdgeInsets.all(0.0),
          //               child: TextFormField(
          //                 controller: _mobileNbrController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(
          //                   labelText: "Mobile Number",
          //                   icon: Icon(Icons.phone_iphone),
          //                   hintText: 'Enter the mobile number',
          //                   hintStyle: TextStyle(
          //                     fontSize: 10.0,
          //                   ),
          //                 ),
          //                 validator: (value) {
          //                   if (value!.isEmpty) {
          //                     return 'Please enter some text';
          //                   }
          //                   return null;
          //                 },
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Padding(
          //           padding: EdgeInsets.all(8),
          //           child: Container(
          //             width: 300,
          //             child: Padding(
          //               padding: EdgeInsets.all(0.0),
          //               child: TextFormField(
          //                 controller: _fullNameController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(
          //                   labelText: "Name",
          //                   icon: Icon(Icons.person),
          //                   hintText: 'Enter the full name',
          //                   hintStyle: TextStyle(
          //                     fontSize: 10.0,
          //                   ),
          //                 ),
          //                 validator: (value) {
          //                   if (value!.isEmpty) {
          //                     return 'Please enter some text';
          //                   }
          //                   return null;
          //                 },
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Padding(
          //           padding: EdgeInsets.all(8),
          //           child: Container(
          //             width: 300,
          //             child: Padding(
          //               padding: EdgeInsets.all(0.0),
          //               child: TextField(
          //                 controller: _fatherNameController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(
          //                   labelText: "Father Name",
          //                   labelStyle: TextStyle(
          //                     fontSize: 15.0,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   )),
          // ),
          // Center(
          //   child: Container(
          //       child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _cityNameController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration:
          //                     InputDecoration(labelText: "Village/Town/City")),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _pincodeController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(labelText: "Pincode")),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _districtNameController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(labelText: "District")),
          //           ),
          //         ),
          //       ),
          //     ],
          //   )),
          // ),
          // Center(
          //   child: Container(
          //       child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _stateNameController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(labelText: "State")),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _phoneNbrController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration:
          //                     InputDecoration(labelText: "Alternate Number")),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _emailController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(labelText: "Email")),
          //           ),
          //         ),
          //       ),
          //     ],
          //   )),
          // ),
          // Center(
          //   child: Container(
          //       child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _bankNameController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(labelText: "Bank Name")),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _bankAcctNbrController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(
          //                     labelText: "Bank Account Number")),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _bankAcctTypeController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration:
          //                     InputDecoration(labelText: "Account Type")),
          //           ),
          //         ),
          //       ),
          //     ],
          //   )),
          // ),
          // Center(
          //   child: Container(
          //       child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _ifscCodeController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(labelText: "IFSC Code")),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _govtIdController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration:
          //                     InputDecoration(labelText: "Govt ID Number")),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.all(8),
          //         child: Container(
          //           width: 300,
          //           child: Padding(
          //             padding: EdgeInsets.all(0.0),
          //             child: TextField(
          //                 controller: _govtIdTypeController,
          //                 keyboardType: TextInputType.name,
          //                 textAlign: TextAlign.left,
          //                 decoration: InputDecoration(labelText: "ID Type")),
          //           ),
          //         ),
          //       ),
          //     ],
          //   )),
          // ),
          // SizedBox(height: 50.0),
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
                                _addFarmer();
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
                              Navigator.pushNamed(context, ViewFarmer.id);
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
    );
  }
}
