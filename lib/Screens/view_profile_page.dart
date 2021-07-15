import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Brains/constants.dart';
import '../Screens/landingpage.dart';
import '../Screens/new_profile_page.dart';
import '../Brains/Services.dart';
import '../Brains/farmer_model.dart';


class ViewProfile extends StatefulWidget {
  final int selectedPage;
  ViewProfile(this.selectedPage) : super();
  static const String id = 'viewprofile_page';
  final String title = 'Muneer Mango Centre';


  @override
  ViewProfileState createState() => ViewProfileState(selectedPage);
}

class ViewProfileState extends State<ViewProfile> {
  int tabPage;
  ViewProfileState(this.tabPage);
  List<FarmerModel>? _farmers;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  FarmerModel? _selectedFarmer;
  //bool _isUpdating;
  //String _titleProgress;
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
  String? _farmerId = '';
  String? _fullName = '';
  String? _fatherName = '';
  String? _cityName = '';
  String? _pinCode = '';
  String? _districtName = '';
  String? _stateName = '';
  String? _mobileNbr = '';
  String? _phoneNbr = '';
  String? _emailName = '';
  String? _idNbr = '';
  String? _idName = '';
  String? _bankName = '';
  String? _acctType = '';
  String? _acctNbr = '';
  String? _ifscCode = '';
  int _limit = 8;
  int _offset = 0;
  //int _farmerCount =0;
  int _lastOffset = 0;
  bool _lastPage = false;




  //int _totalLength = 0;

  @override
  void initState() {
    super.initState();
    _farmers = [];
    //_isUpdating = false;
    //_titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _getLength();
    _getFarmers();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    //myController.dispose();
    _fullNameController!.dispose();
    _fatherNameController!.dispose();
    _cityNameController!.dispose();
    _pincodeController!.dispose();
    _districtNameController!.dispose();
    _stateNameController!.dispose();
    _mobileNbrController!.dispose();
    _phoneNbrController!.dispose();
    _emailController!.dispose();
    _govtIdController!.dispose();
    _govtIdTypeController!.dispose();
    _bankNameController!.dispose();
    _bankAcctNbrController!.dispose();
    _bankAcctTypeController!.dispose();
    _ifscCodeController!.dispose();
    super.dispose();
  }
  // Method to update title in the AppBar Title
  _showProgress(String message) {
    setState(() {
      //_titleProgress = message;
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
    String off = _offset.toString();
    String lim = _limit.toString();
    print('Offset : $off ');
    Services.getFarmers(off,lim).then((farmers) {
      setState(() {
        _farmers = farmers;
      });
      _showProgress(widget.title); // Reset the title...
      //print("Length ${farmers!.length}");
    });
  }

  _getLength() {

    Services.getLength().then((data) {

      int totalRows = int.parse(data);
      int offset = (totalRows/_limit).floor() * _limit;

      if(totalRows.remainder(_limit) == 0)
        {
          offset = ((totalRows/_limit).floor() -1) * _limit;
        }

      print('Farmer count : $totalRows Last Offset: $offset' );

      setState(() {
        //_farmerCount = totalRows;
        _lastOffset = offset;
      });
      //print("Length : $_farmerCount");
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
          color: kPrimaryColour,
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
                  _selectedFarmer!.phoneSecondary.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: kTableTextColour,
              ),
            ),
            Text(
              'Email ID : ' + _selectedFarmer!.email.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: kTableTextColour,
              ),
            ),
            Text(
              'ID Card : ' + _selectedFarmer!.govtIdType.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: kTableTextColour,
              ),
            ),
            Text(
              'ID Number : ' + _selectedFarmer!.govtIdNbr.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: kTableTextColour,
              ),
            ),
            Divider(),
            Text(
              'Bank Details',
              style: TextStyle(
                fontSize: 12.0,
                color: kPrimaryColour,
              ),
            ),
            Text(
              'Bank Name : ' + _selectedFarmer!.bankName.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: kTableTextColour,
              ),
            ),
            Text(
              'Account Type : ' + _selectedFarmer!.bankAcctType.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: kTableTextColour,
              ),
            ),
            Text(
              'Account Number : ' + _selectedFarmer!.bankAcctNbr.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: kTableTextColour,
              ),
            ),
            Text(
              'IFSC Code : ' + _selectedFarmer!.ifscCode.toString(),
              style: TextStyle(
                fontSize: 12.0,
                color: kTableTextColour,
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
    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    },
    );
  }

  showAlertDialog1(BuildContext context) {
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

      content: Text('Record updated successfully'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(context: context, builder: (BuildContext context) {
      return alert;
    },
    );
  }

  _updateFarmer() {
    //_showProgress('Updating Farmer Profile...');
    Services.updateFarmer(_farmerId, _fullName!,_fatherName!,_cityName!,_pinCode! , _districtName!, _stateName!,_mobileNbr!,_phoneNbr!,
        _emailName!,_idNbr!,_idName!,_bankName!,_acctType!,_acctNbr!,_ifscCode!) //, _createdAtController.text,_createdByController.text)
        .then((result) {
      if ('success' == result) {
        print('update successful');

        _getFarmers();// Refresh the list after update
        showAlertDialog1(context);

        //_clearValues();
      }
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
          columnSpacing: 10.0,
          showBottomBorder: true,
          dataRowHeight: 30.0,
          //headingRowColor: MaterialStateColor.resolveWith((states) => kPrimaryColour[50]),
          headingTextStyle: TextStyle(
            color: kPrimaryColour,
          ),
          //dataRowColor: MaterialStateColor.resolveWith((states) => kTableTextColour),
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
              label: Text('LAST MODIFIED'),
            ),
            DataColumn(
              label: Text('CREATED BY'),
            ),
            DataColumn(
              label: Text('MORE'),
            ),
            DataColumn(
              label: Text('MODIFY'),
            ),
          ],
          rows: _farmers!
              .map(
                (farmer) => DataRow(
              cells: [
                DataCell(
                  Text(
                    farmer.farmerIdExt!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    farmer.fullName!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    farmer.fatherName!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    farmer.villageTownCityName!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    farmer.pincode!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    farmer.district!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    farmer.stateName!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    farmer.mobilePrimary!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    farmer.createdAt!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    farmer.createdBy!,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  IconButton(
                    icon: Icon(Icons.info),
                    iconSize: 15.0,
                    color: kTableTextColour,
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      _selectedFarmer = farmer;
                      showAlertDialog(context);
                    },
                  ),
                ),
                DataCell(
                  IconButton(
                    icon: Icon(Icons.edit),
                    color: kTableTextColour,
                    iconSize: 15.0,
                    alignment: Alignment.center,
                    onPressed: () {
                      setState(() {
                        _selectedFarmer = farmer;
                        _farmerId = _selectedFarmer!.farmerId;
                        _fullName = _selectedFarmer!.fullName;
                        _fatherName = _selectedFarmer!.fatherName;
                        _cityName = _selectedFarmer!.villageTownCityName;
                        _pinCode = _selectedFarmer!.pincode;
                        _districtName = _selectedFarmer!.district;
                        _stateName = _selectedFarmer!.stateName;
                        _mobileNbr = _selectedFarmer!.mobilePrimary;
                        _phoneNbr = _selectedFarmer!.phoneSecondary;
                        _emailName = _selectedFarmer!.email;
                        _idNbr = _selectedFarmer!.govtIdNbr;
                        _idName = _selectedFarmer!.govtIdType;
                        _bankName = _selectedFarmer!.bankName;
                        _acctType = _selectedFarmer!.bankAcctType;
                        _acctNbr = _selectedFarmer!.bankAcctNbr;
                        _ifscCode = _selectedFarmer!.ifscCode;
                      });

                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _updateFarmerRecord(context),
                      );

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
    return DefaultTabController(
      initialIndex: tabPage,
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(kTitle),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Farmer'),
              Tab(text: 'Buyer'),
              Tab(text: 'Labour Group'),
            ],
          ),
          backgroundColor: kPrimaryColour, // we show the progress in the title...
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              tooltip: 'Home',
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
                Navigator.pushNamed(context, NewProfile.id);
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
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'View Farmer Profile',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: kPrimaryColour,
                      ),
                    ),
                  ),
                  _dataBody(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Rows per page : $_limit'),
                          IconButton(
                            icon: Icon(
                              Icons.first_page,
                              color: kPrimaryColour,
                            ),
                            tooltip: 'First Page',
                            onPressed: () {
                              if(_offset != 0) {
                                setState(() {
                                  _offset = 0;
                                  _lastPage = false;
                                });
                                _getFarmers();
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              color: kPrimaryColour,
                            ),
                            tooltip: 'Previous Page',
                            onPressed: () {
                              setState(() {
                                _lastPage = false;
                                if(_offset >= _limit) {
                                  _offset = _offset - _limit;
                                  _getFarmers();}
                              });

                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: kPrimaryColour,
                            ),
                            tooltip: 'Next Page',
                            onPressed: () {
                              setState(() {

                                if(_offset < _lastOffset)
                                 {
                                   _offset = _offset + _limit;
                                   _getFarmers();
                                 }
                                if(_offset >= _lastOffset)
                                   {
                                     _lastPage = true;
                                   }

                              });



                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.last_page,
                              color: kPrimaryColour,
                            ),
                            tooltip: 'Last Page',
                            onPressed: () {
                              setState(() {
                                if(_lastPage == false) {
                                  _offset = _lastOffset;
                                  _lastPage = true;
                                  _getFarmers();
                                }
                              },
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ],
        ),




      ),
    );
  }


  Widget _updateFarmerRecord(BuildContext context) {

    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Update Farmer Profile',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: kPrimaryColour,
                ),
              ),
            ),
            Container(
              width: 600.0,
              padding: EdgeInsets.all(5.0),
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
                            initialValue: _selectedFarmer!.fullName,
                            onChanged: (value){
                              setState(() {
                                _fullName = value;
                                ////print('New value: $_fullName');
                              });

                            },
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
                            initialValue: _selectedFarmer!.mobilePrimary,
                            onChanged: (value){
                              setState(() {
                                _mobileNbr = value;
                                ////print('New value: $_mobileNbr');
                              });

                            },
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
                            initialValue: _selectedFarmer!.villageTownCityName,
                            onChanged: (value){
                              setState(() {
                                _cityName = value;
                                ////print('New value: $_cityName');
                              });

                            },
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
                            initialValue: _selectedFarmer!.district,
                            onChanged: (value){
                              setState(() {
                                _districtName = value;
                                ////print('New value: $_districtName');
                              });

                            },
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
                            initialValue: _selectedFarmer!.govtIdType,
                            onChanged: (value){
                              setState(() {
                                _idName = value;
                                //print('New value: $_idName');
                              });

                            },
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
                            initialValue: _selectedFarmer!.bankName,
                            onChanged: (value){
                              setState(() {
                                _bankName = value;
                                //print('New value: $_bankName');
                              });

                            },
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
                            initialValue: _selectedFarmer!.bankAcctNbr,
                            onChanged: (value){
                              setState(() {
                                _acctNbr = value;
                                //print('New value: $_acctNbr');
                              });

                            },
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
                            initialValue: _selectedFarmer!.email,
                            onChanged: (value){
                              setState(() {
                                _emailName = value;
                                //print('New value: $_emailName');
                              });

                            },
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
                            initialValue: _selectedFarmer!.fatherName,
                            onChanged: (value){
                              setState(() {
                                _fatherName = value;
                                //print('New value: $_fatherName');
                              });

                            },
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
                            initialValue: _selectedFarmer!.phoneSecondary,
                            onChanged: (value){
                              setState(() {
                                _phoneNbr = value;
                                //print('New value: $_phoneNbr');
                              });

                            },
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
                            initialValue: _selectedFarmer!.pincode,
                            onChanged: (value){
                              setState(() {
                                _pinCode = value;
                                //print('New value: $_pinCode');
                              });

                            },
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
                            initialValue: _selectedFarmer!.stateName,
                            onChanged: (value){
                              setState(() {
                                _stateName = value;
                                //print('New value: $_stateName');
                              });

                            },
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
                            initialValue: _selectedFarmer!.govtIdNbr,
                            onChanged: (value){
                              setState(() {
                                _idNbr = value;
                                //print('New value: $_idNbr');
                              });

                            },
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
                            initialValue: _selectedFarmer!.bankAcctType,
                            onChanged: (value){
                              setState(() {
                                _acctType = value;
                                //print('New value: $_acctType');
                              });

                            },
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
                            initialValue: _selectedFarmer!.ifscCode,
                            onChanged: (value){
                              setState(() {
                                _ifscCode = value;
                                //print('New value: $_ifscCode');
                              });

                            },
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
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:10.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(5.0),
                        color: kPrimaryColour,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey1.currentState!.validate() || _formKey2.currentState!.validate())
                            {
                              Navigator.pop(context);
                              _updateFarmer();
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
                                  color: kIconColour,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //SizedBox(width: 20.0,),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(5.0),
                        color: kPrimaryColour,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          // minWidth: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Icon(Icons.cancel,color: kIconColour,),
                              SizedBox(width: 4.0,),
                              Text(
                                " Cancel ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kIconColour,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
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
