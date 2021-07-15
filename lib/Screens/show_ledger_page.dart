import 'package:flutter/material.dart';
import '../Brains/constants.dart';
import '../Screens/landingpage.dart';
import '../Brains/Services.dart';
import '../Brains/ledger_class.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../Brains/farmer_model.dart';


class ShowLedger extends StatefulWidget {
  //
  ShowLedger() : super();
  static const String id = 'showledger_page';

  final String title = 'Muneer Mango Centre';

  @override
  ShowLedgerState createState() => ShowLedgerState();
}

class ShowLedgerState extends State<ShowLedger> {
  List<Ledger>? _ledger;
  GlobalKey<ScaffoldState>? _scaffoldKey;
  late String _titleProgress;
  //TextEditingController _iDController;
  //Dropdown declarations
  //List<Farmer>? _farmers;
  List<FarmerModel>? _farmers;// = DropFarmers.getDropFarmers();
  //List<DropdownMenuItem<Farmer>> _dropdownMenuItems;
  FarmerModel? _selectedFarmer;

  @override
  void initState() {
    super.initState();
    _ledger = [];
    //_farmers = [];
    //_isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    //_iDController = TextEditingController();
    //_getFarmers(init_filter);
    // if(_farmers!.length >0)
    //   {
    //     _selectedFarmer = _farmers![0];
    //   }
  }

  // _getFarmers(String filter) {
  //   _showProgress('Loading Farmer Profiles...');
  //   Services.getFarmersFilter(filter).then((farmers) {
  //     setState(() {
  //       _farmers = farmers;
  //     });
  //     _showProgress(widget.title); // Reset the title...
  //     print("Length ${farmers!.length}");
  //     //final data = farmers;
  //   });
  // }

  // DropdownMenuItem<Farmer> buildDropdownMenuItem(Farmer item) {
  //   return DropdownMenuItem(
  //     value: item, // you must provide a value
  //     child: Padding(
  //       padding: const EdgeInsets.all(12.0),
  //       child: Text(item.full_name ?? ""),
  //     ),
  //   );
  // }
  //
  // onChangeDropdownItem(Farmer selectedFarmer) {
  //   setState(() {
  //     _selectedFarmer = selectedFarmer;
  //   });
  // }

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


  _getLedger() {
    _showProgress('Loading Ledger...');
    Services.getLedger(_selectedFarmer!.farmerId).then((ledger) {
      setState(() {
        _ledger = ledger;
      });

      _showProgress(widget.title); // Reset the title...
      print("Length ${ledger!.length}");
    });
  }

  // DataTable and show the farmer list in it.
  SingleChildScrollView _dataBody() {
    // Both Vertical and Horizontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columnSpacing: 20.0,
          showBottomBorder: true,
          dataRowHeight: 25.0,
          // decoration: BoxDecoration(
          //       border: Border.all(width: 1,),),
          dataTextStyle: TextStyle(fontSize: 12.0,
              //color: Colors.white,
          ),
          //headingRowColor: MaterialStateColor.resolveWith((states) => kPrimaryColour[50]),

          headingTextStyle: TextStyle(
            color: kPrimaryColour,
          ),
          //dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
          columns: [
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('DATE'),
            ),
            DataColumn(
              label: Text('DESCRIPTION'),
            ),
            DataColumn(
              label: Text('REFERENCE'),
            ),
            DataColumn(
              label: Text('DEBIT'),
            ),
            DataColumn(
              label: Text('CREDIT'),
            ),
            DataColumn(
              label: Text('BALANCE'),
            ),
          ],
          rows: _ledger!.map((ledger) => DataRow(cells: [
                  DataCell(
                    Text(ledger.transactionId!),
                          ),
                  DataCell(
                    Text(ledger.transactionDate!),
                  ),
                  DataCell(
                    Text(ledger.descriptionMsg!),
                  ),
                  DataCell(
                    Text(ledger.postRef!),
                  ),
                  DataCell(
                    Text(ledger.debitAmount!,textAlign: TextAlign.center,),
                  ),
                  DataCell(
                    Text(ledger.creditAmount!,textAlign: TextAlign.right,),
                  ),
                  DataCell(
                    Text(ledger.balance!,textAlign: TextAlign.center,),
                  ),
                  // DataCell(
                  //   Text(ledger.changedBy),
                  // ),
                ]),).toList(),
        ),
      ),
    );
  }


  // UI
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
              Tab(text: 'Farmer'),
              Tab(text: 'Buyer'),
              Tab(text: 'Labour Group'),
            ],
          ),
          backgroundColor: kPrimaryColour,// we show the progress in the title...
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home,),
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
        body: TabBarView(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex:1,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(25),
                          child: Container(
                            child: Text(
                              'Ledger Statement',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: kPrimaryColour,
                              ),
                            ), //Ledger name
                          ),
                        ),
                        Container(
                          width: 350.0,
                          child: DropdownSearch<FarmerModel>(
                            showSelectedItem: true,
                            showSearchBox: true,
                            autoFocusSearchBox: true,
                            compareFn: (i, s) => i.isEqual(s),
                            label: "Select Farmer name : Fav Option",
                            //onFind: (filter) => _getFarmers(filter),
                            onFind: (filter) =>  Services().getFarmersFilter(filter),
                            onChanged: (data) {
                              print(data);
                              setState(() {
                                _selectedFarmer = data;
                                _getLedger();
                                print(_selectedFarmer!.farmerId);
                              });
                            },
                            dropdownBuilder: _customDropDownExample,
                            popupItemBuilder: _customPopupItemBuilderExample2,
                            popupSafeArea: PopupSafeArea(bottom: true),
                            mode: Mode.MENU,
                            showFavoriteItems: true,
                            favoriteItemsAlignment: MainAxisAlignment.start,
                            favoriteItems: (item) {
                              return item.where((e) => e.fullName!.contains("Mus")).toList();
                            },
                            favoriteItemBuilder: (context, item) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        _dataBody(),
                      ],
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
        title: Text(item.fullName.toString()),
        subtitle: Text(item.villageTownCityName.toString()),
        trailing: Text(item.farmerIdExt.toString()),
        leading: CircleAvatar(
          //backgroundImage: AssetImage('images/FruitnetLogo_1.png'),
          backgroundImage: NetworkImage("https://miro.medium.com/proxy/1*ilC2Aqp5sZd1wi0CopD1Hw.png"),
          // this does not work - throws 404 error
          // backgroundImage: NetworkImage(item.avatar ?? ''),
        ),
      ),
    );
  }

}