import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Others/show_ledger_new_page.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import '../Brains/Services.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../Brains/farmer_model.dart';
import '../Brains/currency_format.dart';
import '../Brains/numbers_to_words.dart';
import 'package:group_button/group_button.dart';


class AcctReceivable extends StatefulWidget {
  //
  AcctReceivable() : super();
  static const String id = 'acctReceivable';

  final String title = 'Muneer Mango Centre';

  @override
  AcctReceivableState createState() => AcctReceivableState();
}

class AcctReceivableState extends State<AcctReceivable> {
  //List<Ledger>? _ledger;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  late String _titleProgress;
  //TextEditingController _iDController;
  //Dropdown declarations
  //List<Farmer>? _farmers;
  //List<FarmerModel?>? _farmers; // = DropFarmers.getDropFarmers();
  //List<DropdownMenuItem<Farmer>> _dropdownMenuItems;
  FarmerModel? _selectedFarmer;

  // Default Radio Button Item
  int _id = 1;
  String _numtoWords = '';
  int _paymentTypeIndex = 0;
  String _creditAmount = '0';
  String _debitAmount = '0';
  String _paymentType = "Cash";
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController _postRef = TextEditingController();
  TextEditingController _amountInWords = TextEditingController();
  final _amountPaid = MoneyMaskedTextController(
    leftSymbol: '₹ ',
    precision: 0,
    decimalSeparator: '',
    thousandSeparator: ',',
    initialValue: 0,
  );
  final DateFormat _formatter = DateFormat('dd-MMM-yyyy, EEEE');
  final _formKey = GlobalKey<FormState>();
  var _paymentTypeList = ["Cash", "Cheque", "Bank Transfer","UPI","Goods/Bill"];

  @override
  void initState() {
    super.initState();
    //_farmers = [];
    //_isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _dateCtl.text = _formatter.format(DateTime.now()); // key to get the context to show a SnackBar
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

  _postTransactions() {

    try {
      _showProgress('Posting Transaction...');
      String value = _amountPaid.text;
      _debitAmount = value.replaceAll(',', '').replaceAll('₹ ', '');
      String postFarmerId = _selectedFarmer!.farmerId.toString();
      //print (_creditAmount);
      //String postFarmerId = _selectedFarmer!.farmer_id.toString();
      _paymentType = _paymentTypeList[_paymentTypeIndex];

      Services.postTransaction(
          _dateCtl.text, postFarmerId, _paymentType, _postRef.text,
          _debitAmount, _creditAmount)
          .then((result) {
        if ('success' == result) {
          print('Row inserted successfully');
          String showMsg =  'Transaction Posted successfully!';
          showAlertDialog(context,showMsg);
          _clearValues();
        }
        else
          print('Error out - came back here');

      });

      _showProgress(widget.title); // Reset the title...
    }
    catch (e)
    {
      String showMsg1 =  'Select farmer name to proceed';
      showAlertDialog(context, showMsg1);
    }


    }
  _clearValues() {
    _dateCtl.text = _formatter.format(DateTime.now());
    _paymentType = "Cash";
    _amountPaid.text = '0';
    _postRef.text ='';
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
  // DataTable and show the farmer list in it.

  // UI
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(kTitle),
        // bottom: TabBar(
        //   tabs: [
        //     Tab(text: 'Farmer'),
        //     Tab(text: 'Buyer'),
        //     Tab(text: 'Labour Group'),
        //   ],
        // ),
        backgroundColor:
            kPrimaryColour, // we show the progress in the title...
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
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: kComplementaryColour,
                child: TabBar(
                  indicatorWeight: 6.0,
                  labelColor: kPrimaryColour,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Farmer',),
                    Tab(text: 'Buyer'),
                    Tab(text: 'Labour Group'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 225.0, right: 225.0),
                    child: Form(
                      key : _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(25),
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      ' Accounts Receivable - Farmer ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35.0,
                                        color: kPrimaryColour,
                                      ),
                                    ),
                                  ), //Ledger name
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Received from'),
                                  ),
                                ),
                                Expanded(
                                  flex:3,
                                  child: Container(
                                    //width: 350.0,
                                    child: DropdownSearch<FarmerModel>(
                                      popupTitle: Text('Search farmer name'),
                                      showSelectedItem: true,
                                      showSearchBox: true,
                                      autoFocusSearchBox: true,
                                      compareFn: (i, s) => i.isEqual(s),
                                      hint: 'Enter Farmer name',
                                      label: "Select Farmer name",
                                      //onFind: (filter) => _getFarmers(filter),
                                      onFind: (filter) =>
                                          Services().getFarmersFilter(filter),
                                      onChanged: (data) {
                                        print(data);
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

                                      dropdownBuilder: _customDropDownExample,
                                      popupItemBuilder: _customPopupItemBuilderExample2,
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
                                  flex:2,
                                  child: Container(
                                    //width: 250.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: TextFormField(
                                        controller: _dateCtl,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(),
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
                                        },
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'Payment Type',
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
                                    buttonWidth: 110.0,
                                    isRadio: true,
                                    buttons: _paymentTypeList,
                                    onSelected: (index, isSelected) {
                                      if(isSelected)
                                      {
                                        _paymentTypeIndex = index;
                                      }
                                    },

                                    selectedTextStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                    unselectedTextStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
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
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(20.0),
                          //           child: Text(
                          //             'Payment Type ',
                          //             style: TextStyle(
                          //               fontSize: 16,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         //width: 150.0,
                          //         child: RadioListTile(
                          //           title: Text(
                          //             "Cash",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //             ),
                          //           ),
                          //           groupValue: _id,
                          //           value: 1,
                          //           onChanged: (val) {
                          //             setState(() {
                          //               _paymentType = "Cash";
                          //               _id = 1;
                          //             });
                          //             print("Selected Choice :$_paymentType");
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         //width: 150.0,
                          //         child: RadioListTile(
                          //           title: Text(
                          //             "Cheque",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //             ),
                          //           ),
                          //           groupValue: _id,
                          //           value: 2,
                          //           onChanged: (val) {
                          //             setState(() {
                          //               _paymentType = "Cheque";
                          //               _id = 2;
                          //             });
                          //             print("Selected Choice :$_paymentType");
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         //width: 175.0,
                          //         child: RadioListTile(
                          //           title: Text(
                          //             "Bank Transfer",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //             ),
                          //           ),
                          //           groupValue: _id,
                          //           value: 3,
                          //           onChanged: (val) {
                          //             setState(() {
                          //               _paymentType = "Bank Transfer - RTGS/IMPS/NEFT/DD";
                          //               _id = 3;
                          //             });
                          //             print("Selected Choice :$_paymentType");
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         //width: 175.0,
                          //         child: RadioListTile(
                          //           title: Text(
                          //             "UPI",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //             ),
                          //           ),
                          //           groupValue: _id,
                          //           value: 4,
                          //           onChanged: (val) {
                          //             setState(() {
                          //               _paymentType = "UPI Payment";
                          //               _id = 4;
                          //             });
                          //             print("Selected Choice :$_paymentType");
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              Expanded(
                                flex:2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                  child: TextFormField(
                                    maxLengthEnforcement: MaxLengthEnforcement.enforced, controller: _amountPaid,
                                    maxLength: 14,
                                    onChanged: (value){
                                      setState(() {
                                        String value1;
                                        value1 = value.replaceAll(',', '').replaceAll('₹ ', '');
                                        if(value1 == '')
                                        {_numtoWords = NumberToWords.convert(0, "en");}
                                        else
                                          _numtoWords = NumberToWords.convert(int.parse(value1), "en");
                                          _amountInWords.text = _numtoWords;

                                      });
                                    },

                                    validator: (value) {
                                      if (value! == '₹ 0') {
                                        return 'Please enter the amount';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Amount Paid",
                                      hintText: "Please enter the amount",
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex:4,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:10.0,right: 20.0),
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    enabled:false,
                                    controller: _amountInWords,
                                    decoration: InputDecoration(
                                      labelText: "Amount in words",
                                      //hintText: "Please enter the amount",
                                    ),
                                  ),
                                ),
                              ),

                              // Expanded(
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                              //     child: Container(
                              //       child: Align(
                              //         alignment: Alignment.centerLeft,
                              //         child: Text(_numtoWords,),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Container(
                              //width: 200.0,
                              child: TextFormField(
                                controller: _postRef,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter reference text';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Post Reference",
                                  hintText: "Please enter the voucher number",
                                ),
                              ),
                            ),
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
                                              if (_formKey.currentState!.validate())
                                              {
                                                _postTransactions();
                                              }
                                            },
                                            // minWidth: MediaQuery.of(context).size.width,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.save,color: kIconColour,),
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
                                                Icon(Icons.remove_red_eye,color: kIconColour,),
                                                SizedBox(
                                                  width: 4.0,
                                                ),
                                                Text(
                                                  " View Ledger",
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
                ),
                Icon(Icons.construction,size: 100.0,),
                Icon(Icons.construction,size: 100.0,),
              ]),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _customDropDownExample(BuildContext context, FarmerModel? item, String itemDesignation) {
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

  Widget _customPopupItemBuilderExample2(BuildContext context, FarmerModel item, bool isSelected) {
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
}
