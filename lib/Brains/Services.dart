import 'dart:convert';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.
import 'package:khata_dari/Brains/buyer_model.dart';
import 'package:khata_dari/Brains/variety_model.dart';
import '../Brains/group_model.dart';
import '../Brains/ledger_class.dart';
import 'farmer_model.dart';
import 'farmeropenarrivals_model.dart';



class Services {
  //static const ROOT = 'http://192.168.1.2:80/MMSDB/mms_action.php';
  static const ROOT = 'http://localhost:80/MMSDB/mms_action.php';
  static const _GET_ALL_FARMERS_ACTION = 'GET_ALL_FARMERS';
  static const _ADD_FARMER_ACTION = 'ADD_FARMER';
  static const _UPDATE_FARMER_ACTION = 'UPDATE_FARMER';
  static const _GET_LEDGER_ACTION = 'GET_LEDGER';
  static const _GET_FARMERS_FILTER_ACTION = 'GET_FILTER_FARMERS';
  static const _POST_TRANSACTION_ACTION = 'POST_TRANSACTION';
  static const _POST_ARRIVAL = 'POST_ARRIVAL';
  static const _GET_COUNT_FARMER_ACTION = 'LENGTH_FARMER_TRANSACTION';
  static const _POST_ARRIVAL_LOT = 'POST_ARRIVAL_LOT';
  static const _ADD_LABOUR_GROUP = 'ADD_LABOUR_GROUP';
  static const _GET_LABOUR_GROUP = 'GET_ALL_LABOUR';
  static const _ADD_BUYER_ACTION = 'ADD_BUYER';
  static const _GET_BUYER = 'GET_BUYER';
  static const _GET_OPEN_LOTS = 'GET_OPEN_LOTS';
  static const _GET_VARIETY = 'GET_VARIETY_OPEN';

  //Get all Farmer List
  static Future<List<FarmerModel>?> getFarmers(String offset, String limit) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_FARMERS_ACTION;
      map['offset'] = offset;
      map['limit'] = limit;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getFarmers Response: ${response.body}');
      if (200 == response.statusCode) {
        List<FarmerModel>? list = parseResponse(response.body);
        //print('Iam here :new list called');
        return list;
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return [];
        // return List<Farmer>();
      }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return []; // return an empty list on exception/error
    }
  }

  static List<FarmerModel>? parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<FarmerModel>((json) => FarmerModel.fromJson(json)).toList();
  }

  //Get the count of farmer profiles
  static Future<String> getLength() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_COUNT_FARMER_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      //print('getFarmers Response: ${response.body}');
      //print('${response.statusCode}');
      if (200 == response.statusCode) {
        //print('Iam here :new list called');
        String newval = (response.body).replaceAll('[{"farmerRows":"', '').replaceAll('"}]','');
        return newval;
      } else {
        print(response.statusCode);
        //print('Iam here :Old list called');
        return '0';
      }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return '0'; // return an empty list on exception/error
    }
  }

  static List<FarmerCount>? parseResponseCount(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<FarmerCount>((json) => FarmerCount.fromJson(json)).toList();
  }


  //Get  Farmer List based on filter
  Future<List<FarmerModel>> getFarmersFilter(String? filter) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_FARMERS_FILTER_ACTION;
      map['filter'] = filter;
      final response = await http.post(Uri.parse(ROOT), body: map);
      //print('getFarmersFilter Response: ${response.body}');
      if (200 == response.statusCode) {
        // List<FarmerModel> list = parseResponseFilter(response.body);
        // print('Iam here :new list called');
        // print(list);
        // return list;
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        final data = parsed.map<FarmerModel>((json) => FarmerModel.fromJson(json)).toList();
        if (data != null) {
          print(data);
          return data;
        }
        else return [];
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return [];
        // return List<Farmer>();
      }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return []; // return an empty list on exception/error
    }
  }

  //
  // static List<FarmerModel> parseResponseFilter(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   final data = parsed.map<FarmerModel>((json) => FarmerModel.fromJson(json)).toList();
  //   if (data != null) {
  //     return data;
  //   }
  // }

  // Method to get ledger from the database...
  static Future<List<Ledger>?> getLedger(String? individualId) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_LEDGER_ACTION;
      map['individual_id'] = individualId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getLedger Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Ledger>? list = parseResponseLedger(response.body);
        print('Iam here :new list called');
        return list;
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return [];
      }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return []; // return an empty list on exception/error
    }
  }

  static List<Ledger>? parseResponseLedger(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    final data = parsed.map<Ledger>((json) => Ledger.fromJson(json)).toList();
    if (data != null) {
      return data;
    }

  }


  ///Get the list of farmer with open lots
  Future<List<FarmerOpenArrivals>> getFarmerListOpen(String? filter) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_OPEN_LOTS;
      map['filter'] = filter;
      final response = await http.post(Uri.parse(ROOT), body: map);
      //print('getFarmersFilter Response: ${response.body}');
      if (200 == response.statusCode) {
        // List<FarmerModel> list = parseResponseFilter(response.body);
        // print('Iam here :new list called');
        // print(list);
        // return list;
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        final data = parsed.map<FarmerOpenArrivals>((json) => FarmerOpenArrivals.fromJson(json)).toList();
        if (data != null) {
          print(data);
          return data;
        }
        else return [];
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return [];
        // return List<Farmer>();
      }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return []; // return an empty list on exception/error
    }
  }

  ///Get the list of varieties for selected farmer and arrival
  Future<List<VarietyOpenArrivals>> getAvailableVariety(String? arrivalId) async {
    try {
      var map = Map<String, dynamic>();
      print(arrivalId);
      map['action'] = _GET_VARIETY;
      map['arrivalId'] = arrivalId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getVariety List Response: ${response.body}');
      if (200 == response.statusCode) {
        // List<FarmerModel> list = parseResponseFilter(response.body);
        // print('Iam here :new list called');
        // print(list);
        // return list;
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        final data = parsed.map<VarietyOpenArrivals>((json) => VarietyOpenArrivals.fromJson(json)).toList();
        if (data != null) {
          print(data);
          return data;
        }
        else return [];
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return [];
        // return List<Farmer>();
      }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return []; // return an empty list on exception/error
    }
  }



  // Method to add farmer to the database...
  // ignore: non_constant_identifier_names
  static Future<String> addFarmer(String full_name,String father_name, String village_town_city, String pincode, String district, String state_name, String mobile_primary, String phone_secondary, String email, String govt_id_nbr, String govt_id_type, String bank_name, String bank_acct_nbr, String bank_acct_type, String ifsc_code) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_FARMER_ACTION;
      map['full_name'] = full_name;
      map['father_name'] = father_name;
      map['village_town_city'] = village_town_city;
      map['pincode'] = pincode;
      map['district'] = district;
      map['state_name'] = state_name;
      map['mobile_primary'] = mobile_primary;
      map['phone_secondary'] = phone_secondary;
      map['email'] = email;
      map['govt_id_nbr'] = govt_id_nbr;
      map['govt_id_type'] = govt_id_type;
      map['bank_name'] = bank_name;
      map['bank_acct_nbr'] = bank_acct_nbr;
      map['bank_acct_type'] = bank_acct_type;
      map['ifsc_code'] = ifsc_code;
      map['created_at'] = DateTime.now().toString();
      map['created_by'] = 'makhan';

      final response = await http.post(Uri.parse(ROOT), body: map);
      print('addFarmer Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }



  // Method to update an Farmer in Database...
  // ignore: non_constant_identifier_names
  static Future<String> updateFarmer(String? farmer_id, String full_name,String father_name, String village_town_city, String pincode, String district, String state_name, String mobile_primary, String phone_secondary, String email, String govt_id_nbr, String govt_id_type, String bank_name, String bank_acct_nbr, String bank_acct_type, String ifsc_code) async {

    print('Update farmer got called');
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_FARMER_ACTION;
      map['farmer_id'] = farmer_id;
      map['full_name'] = full_name;
      map['father_name'] = father_name;
      map['village_town_city'] = village_town_city;
      map['pincode'] = pincode;
      map['district'] = district;
      map['state_name'] = state_name;
      map['mobile_primary'] = mobile_primary;
      map['phone_secondary'] = phone_secondary;
      map['email'] = email;
      map['govt_id_nbr'] = govt_id_nbr;
      map['govt_id_type'] = govt_id_type;
      map['bank_name'] = bank_name;
      map['bank_acct_nbr'] = bank_acct_nbr;
      map['bank_acct_type'] = bank_acct_type;
      map['ifsc_code'] = ifsc_code;
      map['created_at'] = DateTime.now().toString();
      map['created_by'] = 'makhan';

      final response = await http.post(Uri.parse(ROOT), body: map);
      print('updateFarmer Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  ///Add Buyer
  static Future<String> addBuyer(String companyName,String propName, String addrLine1, String addrLine2, String city, String pincode, String district, String stateName,
      String mainNumber, String otherPhone, String email, String contactName1, String contactNbr1, String contactName2, String contactNbr2) async {

    print('$companyName');
    print('$propName');
    print('$addrLine1');
    print('$addrLine2');
    print('$city');
    print('$district');
    print('$pincode');
    print('$email');
    print('$mainNumber');
    print('$otherPhone');
    print('$contactName1');
    print('$contactNbr1');
    print('$contactName2');
    print('$contactNbr2');
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_BUYER_ACTION;
      map['company_name'] = companyName;
      map['proprietor_name'] = propName;
      map['address_line1'] = addrLine1;
      map['address_line2'] = addrLine2;
      map['city'] = city;
      map['district'] = district;
      map['address_state'] = stateName;
      map['pincode'] = pincode;
      map['email'] = email;
      map['phone_main'] = mainNumber;
      map['phone_other'] = otherPhone;
      map['contact_name1'] = contactName1;
      map['contact_number1'] = contactNbr1;
      map['contact_name2'] = contactName2;
      map['contact_number2'] = contactNbr2;
      map['modified_at'] = DateTime.now().toString();
      map['modified_by'] = 'makhan';

      final response = await http.post(Uri.parse(ROOT), body: map);
      print('addBuyer Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }


  // Method to add farmer to the database...
  // ignore: non_constant_identifier_names
  static Future<String> postTransaction(String transaction_date,String individual_id, String description_msg,String post_ref, String debit_amount, String credit_amount) async {

    print(transaction_date);
    print(individual_id);
    print(description_msg);
    print(post_ref);
    print(debit_amount);
    print(credit_amount);
    try {
      var map = Map<String, dynamic>();
      map['action'] = _POST_TRANSACTION_ACTION;
      map['transaction_date'] = transaction_date;
      map['individual_id'] = individual_id;
      map['description_msg'] = description_msg;
      map['post_ref'] = post_ref;
      map['debit_amount'] = debit_amount;
      map['credit_amount'] = credit_amount;
      map['changed_date'] = DateTime.now().toString();
      map['changed_by'] = 'makhan';
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Transaction Posted : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error status code";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> postArrival(String arrivalDate,String individualId, String nbrOfVarieties,
      String vehicleType, String nbrOfLoads, String rent, String cash,String unloading,
      String unloadingCharges,String labourGroup) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _POST_ARRIVAL;
      map['arrivalDate'] = arrivalDate;
      map['individualId'] = individualId;
      map['arrivalStatus'] = 'Open';
      map['nbrOfVarieties'] = nbrOfVarieties;
      map['vehicleType'] = vehicleType;
      map['nbrOfLoads'] = nbrOfLoads;
      map['rent'] = rent;
      map['cash'] = cash;
      map['unloading'] = unloading;
      map['unloadingCharges'] = unloadingCharges;
      map['labourGroup'] = labourGroup;
      map['changedDate'] = DateTime.now().toString();
      map['changedBy'] = 'makhan';
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Transaction Posted : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error status code";
      }
    } catch (e) {
      return "error";
    }
  }


  static Future<String> postArrivalLot(String arrivalId,String variety) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _POST_ARRIVAL_LOT;
      map['arrivalId'] = arrivalId;
      map['variety'] = variety;
      map['status'] = 'Available';
      map['modifiedDate'] = DateTime.now().toString();
      map['modifiedBy'] = 'makhan';
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Transaction Posted : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error status code";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> addLabourGroup(String leaderName,String phoneNbr,String groupSize) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_LABOUR_GROUP;
      map['leaderName'] = leaderName;
      map['phoneNbr'] = phoneNbr;
      map['groupSize'] = groupSize;
      map['modifiedAt'] = DateTime.now().toString();
      map['modifiedBy'] = 'makhan';

      final response = await http.post(Uri.parse(ROOT), body: map);
      print('addFarmer Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to get labour group record from the database...
  Future<List<LabourGroup>> getLabourGroup(String? filter) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_LABOUR_GROUP;
      map['filter1'] = filter;
      final response = await http.post(Uri.parse(ROOT), body: map);
      //print('getLabour Response: ${response.body}');
      if (200 == response.statusCode) {
        //List<LabourGroup>? list = parseResponseLabourGroup(response.body);

        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        print(parsed);
        final data = parsed.map<LabourGroup>((json) => LabourGroup.fromJson(json)).toList();
        if (data != null) {
          //print(data);
          return data;
        }
        else return [];
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return [];

      }

        ///
        ///print('Iam here :new list called');
      //   return parseResponseLabourGroup(response.body);
      // } else {
      //   print(response.statusCode);
      //   print('Iam here :Old list called');
      //   return [];
      // }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return []; // return an empty list on exception/error
    }
  }

  Future<List<BuyerModel>> getBuyer(String? filter) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_BUYER;
      map['filter1'] = filter;
      final response = await http.post(Uri.parse(ROOT), body: map);
      //print('getLabour Response: ${response.body}');
      if (200 == response.statusCode) {
        //List<LabourGroup>? list = parseResponseLabourGroup(response.body);

        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        print(parsed);
        final data = parsed.map<BuyerModel>((json) => BuyerModel.fromJson(json)).toList();
        if (data != null) {
          //print(data);
          return data;
        }
        else return [];
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return [];

      }

      ///
      ///print('Iam here :new list called');
      //   return parseResponseLabourGroup(response.body);
      // } else {
      //   print(response.statusCode);
      //   print('Iam here :Old list called');
      //   return [];
      // }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return []; // return an empty list on exception/error
    }
  }


}

class FarmerCount{
  String? farmerRows;
  FarmerCount({this.farmerRows});

  factory FarmerCount.fromJson(Map<String, dynamic> json) {
    return FarmerCount(farmerRows: json['farmerRows'] as String );
  }


List<FarmerCount> fromJsonList(List list) {
return list.map((item) => FarmerCount.fromJson(item)).toList();}
}