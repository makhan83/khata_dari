import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Others/show_ledger_new_page.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import '../Brains/Services.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../Brains/farmer_model.dart';
import '../Brains/currency_format.dart';
import 'package:khata_dari/Brains/group_model.dart';
//import '../Brains/numbers_to_words.dart';

class Arrivals extends StatefulWidget {
  //
  Arrivals() : super();
  static const String id = 'arrivals';

  final String title = 'Muneer Mango Centre';

  @override
  ArrivalsState createState() => ArrivalsState();
}

class ArrivalsState extends State<Arrivals> {
  //List<Ledger>? _ledger;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  //late String _titleProgress;
  //TextEditingController _iDController;
  //Dropdown declarations
  //List<Farmer>? _farmers;
  //List<FarmerModel?>? _farmers; // = DropFarmers.getDropFarmers();
  //List<DropdownMenuItem<Farmer>> _dropdownMenuItems;
  FarmerModel? _selectedFarmer;
  LabourGroup? _selectedGroup;

  // Default Radio Button Item
  //int _id = 1;
  //String _numtoWords = '';

  int _vehicleIndex = 0;
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController  _labourGang = TextEditingController();
  TextEditingController _nbrOfLoads = TextEditingController();
  TextEditingController _unloadingCharges = TextEditingController();
  final _amountPaid = MoneyMaskedTextController(
    leftSymbol: '₹ ',
    precision: 0,
    decimalSeparator: '',
    thousandSeparator: ',',
    initialValue: 0,
  );
  final _rent = MoneyMaskedTextController(
    leftSymbol: '₹ ',
    precision: 0,
    decimalSeparator: '',
    thousandSeparator: ',',
    initialValue: 0,
  );
  final DateFormat _formatter = DateFormat('dd-MMM-yyyy, EEEE');
  final DateFormat _formatter1 = DateFormat('yyyy-MM-dd');
  final _formKey = GlobalKey<FormState>();
  bool _isUnloaded = false;
  int _setFlex = 5;
  var _varietyList = ["Badami","Neelam","Totapari","Lal Bagh","Nati"];
  var _vehicleList = ["Lorry", "Tempo", "Tractor","Cart","Bags"];

  int _count = 0;
  int _finalCount = 0;
  var _selectedList = new List.filled(5,"ZZ");
  var _finalList = [];
  var _dateTime1 ;
  //int _setFlex1 = 3;
  // bool _isChecked1 = false;
  // bool _isChecked2 = false;
  // Color _setBorder = kPrimaryColour;

  @override
  void initState() {
    super.initState();
    //_farmers = [];
    //_isUpdating = false;
    //_titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _nbrOfLoads.text = '1';
    _dateCtl.text = _formatter.format(DateTime.now());
    _dateTime1 = _formatter1.format(DateTime.now());// key to get the context to show a SnackBar
    //_dateCtl.text = DateTime.now().toString();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    //myController.dispose();
    _dateCtl.dispose();
    _labourGang.dispose();
    _amountPaid.dispose();
    super.dispose();
  }

  // Method to update title in the AppBar Title
  // _showProgress(String message) {
  //   setState(() {
  //     //_titleProgress = message;
  //   });
  // }

  // _showSnackBar(context, message) {
  //   _scaffoldKey.currentState.showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  _postArrivals() {
    try {
      //_showProgress('Posting Transaction...');
      String unloading;
      _finalCount = _count;
      _finalList = _selectedList;
      _finalList.sort();


      // print('$_dateTime1');
      // // print('$arrivalDate');
      //
      //
      //
      //
      // print("$_finalList");
      // for(int i=0;i< _finalCount;i++)
      // {
      //   print("${_finalList[i]}");
      // }
      // print("${_vehicleList[_vehicleIndex]}");
      // print("${_nbrOfLoads.text}");
      // print("$_isUnloaded");
      // print("${_labourGang.text}");
      // print("${_unloadingCharges.text}");
      // print("${_amountPaid.text}");
      // print("${_rent.text}");
      // print("$_finalCount");
      // //print("$arrivalDate");
      // print("${_selectedFarmer!.farmer_id}");
      String cashPaid = _amountPaid.text;
      String rentPaid = _rent.text;
      String postLabourGroup = "";
      String postGroupId = "";
      String descriptionMsg = "";
      String creditAmount = "0";
      String debitAmount = "0";

      if(_isUnloaded)
        {
          unloading = "Yes";
          postLabourGroup = _selectedGroup!.leaderName.toString();
          postGroupId  = _selectedGroup!.groupId.toString();
          descriptionMsg = _vehicleList[_vehicleIndex] + ' Unload';
          creditAmount = '0';
          debitAmount = _unloadingCharges.text;
        }
      else {
        unloading = "No";
        postLabourGroup = '';
      }
      //print("$unloading");
      cashPaid = cashPaid.replaceAll(',', '').replaceAll('₹ ', '');
      rentPaid = rentPaid.replaceAll(',', '').replaceAll('₹ ', '');
      String postFarmerId = _selectedFarmer!.farmerId.toString();


      //print (_creditAmount);
      //String postFarmerId = _selectedFarmer!.farmer_id.toString();

      Services.postArrival(_dateTime1, postFarmerId, _finalCount.toString(),_vehicleList[_vehicleIndex],_nbrOfLoads.text,
                            rentPaid,cashPaid,unloading,_unloadingCharges.text,postLabourGroup)
          .then((result) {
        if ('error' != result) {
          print('Arrival entry added successfully : $result');
          for(int i=0; i< _finalCount;i++)
            {
              String variety =  _finalList[i];
              Services.postArrivalLot(result,variety).then((result1)
              {
                if(result1 != 'success')
                  {
                    print('Insert error');
                  }
              }
              );

            }
          String postRef = 'Arrival ID : ' + result;
          if(_isUnloaded) {
            Services.postTransaction(
                _dateTime1, postGroupId, descriptionMsg, postRef, debitAmount,
                creditAmount).then((result2) {
              if (result2 == 'success') {
                print('Labour Ledger entry added successfully');
              }
            }
            );
          }
          String showMsg = 'Transaction Posted successfully!';
          showAlertDialog(context, showMsg);
          //_clearValues();
        } else
          print('Query Errored out - came back here');
      });

      //_showProgress(widget.title); // Reset the title...
    } catch (e) {
      String showMsg1 = 'Select farmer name to proceed';
      showAlertDialog(context, showMsg1);
    }
  }

  // _clearValues() {
  //   _dateCtl.text = _formatter.format(DateTime.now());
  //   _amountPaid.text = '0';
  //   _labourGang.text = '';
  // }

  // _showList(){
  //   _finalCount = _count;
  //   _finalList = _selectedList;
  //   _finalList.sort();
  //   print("$_finalList");
  //   for(int i=0;i< _finalCount;i++)
  //     {
  //       print("${_finalList[i]}");
  //     }
  //   print("${_vehicleList[_vehicleIndex]}");
  //   print("${_nbrOfLoads.text}");
  //   print("$_isUnloaded");
  //   print("${_labourGang.text}");
  //   print("${_unloadingCharges.text}");
  //   print("${_amountPaid.text}");
  //   print("${_rent.text}");
  //   print("$_finalCount");
  //   print("${_dateCtl.text}");
  //   print("${_selectedFarmer!.farmer_id}");
  //
  //
  //
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //           builder: (BuildContext context) => super.widget));
  //
  //
  // }

  showAlertDialog(BuildContext context, String msg) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget));
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

  showAlertDialog1(BuildContext context, String msg) {
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

  // DataTable and show the farmer list in it.

  // UI
  @override
  Widget build(BuildContext context) {return (Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(kTitle),
        backgroundColor: kPrimaryColour, // we show the progress in the title...
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
            ),
            tooltip: 'Home',
            onPressed: () {
              Navigator.pushNamed(context, LandingPage.id);
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
      body: Padding(
        padding: const EdgeInsets.only(left: 250.0, right: 250.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 5.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ' Arrivals ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: kPrimaryColour,
                        ),
                      ),
                    ), //Ledger name
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Mangoes of '),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      //width: 350.0,
                      child: DropdownSearch<FarmerModel>(
                        popupTitle: Text('Search farmer name'),
                        showSelectedItem: true,
                        showSearchBox: true,
                        autoFocusSearchBox: true,
                        compareFn: (i, s) => i.isEqual(s),
                        hint: 'Enter farmer name',
                        label: "Select Farmer name",
                        //onFind: (filter) => _getFarmers(filter),
                        onFind: (filter) => Services().getFarmersFilter(filter),
                        onChanged: (data) {
                          //print(data);
                          setState(() {
                            _selectedFarmer = data;
                            //_getLedger();
                            //print(_selectedFarmer!.farmer_id);
                          });
                        },
                        // validator: (value) {
                        //     if (value! == null) {
                        //         return 'Please select the farmer name';
                        //         }
                        //         return null;
                        //         },

                        dropdownBuilder: _farmerDropDown,
                        popupItemBuilder: _farmerPopupBuilder,
                        popupSafeArea: PopupSafeArea(bottom: true),
                        mode: Mode.MENU,
                        showFavoriteItems: true,
                        favoriteItemsAlignment: MainAxisAlignment.start,
                        favoriteItems: (item) {
                          return item
                              .where((e) => e.fullName!.contains("Ay"))
                              .toList();
                        },
                        favoriteItemBuilder: (context, item) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey[900]),
                            child: Text(
                              "${item.fullName}",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      //width: 250.0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: _dateCtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.calendar_today),
                            labelText: "Transaction Date",
                            hintText: "Please select the date",
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = (await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now()))!;
                            _dateCtl.text = _formatter.format(date);
                            _dateTime1 = _formatter1.format(date);
                            print('$_dateTime1');
                            //_dateCtl.text = date.toString();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Vehicle',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: GroupButton(
                        isRadio: true,
                        buttons: _vehicleList,
                        onSelected: (index, isSelected) {
                          if(isSelected)
                            {
                              _vehicleIndex = index;
                            }
                        },

                        selectedTextStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        unselectedTextStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: kPrimaryColour,
                        ),
                        spacing: 5.0,
                        selectedColor: kPrimaryColour,
                        unselectedColor: Colors.white,
                        selectedBorderColor: kPrimaryColour,
                        unselectedBorderColor: kPrimaryColour,
                        borderRadius: BorderRadius.circular(5.0),
                        selectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
                        unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        // width: 200.0,
                        child: TextFormField(
                          controller: _nbrOfLoads,
                          enabled: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: "Number of Loads",
                            hintText: "Enter the number",
                            labelStyle: TextStyle(
                              fontSize: 12.5,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Unload',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: _setFlex,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: GroupButton(
                        isRadio: true,
                        selectedButton: 1,
                        buttons: ["Yes", "No"],
                        onSelected: (index, isSelected) {
                          //print('$index button is ${isSelected ? 'selected' : 'unselected'}');
                          if(index == 0)
                            {
                              setState(() {
                                _setFlex = 1;
                                _isUnloaded = true;
                              });
                            }
                          else setState(() {
                            _setFlex = 5;
                            _isUnloaded = false;
                          });

                        },
                        selectedTextStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        unselectedTextStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: kPrimaryColour,
                        ),
                        spacing: 5.0,
                        selectedColor: kPrimaryColour,
                        unselectedColor: Colors.white,
                        selectedBorderColor: kPrimaryColour,
                        unselectedBorderColor: kPrimaryColour,
                        borderRadius: BorderRadius.circular(5.0),
                        selectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
                        unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
                      ),
                    ),
                  ),
                  // _isUnloaded? Expanded(
                  //   flex:3,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  //     child: Container(
                  //       // width: 200.0,
                  //       child: TextFormField(
                  //         controller: _labourGang,
                  //         decoration: InputDecoration(
                  //           labelText: "Labour Gang",
                  //           hintText: "Enter the gang name",
                  //           labelStyle: TextStyle(
                  //             fontSize: 12.5,
                  //           ),
                  //           hintStyle: TextStyle(
                  //             fontSize: 10.0,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ) : Container(),
                  _isUnloaded? Expanded(
                    flex: 3,
                    child: Container(
                      //width: 350.0,
                      child: DropdownSearch<LabourGroup>(
                        popupTitle: Text('Search Labour Group Name'),
                        showSelectedItem: true,
                        showSearchBox: true,
                        autoFocusSearchBox: true,
                        compareFn: (i, s) => i.isEqual(s),
                        hint: 'Enter Leader name',
                        label: "Select Labour Group name",
                        onFind: (filter) => Services().getLabourGroup(filter),
                        onChanged: (data) {
                          //print(data);
                          setState(() {
                            _selectedGroup = data;
                            //_getLedger();
                            //print(_selectedFarmer!.farmer_id);
                          });
                        },
                        dropdownBuilder: _labourDropDown,
                        popupItemBuilder: _labourPopupBuilder,
                        popupSafeArea: PopupSafeArea(bottom: true),
                        mode: Mode.MENU,
                        showFavoriteItems: false,
                        favoriteItemsAlignment: MainAxisAlignment.start,
                        favoriteItems: (item) {
                          return item
                              .where((e) => e.leaderName!.contains("Ea"))
                              .toList();
                        },
                        favoriteItemBuilder: (context, item) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey[900]),
                            child: Text(
                              "${item.leaderName}",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ) : Container(),
                  _isUnloaded? Expanded(
                    flex:1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        // width: 200.0,
                        child: TextFormField(
                          controller: _unloadingCharges,
                          decoration: InputDecoration(
                            labelText: "Unload Cost",
                            hintText: "Enter amount",
                            labelStyle: TextStyle(
                              fontSize: 12.5,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter amount';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ) : Container(),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Variety : ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GroupButton(
                          isRadio: false,
                          //buttonHeight: 25.0,
                          buttonWidth: 115.0,
                          buttons: _varietyList,
                          selectedButtons: [],
                          onSelected: (index, isSelected) {
                            for(int i=0;i<5;i++)
                              {
                                if(index == i && isSelected )
                                  {
                                    _count++;
                                    _selectedList[i]= _varietyList[i];
                                  }
                                else if (index == i && isSelected == false )
                                  {
                                    _count--;
                                    _selectedList[i]= "ZZ";
                                  }
                              }
                          },
                          selectedTextStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          unselectedTextStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: kPrimaryColour,
                          ),
                          spacing: 5.0,
                          selectedColor: kPrimaryColour,
                          unselectedColor: Colors.white,
                          selectedBorderColor: kPrimaryColour,
                          unselectedBorderColor: kPrimaryColour,
                          borderRadius: BorderRadius.circular(5.0),
                          selectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
                          unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        // width: 200.0,
                        child: TextFormField(
                          controller: _amountPaid,
                          decoration: InputDecoration(
                            labelText: "Cash Paid",
                            hintText: "Please enter the amount",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        //width: 200.0,
                        child: TextFormField(
                          controller: _rent,
                          decoration: InputDecoration(
                            labelText: "Rent Paid",
                            hintText: "Please enter the amount",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: 600.0,
                  child: Row(
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
                                  if (_formKey.currentState!.validate()) {
                                    if(_count == 0)
                                      {
                                        showAlertDialog1(context,'Select at least one variety');
                                      }
                                    else _postArrivals();
                                  }
                                  //_showList();

                                },
                                // minWidth: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.save,
                                      color: kIconColour,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
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
                      SizedBox(
                        width: 20.0,
                      ),
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
                                  Navigator.pushNamed(context, ShowLedger.id);
                                },
                                // minWidth: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye,
                                      color: kIconColour,
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      " Modify ?",
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
      ),
    ));}

  Widget _farmerDropDown(BuildContext context, FarmerModel? item, String itemDesignation) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/FruitnetLogo_1.png'),
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
        title: Text(item.fullName.toString()),
        subtitle: Text(
          item.villageTownCityName.toString(),
        ),
        trailing: Text(item.farmerIdExt.toString()),
      ),
    );
  }

  Widget _farmerPopupBuilder(BuildContext context, FarmerModel item, bool isSelected) {
    // String test1 = item.full_name.toString() + 'MAK';
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              //border: Border.all(color: kPrimaryColour),
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[700],
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.fullName.toString()),
        subtitle: Text(item.villageTownCityName.toString()),
        trailing: Text(item.farmerIdExt.toString()),
        leading: CircleAvatar(
          //backgroundImage: AssetImage('images/FruitnetLogo_1.png'),
          backgroundImage: NetworkImage(
              "https://miro.medium.com/proxy/1*ilC2Aqp5sZd1wi0CopD1Hw.png"),
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
      ),
    );
  }

  Widget _labourDropDown(BuildContext context, LabourGroup? item, String itemDesignation) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/FruitnetLogo_1.png'),
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
        title: Text(item.leaderName.toString()),
        subtitle: Text(
          item.phoneNbr.toString(),
        ),
        trailing: Text(item.groupIdExt.toString()),
      ),
    );
  }

  Widget _labourPopupBuilder(BuildContext context, LabourGroup item, bool isSelected) {
    // String test1 = item.full_name.toString() + 'MAK';
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        //border: Border.all(color: kPrimaryColour),
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[700],
      ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.leaderName.toString()),
        subtitle: Text(item.phoneNbr.toString()),
        trailing: Text(item.groupIdExt.toString()),
        leading: CircleAvatar(
          //backgroundImage: AssetImage('images/FruitnetLogo_1.png'),
          backgroundImage: NetworkImage(
              "https://miro.medium.com/proxy/1*ilC2Aqp5sZd1wi0CopD1Hw.png"),
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
      ),
    );
  }
}
