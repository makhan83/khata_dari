import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Brains/Services.dart';
import '../Brains/constants.dart';
import '../Screens/landingpage.dart';
import '../Screens/view_profile_page.dart';
import '../Brains/state_model.dart';


class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  static const String id = 'addprofile_page';

  final String title = 'Muneer Mango Centre';



  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  //List<Farmer>? _farmers;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  /// Farmer Profile
  TextEditingController? _fullNameController;
  TextEditingController? _fatherNameController;
  TextEditingController? _cityNameController;
  TextEditingController? _pincodeFarmerController;
  TextEditingController? _districtNameController;
  TextEditingController? _stateNameController;
  TextEditingController? _mobileNbrController;
  TextEditingController? _phoneNbrController;
  TextEditingController? _emailFarmerController;
  TextEditingController? _govtIdController;
  TextEditingController? _govtIdTypeController;
  TextEditingController? _bankNameController;
  TextEditingController? _bankAcctNbrController;
  TextEditingController? _bankAcctTypeController;
  TextEditingController? _ifscCodeController;
  /// Buyer profile
  TextEditingController? _companyNameController;
  TextEditingController? _propNameController;
  TextEditingController? _addrLine1Controller;
  TextEditingController? _addrLine2Controller;
  TextEditingController? _cityController;
  TextEditingController? _districtBuyerController;
  TextEditingController? _addrStateController;
  TextEditingController? _pincodeBuyerController;
  TextEditingController? _phoneMainController;
  TextEditingController? _phoneOtherController;
  TextEditingController? _emailBuyerController;
  TextEditingController? _contactName1Controller;
  TextEditingController? _contactNbr1Controller;
  TextEditingController? _contactName2Controller;
  TextEditingController? _contactNbr2Controller;


  ///Labour Group profile
  TextEditingController? _nameController;
  TextEditingController? _mobileController;
  TextEditingController? _groupSizeController;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //_farmers = [];
    //_isUpdating = false;
    //_titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    ///Farmer Controllers
    _fullNameController = TextEditingController();
    _fatherNameController = TextEditingController();
    _cityNameController = TextEditingController();
    _pincodeFarmerController = TextEditingController();
    _districtNameController = TextEditingController();
    _stateNameController = TextEditingController();
    _mobileNbrController = TextEditingController();
    _phoneNbrController = TextEditingController();
    _emailFarmerController = TextEditingController();
    _govtIdController = TextEditingController();
    _govtIdTypeController = TextEditingController();
    _bankNameController = TextEditingController();
    _bankAcctNbrController = TextEditingController();
    _bankAcctTypeController = TextEditingController();
    _ifscCodeController = TextEditingController();
    ///Buyer Controllers
    _companyNameController = TextEditingController();
    _propNameController = TextEditingController();
    _addrLine1Controller = TextEditingController();
    _addrLine2Controller = TextEditingController();
    _cityController = TextEditingController();
    _districtBuyerController = TextEditingController();
    _addrStateController = TextEditingController();
    _pincodeBuyerController = TextEditingController();
    _phoneMainController = TextEditingController();
    _phoneOtherController = TextEditingController();
    _contactName1Controller = TextEditingController();
    _contactNbr1Controller = TextEditingController();
    _contactName2Controller = TextEditingController();
    _contactNbr2Controller = TextEditingController();
    _emailBuyerController = TextEditingController();
    ///Labour Group Controllers
    _nameController = TextEditingController();
    _mobileController = TextEditingController();
    _groupSizeController = TextEditingController();
  }

  _addFarmer() {
    _showProgress('Adding Farmer Profile...');
    Services.addFarmer(
            _fullNameController!.text,
            _fatherNameController!.text,
            _cityNameController!.text,
            _pincodeFarmerController!.text,
            _districtNameController!.text,
            _stateNameController!.text,
            _mobileNbrController!.text,
            _phoneNbrController!.text,
            _emailFarmerController!.text,
            _govtIdController!.text,
            _govtIdTypeController!.text,
            _bankNameController!.text,
            _bankAcctNbrController!.text,
            _bankAcctTypeController!.text,
            _ifscCodeController!.text)
        .then((result) {
      //if ('success' == result) {
        print('Row inserted successfully');
        result = result.padLeft(4,'0');
        String showMsg1 =  'New Farmer ID : F' + result + ' created successfully !';
        showAlertDialog(context, showMsg1);
        _clearFarmerValues();
      //}
    });
  }

  _addBuyer() {
    _showProgress('Adding Buyer Profile...');
    Services.addBuyer(
        _companyNameController!.text,
        _propNameController!.text,
        _addrLine1Controller!.text,
        _addrLine2Controller!.text,
        _cityController!.text,
        _pincodeBuyerController!.text,
        _districtBuyerController!.text,
        _addrStateController!.text,
        _phoneMainController!.text,
        _phoneOtherController!.text,
        _emailBuyerController!.text,
        _contactName1Controller!.text,
        _contactNbr1Controller!.text,
        _contactName2Controller!.text,
        _contactNbr2Controller!.text
       ).then((result) {
      //if ('success' == result) {
      print('Row inserted successfully');
      result = result.padLeft(4,'0');
      String showMsg1 =  'New Buyer ID : B' + result + ' created successfully !';
      showAlertDialog(context, showMsg1);
      _clearBuyerValues();
      //}
        }
      );
  }

  _addLabourProfile()
  {

    print('${_nameController!.text}');
    print('${_mobileController!.text}');
    print('${_groupSizeController!.text}');

    Services.addLabourGroup(_nameController!.text, _mobileController!.text, _groupSizeController!.text).then((result)
        {
          if(result == 'success')
            {
              print('Row inserted successfully');
              result = result.padLeft(4,'0');
              String showMsg1 =  'New Farmer ID : G' + result + ' created successfully !';
              showAlertDialog(context, showMsg1);
            }
        });
  }

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
          color: kPrimaryColour,
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
     // _titleProgress = message;
    });
  }

  _clearFarmerValues() {
    _fullNameController!.text = '';
    _fatherNameController!.text = '';
    _cityNameController!.text = '';
    _pincodeFarmerController!.text = '';
    _districtNameController!.text = '';
    _stateNameController!.text = '';
    _mobileNbrController!.text = '';
    _phoneNbrController!.text = '';
    _emailFarmerController!.text = '';
    _govtIdController!.text = '';
    _govtIdTypeController!.text = '';
    _bankNameController!.text = '';
    _bankAcctNbrController!.text = '';
    _bankAcctTypeController!.text = '';
    _ifscCodeController!.text = '';
  }

  _clearBuyerValues() {
    _companyNameController!.text = '';
    _propNameController!.text = '';
    _addrLine1Controller!.text = '';
    _addrLine2Controller!.text = '';
    _cityController!.text = '';
    _districtBuyerController!.text = '';
    _addrStateController!.text = '';
    _pincodeBuyerController!.text = '';
    _phoneMainController!.text = '';
    _phoneOtherController!.text = '';
    _contactName1Controller!.text = '';
    _contactNbr1Controller!.text = '';
    _contactName2Controller!.text = '';
    _contactNbr2Controller!.text = '';
    _emailBuyerController!.text = '';
  }

  static const List<StateName> _userOptions = <StateName>[
    StateName(stateName: 'Andhra Pradesh'),
    StateName(stateName: 'Karnataka'),
    StateName(stateName: 'TamilNadu'),
  ];

  static String _displayStringForOption(StateName option) => option.stateName;

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(kTitle),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Farmer '),
              Tab(text: 'Buyer'),
              Tab(text: 'Labour'),
            ],
          ),
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
        body: TabBarView(
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(flex:2,child: Container()),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'Add New Farmer Profile',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: kPrimaryColour,
                      ),
                    ),
                  ),
                  Expanded(flex:2,child: Container()),
                ],
              ),
              Expanded(
                flex:10,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex:2,child: Container()),
                      Form(
                        key: _formKey1,
                        child: Expanded(
                          flex:3,
                          child: SingleChildScrollView(
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
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    icon: Icon(Icons.phone_iphone),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _bankNameController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.account_balance),
                                    hintText: 'Enter the Bank Name',
                                    labelText: 'Bank Name',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _bankAcctNbrController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.confirmation_number),
                                    hintText: 'Enter Bank Account Number',
                                    labelText: 'Bank Account Number',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _emailFarmerController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.email),
                                    hintText: 'Enter the email address',
                                    labelText: 'Email ID',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey2,
                        child: Expanded(
                          flex:3,
                          child: SingleChildScrollView(
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
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _pincodeFarmerController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.push_pin),
                                    hintText: 'Enter the pincode',
                                    labelText: 'Pincode',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right:14.0),
                                      child: Icon(Icons.flag,color: Colors.grey,),
                                    ),
                                    Expanded(
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(maxWidth: 350.0),
                                        child: Container(
                                          child: Autocomplete<StateName>(
                                            displayStringForOption: _displayStringForOption,
                                            optionsBuilder: (TextEditingValue textEditingValue) {
                                              if (textEditingValue.text == '') {
                                                return const Iterable<StateName>.empty();
                                              }
                                              return _userOptions.where((StateName option) {
                                                return option.toString().toLowerCase().contains(textEditingValue.text.toLowerCase());
                                              });
                                            },
                                            onSelected: (StateName selection) {
                                              _stateNameController!.text = _displayStringForOption(selection);
                                              print('You just selected ${_displayStringForOption(selection)}');
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // TextFormField(
                                //   controller: _stateNameController,
                                //   decoration: const InputDecoration(
                                //     icon: const Icon(Icons.flag),
                                //     hintText: 'Enter the state',
                                //     labelText: 'State',
                                //     labelStyle: TextStyle(
                                //       fontSize: 10.0,
                                //     ),
                                //     hintStyle: TextStyle(
                                //       fontSize: 8.0,
                                //     ),
                                //   ),
                                //   validator: (value) {
                                //     if (value!.isEmpty) {
                                //       return 'Please enter some text';
                                //     }
                                //     return null;
                                //   },
                                // ),
                                TextFormField(
                                  controller: _govtIdController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.fingerprint),
                                    hintText: 'Enter the ID Number',
                                    labelText: 'ID Number',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _bankAcctTypeController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.business_center),
                                    hintText: 'Enter the Account Type',
                                    labelText: 'Account Type',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _ifscCodeController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.tag),
                                    hintText: 'Enter the IFSC Code',
                                    labelText: 'IFSC Code',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex:2,child: Container()),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(flex:2,child: Container()),
                      Expanded(
                        child: Container(
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
                                    Icon(Icons.save,color: kIconColour,),
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
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(5.0),
                              color: kPrimaryColour,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {
                                  //Navigator.pushNamed(context, ViewFarmer.id);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => ViewProfile(2)));
                                },
                                // minWidth: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Icon(Icons.remove_red_eye,color: kIconColour,),
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
                      Expanded(flex:2,child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(flex:2,child: Container()),
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Add New Buyer Profile',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: kPrimaryColour,
                        ),
                      ),
                    ),
                    Expanded(flex:2,child: Container()),
                  ],
                ),
                Expanded(
                  flex:10,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex:2,child: Container()),
                        Form(
                          key: _formKey3,
                          child: Expanded(
                            flex:3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  controller: _companyNameController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.business),
                                    hintText: 'Enter the company name',
                                    labelText: 'Company Name',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                  controller: _phoneMainController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.phone_iphone),
                                    hintText: 'Enter the phone number',
                                    labelText: 'Main Phone Number',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                  controller: _addrLine1Controller,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter the address',
                                    labelText: 'Address Line 1',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    icon: Icon(Icons.home),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _cityController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.location_city),
                                    hintText: 'Enter the city name',
                                    labelText: 'City',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                  controller: _addrStateController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.tour),
                                    hintText: 'Enter the State name',
                                    labelText: 'State',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                  controller: _contactName1Controller,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.person),
                                    hintText: 'Enter Contact Name',
                                    labelText: 'Contact Name 1',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _contactName2Controller,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.person),
                                    hintText: 'Enter Contact Name',
                                    labelText: 'Contact Name 2',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _emailBuyerController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.email),
                                    hintText: 'Enter the email',
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey4,
                          child: Expanded(
                            flex:3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  controller: _propNameController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.person),
                                    hintText: 'Enter the proprietor name',
                                    labelText: 'Proprietor Name',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                  controller: _phoneOtherController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.contact_phone),
                                    hintText: 'Enter the Other Phone Number',
                                    labelText: 'Alternate Number',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _addrLine2Controller,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.menu),
                                    hintText: 'Address line 2',
                                    labelText: 'Address Line 2',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _districtBuyerController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.flag),
                                    hintText: 'Enter the district name',
                                    labelText: 'District',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                  controller: _pincodeBuyerController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.push_pin),
                                    hintText: 'Enter the pincode',
                                    labelText: 'Pincode',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                  controller: _contactNbr1Controller,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.phone),
                                    hintText: 'Enter the Number',
                                    labelText: 'Contact Phone Number',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _contactNbr2Controller,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.phone),
                                    hintText: 'Enter the number',
                                    labelText: 'Contact Phone Number',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(flex:2,child: Container()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex:2,child: Container()),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
                                color: kPrimaryColour,
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (_formKey3.currentState!.validate() || _formKey4.currentState!.validate())
                                    {
                                      _addBuyer();
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.save,color: kIconColour,),
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
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
                                color: kPrimaryColour,
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    //Navigator.pushNamed(context, ViewFarmer.id);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ViewProfile(2)));
                                  },
                                  // minWidth: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Icon(Icons.remove_red_eye,color: kIconColour,),
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
                        Expanded(flex:2,child: Container()),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(flex:2,child: Container()),
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Add New Labour Profile',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: kPrimaryColour,
                        ),
                      ),
                    ),
                    Expanded(flex:2,child: Container()),
                  ],
                ),
                Expanded(
                  flex:1,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex:2,child: Container()),
                        Form(
                          key: _formKey5,
                          child: Expanded(
                            flex:3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.person),
                                    hintText: 'Enter the leader name',
                                    labelText: 'Group Name',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                  controller: _mobileController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter the mobile number',
                                    labelText: 'Mobile Number',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    icon: Icon(Icons.phone_iphone),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
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
                                  controller: _groupSizeController,
                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.group),
                                    hintText: 'Enter the group size',
                                    labelText: 'Group Size',
                                    labelStyle: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 8.0,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),

                              ],
                            ),
                          ),
                        ),

                        Expanded(flex:2,child: Container()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex:2,child: Container()),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
                                color: kPrimaryColour,
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (_formKey5.currentState!.validate())
                                    {
                                      _addLabourProfile();
                                    }
                                    //Navigator.pushNamed(context, ViewFarmer.id);
                                  },
                                  // minWidth: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Icon(Icons.save,color: kIconColour,),
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
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
                                color: kPrimaryColour,
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    //Navigator.pushNamed(context, ViewFarmer.id);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ViewProfile(3)));
                                  },
                                  // minWidth: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Icon(Icons.remove_red_eye,color: kIconColour,),
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
                        Expanded(flex:2,child: Container()),
                      ],
                    ),
                  ),
                ),

              ],
            ),
        ],
        ),
      ),
    );
  }
}
