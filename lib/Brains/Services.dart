import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.
import 'package:khata_dari/Brains/ledger_class.dart';
import 'farmer_profile.dart';
import 'ledger_class.dart';
import 'farmer_model.dart';

class Services {
  //static const ROOT = 'http://192.168.1.2:80/MMSDB/mms_action.php';
  static const ROOT = 'http://localhost:80/MMSDB/mms_action.php';

  //static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_FARMERS_ACTION = 'GET_ALL_FARMERS';
  static const _ADD_FARMER_ACTION = 'ADD_FARMER';
  static const _UPDATE_FARMER_ACTION = 'UPDATE_FARMER';
  static const _GET_LEDGER_ACTION = 'GET_LEDGER';
  static const _GET_FARMERS_FILTER_ACTION = 'GET_FILTER_FARMERS';
  static const _POST_TRANSACTION_ACTION = 'POST_TRANSACTION';


  //Get all Farmer List
  static Future<List<FarmerModel>?> getFarmers() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_FARMERS_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getFarmers Response: ${response.body}');
      if (200 == response.statusCode) {
        List<FarmerModel>? list = parseResponse(response.body);
        print('Iam here :new list called');
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

  //Get  Farmer List based on filter
  Future<List<FarmerModel>> getFarmersFilter(String? filter) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_FARMERS_FILTER_ACTION;
      map['filter'] = filter;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getFarmersFilter Response: ${response.body}');
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
  static Future<String> updateFarmer(String farmer_id, String full_name,String father_name, String village_town_city, String pincode, String district, String state_name, String mobile_primary, String phone_secondary, String email, String govt_id_nbr, String govt_id_type, String bank_name, String bank_acct_nbr, String bank_acct_type, String ifsc_code) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_FARMER_ACTION;
      map['farmer_id'] = farmer_id;
      map['fullname'] = full_name;
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
}





  // Method to Delete an Farmer from Database...
//   static Future<String> deleteFarmer(String empId) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _DELETE_FARMER_ACTION;
//       map['farmer_id'] = farmer_id;
//       final response = await http.post(ROOT, body: map);
//       print('deleteFarmer Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         return "error";
//       }
//     } catch (e) {
//       return "error"; // returning just an "error" string to keep this simple...
//     }
//   }
