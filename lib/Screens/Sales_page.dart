import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:khata_dari/Brains/buyer_model.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Brains/farmeropenarrivals_model.dart';
import 'package:khata_dari/Brains/variety_model.dart';
import 'package:khata_dari/Others/show_ledger_new_page.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import '../Brains/Services.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../Brains/farmer_model.dart';
import '../Brains/currency_format.dart';
//import 'package:khata_dari/Brains/group_model.dart';
//import '../Brains/numbers_to_words.dart';

class Sales extends StatefulWidget {
  //
  Sales() : super();
  static const String id = 'sales';

  final String title = 'Muneer Mango Centre';

  @override
  SalesState createState() => SalesState();
}

class SalesState extends State<Sales> {

  GlobalKey<ScaffoldState>? _scaffoldKey;
  BuyerModel? _selectedBuyer;
  FarmerOpenArrivals? _selectedArrival;
  //LabourGroup? _selectedGroup;
  //int _vehicleIndex = 0;
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController  _labourGang = TextEditingController();
  TextEditingController _vehicleNumber = TextEditingController();
  //TextEditingController _unloadingCharges = TextEditingController();
  final _amountPaid = MoneyMaskedTextController(
    leftSymbol: '₹ ',
    precision: 0,
    decimalSeparator: '',
    thousandSeparator: ',',
    initialValue: 0,
  );
  // final _rent = MoneyMaskedTextController(
  //   leftSymbol: '₹ ',
  //   precision: 0,
  //   decimalSeparator: '',
  //   thousandSeparator: ',',
  //   initialValue: 0,
  // );
  final DateFormat _formatter = DateFormat('dd-MMM-yyyy, EEEE');
  final DateFormat _formatter1 = DateFormat('yyyy-MM-dd');
  final _formKey = GlobalKey<FormState>();
  //bool _isUnloaded = false;
  //int _setFlex = 5;
  //var _varietyList = ["Badami","Neelam","Totapari","Lal Bagh","Nati"];
  //var _vehicleList = ["Lorry", "Tempo", "Tractor","Cart","Bags"];

  //int _count = 0;
  //int _finalCount = 0;
  //var _selectedList = new List.filled(5,"ZZ");
  //var _finalList = [];
  var _dateTime1 ;
  //List _farmers = ['1','2','3'];


  @override
  void initState() {
    super.initState();
    //_farmers = [];
    //_isUpdating = false;
    //_titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
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
              label: Text('Farmer Name'),
            ),
            DataColumn(
              label: Text('Variety'),
            ),
            DataColumn(
              label: Text('Net Weight'),
            ),
            DataColumn(
              label: Text('Rate'),
            ),
            DataColumn(
              label: Text('Keel'),
            ),
            DataColumn(
              label: Text('MODIFY'),
            ),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(
                  Text(
                    'Datarow',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    'Datarow',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    'Datarow',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    'Data Row',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    'Datarow',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kTableTextColour,
                    ),
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

                      });
                    },
                  ),
                ),
              ],
            ),
          ]


        ),
      ),
    );
  }




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
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 5.0),
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' Sales ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: kPrimaryColour,
                    ),
                  ),
                ), //Ledger name
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    //width: 350.0,
                    child: DropdownSearch<BuyerModel>(
                      popupTitle: Text('Search Buyer name'),
                      showSelectedItem: true,
                      showSearchBox: true,
                      autoFocusSearchBox: true,
                      compareFn: (i, s) => i.isEqual(s),
                      hint: 'Enter Buyer name',
                      label: "Select Buyer name",
                      onFind: (filter) => Services().getBuyer(filter),
                      onChanged: (data) {
                        //print(data);
                        setState(() {
                          _selectedBuyer = data;
                          //_getLedger();
                          //print(_selectedBuyer!.farmer_id);
                        });
                      },
                      // validator: (value) {
                      //     if (value! == null) {
                      //         return 'Please select the farmer name';
                      //         }
                      //         return null;
                      //         },

                      dropdownBuilder: _buyerDropDown,
                      popupItemBuilder: _buyerPopupBuilder,
                      popupSafeArea: PopupSafeArea(bottom: true),
                      mode: Mode.MENU,
                      showFavoriteItems: false,
                      favoriteItemsAlignment: MainAxisAlignment.start,
                      favoriteItems: (item) {
                        return item
                            .where((e) => e.companyName!.contains("Ay"))
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
                            "${item.companyName}",
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
                      padding: const EdgeInsets.all(0.0),
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
                /*
                Expanded(
                  flex:2,
                  child: Column(
                    children: [
                      Text('Truck Details'),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: _vehicleNumber,
                          enabled: true,
                          textAlign: TextAlign.center,
                          textCapitalization : TextCapitalization.characters,
                          decoration: InputDecoration(
                            labelText: "Regn. Number",
                            hintText: "Enter the vehicle number",
                            labelStyle: TextStyle(
                              fontSize: 12.5,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: _vehicleNumber,
                          enabled: true,
                          textAlign: TextAlign.center,
                          textCapitalization : TextCapitalization.characters,
                          decoration: InputDecoration(
                            labelText: "Tare Weight",
                            hintText: "Enter the Tare Weight",
                            labelStyle: TextStyle(
                              fontSize: 12.5,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: _vehicleNumber,
                          enabled: true,
                          textAlign: TextAlign.center,
                          textCapitalization : TextCapitalization.characters,
                          decoration: InputDecoration(
                            labelText: "Gross Weight",
                            hintText: "Enter the Gross Weight",
                            labelStyle: TextStyle(
                              fontSize: 12.5,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          controller: _vehicleNumber,
                          enabled: true,
                          textAlign: TextAlign.center,
                          textCapitalization : TextCapitalization.characters,

                          decoration: InputDecoration(
                            labelText: "Net Weight",
                            hintText: "Enter the Net Weight",
                            labelStyle: TextStyle(
                              fontSize: 12.5,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 10.0,
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: kPrimaryColour)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 */
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('Truck Details')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: _vehicleNumber,
                      enabled: true,
                      textAlign: TextAlign.center,
                      textCapitalization : TextCapitalization.characters,
                      decoration: InputDecoration(
                        labelText: "Regn. Number",
                        hintText: "Enter the vehicle number",
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: _vehicleNumber,
                      enabled: true,
                      textAlign: TextAlign.center,
                      textCapitalization : TextCapitalization.characters,
                      decoration: InputDecoration(
                        labelText: "Tare Weight",
                        hintText: "Enter the Tare Weight",
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: _vehicleNumber,
                      enabled: true,
                      textAlign: TextAlign.center,
                      textCapitalization : TextCapitalization.characters,
                      decoration: InputDecoration(
                        labelText: "Gross Weight",
                        hintText: "Enter the Gross Weight",
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: _vehicleNumber,
                      enabled: true,
                      textAlign: TextAlign.center,
                      textCapitalization : TextCapitalization.characters,

                      decoration: InputDecoration(
                        labelText: "Net Weight",
                        hintText: "Enter the Net Weight",
                        labelStyle: TextStyle(
                          fontSize: 12.5,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 10.0,
                        ),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: kPrimaryColour)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    //width: 350.0,
                    child: DropdownSearch<FarmerOpenArrivals>(
                      popupTitle: Text('Farmer Name'),
                      showSelectedItem: true,
                      showSearchBox: true,
                      autoFocusSearchBox: true,
                      compareFn: (i, s) => i.isEqual(s),
                      hint: 'Select the farmer name',
                      label: "Select the farmer name",
                      //onFind: (filter) => _getFarmers(filter),
                      onFind: (filter) => Services().getFarmerListOpen(filter),
                      onChanged: (data) {
                        //print(data);
                        setState(() {
                           _selectedArrival = data;

                          //_getLedger();
                          //print(_selectedBuyer!.farmer_id);
                        });
                      },
                      // validator: (value) {
                      //     if (value! == null) {
                      //         return 'Please select the farmer name';
                      //         }
                      //         return null;
                      //         },

                      dropdownBuilder: _arrivalDropDown,
                      popupItemBuilder: _arrivalPopupBuilder,
                      popupSafeArea: PopupSafeArea(bottom: true),
                      mode: Mode.MENU,
                      showFavoriteItems: false,
                      // favoriteItemsAlignment: MainAxisAlignment.start,
                      // favoriteItems: (item) {
                      //   return item
                      //       .where((e) => e.companyName!.contains("Ay"))
                      //       .toList();
                      // },
                      // favoriteItemBuilder: (context, item) {
                      //   return Container(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 8, vertical: 6),
                      //     decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: Colors.blueGrey[900]),
                      //     child: Text(
                      //       "${item.companyName}",
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   );
                      // },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    //width: 350.0,
                    child: DropdownSearch<VarietyOpenArrivals>(
                      //popupTitle: Text('Select the Variety'),
                      showSelectedItem: true,
                      showSearchBox: false,
                      autoFocusSearchBox: true,
                      compareFn: (i, s) => i.isEqual(s),
                      //hint: 'Select the variety',
                      label: "Select the variety",
                      //onFind: (filter) => _getFarmers(filter),
                      onFind: (filter) => Services().getAvailableVariety(_selectedArrival!.arrivalId),
                      onChanged: (data) {
                        //print(data);
                        setState(() {
                         // _selectedBuyer = data;
                          //_getLedger();
                          //print(_selectedBuyer!.farmer_id);
                        });
                      },
                      // validator: (value) {
                      //     if (value! == null) {
                      //         return 'Please select the farmer name';
                      //         }
                      //         return null;
                      //         },

                      dropdownBuilder: _varietyDropDown,
                      popupItemBuilder: _varietyPopupBuilder,
                      popupSafeArea: PopupSafeArea(bottom: true),
                      mode: Mode.MENU,
                      showFavoriteItems: false,
                      // favoriteItemsAlignment: MainAxisAlignment.start,
                      // favoriteItems: (item) {
                      //   return item
                      //       .where((e) => e.companyName!.contains("Ay"))
                      //       .toList();
                      // },
                      // favoriteItemBuilder: (context, item) {
                      //   return Container(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 8, vertical: 6),
                      //     decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: Colors.blueGrey[900]),
                      //     child: Text(
                      //       "${item.companyName}",
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   );
                      // },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      controller: _vehicleNumber,
                      enabled: true,
                      textAlign: TextAlign.center,
                      textCapitalization : TextCapitalization.characters,

                      decoration: InputDecoration(
                        labelText: "Net Weight",
                        hintText: "Enter the Net Weight",
                        labelStyle: TextStyle(
                          fontSize: 12.5,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 10.0,
                        ),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: kPrimaryColour)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      controller: _vehicleNumber,
                      enabled: true,
                      textAlign: TextAlign.center,
                      textCapitalization : TextCapitalization.characters,

                      decoration: InputDecoration(
                        labelText: "Rate per KG",
                        hintText: "Enter the Rate",
                        labelStyle: TextStyle(
                          fontSize: 12.5,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 10.0,
                        ),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: kPrimaryColour)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      controller: _vehicleNumber,
                      enabled: true,
                      textAlign: TextAlign.center,
                      textCapitalization : TextCapitalization.characters,

                      decoration: InputDecoration(
                        labelText: "Keel Weight",
                        hintText: "Enter the Keel Weight",
                        labelStyle: TextStyle(
                          fontSize: 12.5,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 10.0,
                        ),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: kPrimaryColour)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _dataBody(),
            Container(
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {

                              }
                            },
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

          ],
        ),
      ),
    ),
  ));}

  Widget _buyerDropDown(BuildContext context, BuyerModel? item, String itemDesignation) {
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
        title: Text(item.companyName.toString()),
        subtitle: Text(
          item.city.toString(),
        ),
        trailing: Text(item.buyerIdExt.toString()),
      ),
    );
  }

  Widget _buyerPopupBuilder(BuildContext context, BuyerModel item, bool isSelected) {
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
        title: Text(item.companyName.toString()),
        subtitle: Text(item.city.toString()),
        trailing: Text(item.buyerIdExt.toString()),
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

  Widget _arrivalDropDown(BuildContext context, FarmerOpenArrivals? item, String itemDesignation) {
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

  Widget _arrivalPopupBuilder(BuildContext context, FarmerOpenArrivals item, bool isSelected) {
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

  Widget _varietyDropDown(BuildContext context, VarietyOpenArrivals? item, String itemDesignation) {
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
        title: Text(item.variety.toString()),
        subtitle: Text(
          item.lotStatus.toString(),
        ),
        //trailing: Text(item.farmerIdExt.toString()),
      ),
    );
  }

  Widget _varietyPopupBuilder(BuildContext context, VarietyOpenArrivals item, bool isSelected) {
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
        title: Text(item.variety.toString()),
        subtitle: Text(item.lotStatus.toString()),
        //trailing: Text(item.farmerIdExt.toString()),
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
/*
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

 */
}
