class Employee {
  String id;
  String fullname;
  String village_town;
  String dummy;

  Employee({this.id, this.fullname, this.village_town,this.dummy});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as String,
      fullname: json['fullname'] as String,
      village_town: json['village_town'] as String,
    );
  }
}