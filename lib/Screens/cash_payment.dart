import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khata_dari/Brains/constants.dart';
import 'package:khata_dari/Screens/landingpage.dart';
import '../Brains/Services.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../Brains/farmer_model.dart';
import '../Brains/currency_format.dart';
import '../Brains/numbers_to_words.dart';

class CashPayment extends StatefulWidget {
  //
  CashPayment() : super();
  static const String id = 'cash_payment';

  final String title = 'Muneer Mango Centre';

  @override
  CashPaymentState createState() => CashPaymentState();
}

class CashPaymentState extends State<CashPayment> {
  //List<Ledger>? _ledger;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  late String _titleProgress;
  //TextEditingController _iDController;
  //Dropdown declarations
  //List<Farmer>? _farmers;
  List<FarmerModel?>? _farmers; // = DropFarmers.getDropFarmers();
  //List<DropdownMenuItem<Farmer>> _dropdownMenuItems;
  FarmerModel? _selectedFarmer;

  // Default Radio Button Item
  int _id = 1;
  String _creditAmount = '0';
  String _debitAmount = '0';
  String _paymentType = "Cash";
  TextEditingController _dateCtl = TextEditingController();
  TextEditingController _postRef = TextEditingController();
  final _amountPaid = MoneyMaskedTextController(
    leftSymbol: '₹ ',
    precision: 0,
    decimalSeparator: '',
    thousandSeparator: ',',
    initialValue: 0,
  );
  final DateFormat _formatter = DateFormat('yyyy-MM-dd');

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
    _showProgress('Loading Ledger...');
    String value = _amountPaid.text;
    _creditAmount = value.replaceAll(',', '').replaceAll('₹ ', '');

    print (_creditAmount);
    String postFarmerId = _selectedFarmer!.farmer_id.toString();
    Services.postTransaction(_dateCtl.text,postFarmerId,_paymentType,_postRef.text,_debitAmount,_creditAmount)
      .then((result) {
      if ('success' == result) {
      print('Row inserted successfully');
      _clearValues();
      }
      else print('Error out-came back');
      });

      _showProgress(widget.title); // Reset the title...

    }
  _clearValues() {
    _dateCtl.text = _formatter.format(DateTime.now());
    _paymentType = "Cash";
    _amountPaid.text = '0';
    _postRef.text ='';
  }

  // DataTable and show the farmer list in it.

  // UI
  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(_titleProgress),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Farmer'),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_car)),
            ],
          ),
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
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.only(left: 250.0, right: 250.0),
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
                            ' Farmer Payments ',
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
                        child: Container(
                          //width: 350.0,
                          child: DropdownSearch<FarmerModel>(
                            popupTitle: Text('Search farmer name'),
                            showSelectedItem: true,
                            showSearchBox: true,
                            autoFocusSearchBox: true,
                            compareFn: (i, s) => i.isEqual(s),
                            hint: 'Enter farmer name',
                            label: "Select Farmer name : Fav Option",
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
                            dropdownBuilder: _customDropDownExample,
                            popupItemBuilder: _customPopupItemBuilderExample2,
                            popupSafeArea: PopupSafeArea(bottom: true),
                            mode: Mode.MENU,
                            showFavoriteItems: true,
                            favoriteItemsAlignment: MainAxisAlignment.start,
                            favoriteItems: (item) {
                              return item
                                  .where((e) => e.full_name!.contains("Ay"))
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
                                  "${item.full_name}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
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
                                    lastDate: DateTime(2100)))!;
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Payment Type ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //width: 150.0,
                        child: RadioListTile(
                          title: Text(
                            "Cash",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          groupValue: _id,
                          value: 1,
                          onChanged: (val) {
                            setState(() {
                              _paymentType = "Cash";
                              _id = 1;
                            });
                            print("Selected Choice :$_paymentType");
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //width: 150.0,
                        child: RadioListTile(
                          title: Text(
                            "Cheque",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          groupValue: _id,
                          value: 2,
                          onChanged: (val) {
                            setState(() {
                              _paymentType = "Cheque";
                              _id = 2;
                            });
                            print("Selected Choice :$_paymentType");
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //width: 175.0,
                        child: RadioListTile(
                          title: Text(
                            "Bank Transfer",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          groupValue: _id,
                          value: 3,
                          onChanged: (val) {
                            setState(() {
                              _paymentType = "Bank Transfer - RTGS/IMPS/NEFT/DD";
                              _id = 3;
                            });
                            print("Selected Choice :$_paymentType");
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //width: 175.0,
                        child: RadioListTile(
                          title: Text(
                            "UPI",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          groupValue: _id,
                          value: 4,
                          onChanged: (val) {
                            setState(() {
                              _paymentType = "UPI Payment";
                              _id = 4;
                            });
                            print("Selected Choice :$_paymentType");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Container(
                        width: 200.0,
                        child: TextFormField(
                          controller: _amountPaid,
                          // onChanged: (value){
                          //   setState(() {
                          //     //String value1 = _amountPaid.text;
                          //     if(value == '₹'){
                          //       _creditAmount = '0';
                          //       _amountPaid.text = '0';
                          //     }
                          //     _creditAmount = value.replaceAll(',', '').replaceAll('₹ ', '');
                          //   });
                          // },
                          onEditingComplete: (){
                            setState(() {
                              String value1 = _amountPaid.text;
                              _creditAmount = value1.replaceAll(',', '').replaceAll('₹ ', '');
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Amount Paid",
                            hintText: "Please enter the amount",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(

                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              NumberToWords.convert(int.parse(_creditAmount), "en"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    //width: 200.0,
                    child: TextFormField(
                      controller: _postRef,
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
                                    _postTransactions();
                                    //print(NumberToWords.convert(8751198452, "en"));
                                    // print(_amountPaid.text);
                                    // print(_paymentType);
                                    // print(_dateCtl.text);
                                    // print(_selectedFarmer!.farmer_id);
                                    // print(_postRef.text);
                                    //Navigator.pushNamed(context, ViewFarmer.id);
                                  },
                                  // minWidth: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.save),
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
                                  onPressed: () {},
                                  // minWidth: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.remove_red_eye),
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

                // Row(
                //   children: fList
                //       .map((data) => RadioListTile(
                //     title: Text("${data.name}"),
                //     groupValue: id,
                //     value: data.index,
                //     onChanged: (val) {
                //       setState(
                //             () {
                //           radioItem = data.name;
                //           id = data.index;
                //         },
                //       );
                //     },
                //   ),
                //   ) .toList(),
                // ),
              ],
            ),
          ),
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ]),
      ),
    ));
  }

  Widget _customDropDownExample(
      BuildContext context, FarmerModel? item, String itemDesignation) {
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
        title: Text(item.full_name.toString()),
        subtitle: Text(
          item.village_town_city.toString(),
        ),
        trailing: Text(item.farmer_id_ext.toString()),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, FarmerModel item, bool isSelected) {
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
        title: Text(item.full_name.toString()),
        subtitle: Text(item.village_town_city.toString()),
        trailing: Text(item.farmer_id_ext.toString()),
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
