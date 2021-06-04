// import 'package:flutter/material.dart';
// class DashboardScreen extends StatefulWidget {
//   DashboardScreen(
//       {required this.token,
//         required this.f_name,
//         required this.phone,
//         required this.l_name,
//         required this.type_client,
//         required this.email,
//         required this.addresse,
//         required this.num_client});
//
//   String token;
//   final String f_name;
//   final String l_name;
//   final String email;
//   final String addresse;
//   final String num_client;
//   final String phone;
//   final String type_client;
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen>
//     with SingleTickerProviderStateMixin {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   late AnimationController _animationController;
//   late Animation<double> _animateIcon;
//   bool isOpened = false;
//
//   String token;
//   String f_name;
//   String l_name;
//   String email;
//   String addresse;
//   String num_client;
//   String phone, type_client;
//
//   bool showSpinner = false;
//   List<Transaction> transactions = [];
//
//   int rowsPerPAge = 4;
//
//   Future<List<Transaction>> _getTransactionsData() async {
//     setState(() {
//       showSpinner = true;
//     });
//
//     GetToken getToken = GetToken(token: "${widget.token}");
//     var freshToken = await getToken.getTokenData();
//
//     try {
//       Map<String, String> newHeader = {'Authorization': 'Bearer $freshToken'};
//
//       GetUserData getUserData = GetUserData(
//           '${APIConstants.API_BASE_URL}/...', newHeader);
//       var userData = await getUserData.getData();
//       //print(userData);
//       var apiError = userData['error'];
//       var apiCode = userData['code'];
//
//       try {
//         if (apiError == false && apiCode == 200) {
//           final items = userData['data'].cast<Map<String, dynamic>>();
//           List<Transaction> listOfTransactions = items.map<Transaction> ((json)  {
//             return Transaction.fromJson(json);
//           }).toList();
//
//           setState(() {
//             showSpinner = false;
//           });
//           //print("succes: $userData");
//           return listOfTransactions;
//         }
//         else if(apiCode == 401){
//
//           setState(() {
//             _scaffoldKey.currentState.showSnackBar(new SnackBar(
//               backgroundColor: MyColor.hintColor,
//               elevation: 10,
//               content: new Text(SnackBarText.TIME_OUT, style: GoogleFonts.roboto(color: Colors.white, fontSize: 20)),
//             ));
//             showSpinner = false;
//             return MaterialPageRoute(builder: (context) => LoginScreen());
//           });
//         }
//         else {
//           //print("erreur: $userData");
//           setState(() {
//             _scaffoldKey.currentState.showSnackBar(new SnackBar(
//               backgroundColor: MyColor.hintColor,
//               elevation: 10,
//               content: new Text(SnackBarText.SERVER_ERROR,
//                   style: GoogleFonts.roboto(color: Colors.white, fontSize: 20)),
//             ));
//             return showSpinner = false;
//           });
//         }
//       } catch (e) {
//         print(e);
//       }
//     } catch (e) {
//       print(e);
//       print('1');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     token = widget.token;
//     f_name = widget.f_name;
//     l_name = widget.l_name;
//     email = widget.email;
//     addresse = widget.addresse;
//     num_client = widget.num_client;
//     phone = widget.phone;
//     type_client = widget.type_client;
//
//     _getTransactionsData().then((transactionsFromServer) {
//       transactions = transactionsFromServer;
//       //print(transactions);
//     });
//
//
//     _animationController =
//     AnimationController(vsync: this, duration: Duration(milliseconds: 500))
//       ..addListener(() {
//         setState(() {});
//       });
//     _animateIcon =
//         Tween<double>(begin: 1.0, end: 2.0).animate(_animationController);
//
//
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
// //FactureProvider factureProvider = Provider.of<FactureProvider>(context);
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     var orientation = MediaQuery.of(context).orientation;
//     bool portrait = orientation == Orientation.portrait;
//
//     return WillPopScope(
//       child: Scaffold(
//         key: _scaffoldKey,
//         backgroundColor: MyColor.myBackgroundColor,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           centerTitle: false,
//           backgroundColor: Colors.white,
//           leading: new IconButton(
//               padding: EdgeInsets.all(0.0),
//               icon: new Icon(
//                 Icons.apps,
//                 color: MyColor.menuColor,
//               ),
//               onPressed: () => _scaffoldKey.currentState.openDrawer()),
//           title: FittedBox(
//             fit: BoxFit.fitWidth,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 //SizedBox(width: 30,),
//                 //ImageIcon(AssetImage('images/notification.png'), color: Colors.black,),
//                 Text(
//                   Texts.DASHBOARD,
//                   style: GoogleFonts.roboto(
//                       color: MyColor.hintColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20),
//                   textAlign: TextAlign.left,
//                 ),
//                 SizedBox(
//                   width: portrait ? width/4.0 : width/1.5,
//                 ),
//                 GestureDetector(
//                     onTap: _goToProfilScreen,
//                     child: ImageIcon(
//                       AssetImage('images/noun_avatar_1.png'),
//                       color: Colors.black,
//                     )),
//               ],
//             ),
//           ),
//         ),
//         drawer: buildDrawer,
//         body: Loader(
//           color: Colors.white.withOpacity(0.3),
//           loadIng: showSpinner,
//           child: ListView(
//             shrinkWrap: true,
//             physics: ClampingScrollPhysics(),
//             Row(
//               children: <Widget>[
//
//                 Conditioned(
//                   cases:[
//                     Case( (transactions?.length == 0 || transactions?.length == null), builder: () => Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Text(Texts.HISTO_TRANSAC, style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700), textAlign: TextAlign.start,)
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Center(child: Text(Texts.NO_TRANSAC, style: GoogleFonts.roboto(color: MyColor.hintColor, fontSize: 15),),),
//                           ),
//                         ],
//                       ),
//                     )),
//                   ],
//                   defaultBuilder: () => Padding(
//                     padding: const EdgeInsets.only(left: 1.0, right: 1.0),
//                     child: FittedBox(
//                       fit: BoxFit.fitWidth,
//                       child: Container(
//                         width: MediaQuery.of(context).size.width/1.005,
//                         child: PaginatedDataTable(
//                             header: Text(Texts.HISTO_TRANSAC, style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700), textAlign: TextAlign.start,),
//                             rowsPerPage: transactions.length <= rowsPerPAge ? transactions.length : rowsPerPAge,
//                             horizontalMargin: 3.7,
//                             columnSpacing: 1.8,
//                             headingRowHeight: 15,
//                             dataRowHeight: 30,
//                             columns: [
//                               DataColumn(label: Text(Texts.dATE, style: GoogleFonts.roboto(fontSize: 8, fontWeight: FontWeight.w900))),
//                               DataColumn(label: Text(Texts.mONTANT_PAYE, style: GoogleFonts.roboto(fontSize: 8, fontWeight: FontWeight.w900))),
//                               DataColumn(label: Text(Texts.SERVICE_TEXT, style: GoogleFonts.roboto(fontSize: 8, fontWeight: FontWeight.w900))),
//                               DataColumn(label: Text(Texts.mODE_PAIEMENT, style: GoogleFonts.roboto(fontSize: 8, fontWeight: FontWeight.w900))),
//                               DataColumn(label: Text(Texts.DETAILS, style: GoogleFonts.roboto(fontSize: 8, fontWeight: FontWeight.w900))),
//                             ],
//                             source: DTS(transactions, context, abonnementsById)
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//         ],
//       ),
//     ),
//     bottomNavigationBar: GestureDetector(
//     onTap: () => showMaterialModalBottomSheet(
//     context: context,
//     useRootNavigator: true,
//     bounce: true,
//     //secondAnimation: AnimationController.unbounded(vsync: this, duration: Duration(seconds: 30)),
//     enableDrag: true,
//     backgroundColor: Colors.transparent,
//     builder: (context, scrollController) => buildWrap(context),
//     ),
//     child: Container(
//     color: MyColor.bottonNavColor,
//     child: Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: <Widget>[
//     Text(
//     Texts.NEW,
//     style: GoogleFonts.roboto(
//     color: MyColor.hintColor,
//     fontSize: 20,
//     fontWeight: FontWeight.bold),
//     ),
//     SizedBox(
//     height: 50,
//     width: 50,
//     child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: FloatingActionButton(
//     clipBehavior: Clip.hardEdge,
//     autofocus: true,
//     mini: true,
//     backgroundColor: MyColor.hintColor,
//     onPressed: () => showMaterialModalBottomSheet(
//     context: context,
//     useRootNavigator: true,
//     bounce: true,
//     //secondAnimation: AnimationController.unbounded(vsync: this, duration: Duration(seconds: 30)),
//     enableDrag: true,
//     backgroundColor: Colors.transparent,
//     builder: (context, scrollController) =>
//     buildWrap(context),
//     ),
//     child: AnimatedIcon(
//     icon: AnimatedIcons.event_add,
//     size: 30,
//     progress: _animateIcon,
//     ),
//     ),
//     ),
//     )
//     ],
//     ),
//     ),
//     ),
//     ),
//     onWillPop: _onWillPop,
//     );
//   }
// }