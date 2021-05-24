import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.
import 'farmer_profile.dart';

class Services {
  //static const ROOT = 'http://192.168.1.2:80/MMSDB/mms_action.php';
  static const ROOT = 'http://localhost:80/MMSDB/mms_action.php';
  //static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_EMP_ACTION = 'ADD_EMP';
  static const _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  //static const _DELETE_EMP_ACTION = 'DELETE_EMP';

  // Method to create the table Employees.
  // static Future<String> createTable() async {
  //   try {
  //     // add the parameters to pass to the request.
  //     var map = Map<String, dynamic>();
  //     map['action'] = _CREATE_TABLE_ACTION;
  //     final response = await http.post(ROOT, body: map);
  //     print('Create Table Response: ${response.body}');
  //     if (200 == response.statusCode) {
  //       return response.body;
  //     } else {
  //       return "error";
  //     }
  //   } catch (e) {
  //     return "error";
  //   }
  // }

  static Future<List<Employee>> getEmployees() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('getEmployees Response: ${response.body}');
      if (200 == response.statusCode) {
        //List<Employee>.from(parseResponse(response.body),growable: true);
        List<Employee>  list = parseResponse(response.body);
        print('Iam here :new list called');
        return list;
      } else {
        print(response.statusCode);
        print('Iam here :Old list called');
        return List<Employee>();
      }
    } catch (e) {
      print('Iam here :Errored Old list called');
      print(e);
      return List<Employee>(); // return an empty list on exception/error
    }
  }

  static List<Employee> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }

  // Method to add employee to the database...
  static Future<String> addEmployee(String fullname, String village_town) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_EMP_ACTION;
      map['fullname'] = fullname;
      map['village_town'] = village_town;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('addEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to update an Employee in Database...
  static Future<String> updateEmployee(
      String farmerid, String fullname, String village_town) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_EMP_ACTION;
      map['farmer_id'] = farmerid;
      map['fullname'] = fullname;
      map['village_town'] = village_town;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('updateEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to Delete an Employee from Database...
//   static Future<String> deleteEmployee(String empId) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _DELETE_EMP_ACTION;
//       map['emp_id'] = empId;
//       final response = await http.post(ROOT, body: map);
//       print('deleteEmployee Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         return "error";
//       }
//     } catch (e) {
//       return "error"; // returning just an "error" string to keep this simple...
//     }
//   }
}