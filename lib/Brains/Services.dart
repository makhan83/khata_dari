import 'dart:convert';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.
import 'package:khata_dari/Brains/ledger_class.dart';
import 'farmer_profile.dart';
import 'ledger_class.dart';

class Services {
  //static const ROOT = 'http://192.168.1.2:80/MMSDB/mms_action.php';
  static const ROOT = 'http://localhost:80/MMSDB/mms_action.php';

  //static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_FARMERS_ACTION = 'GET_ALL_FARMERS';
  static const _ADD_FARMER_ACTION = 'ADD_FARMER';
  static const _UPDATE_FARMER_ACTION = 'UPDATE_FARMER';
  static const _GET_LEDGER_ACTION = 'GET_LEDGER';

  //static const _DELETE_FARMER_ACTION = 'DELETE_FARMER';

  static Future<List<Farmer>> getFarmers() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_FARMERS_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getFarmers Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Farmer> list = parseResponse(response.body);
        print('Iam here :new list called');
        return list;
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return List<Farmer>();
      }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return List<Farmer>(); // return an empty list on exception/error
    }
  }

  static List<Farmer> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Farmer>((json) => Farmer.fromJson(json)).toList();
  }

  // Method to get ledger from the database...
  static Future<List<Ledger>> getLedger(String individualId) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_LEDGER_ACTION;
      map['individual_id'] = individualId;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getLedger Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Ledger> list = parseResponseLedger(response.body);
        print('Iam here :new list called');
        return list;
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return List<Ledger>();
      }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return List<Ledger>(); // return an empty list on exception/error
    }
  }

  static List<Ledger> parseResponseLedger(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Ledger>((json) => Ledger.fromJson(json)).toList();
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
