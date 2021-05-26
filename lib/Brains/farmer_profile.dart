class Farmer {
  // ignore: non_constant_identifier_names
  String farmer_id;
  // ignore: non_constant_identifier_names
  String full_name;
  // ignore: non_constant_identifier_names
  String father_name;
  // ignore: non_constant_identifier_names
  String village_town_city;
  // ignore: non_constant_identifier_names
  String pincode;
  // ignore: non_constant_identifier_names
  String district;
  // ignore: non_constant_identifier_names
  String state_name;
  // ignore: non_constant_identifier_names
  String mobile_primary;
  // ignore: non_constant_identifier_names
  String phone_secondary;
  // ignore: non_constant_identifier_names
  String email;
  // ignore: non_constant_identifier_names
  String govt_id_nbr;
  // ignore: non_constant_identifier_names
  String govt_id_type;
  // ignore: non_constant_identifier_names
  String bank_name;
  // ignore: non_constant_identifier_names
  String bank_acct_nbr;
  // ignore: non_constant_identifier_names
  String bank_acct_type;
  // ignore: non_constant_identifier_names
  String ifsc_code;
  // ignore: non_constant_identifier_names
  String created_at;
  // ignore: non_constant_identifier_names
  String created_by;

  String dummy;

  // ignore: non_constant_identifier_names
  Farmer({this.farmer_id, this.full_name,this.father_name,this.village_town_city,this.pincode,this.district,this.state_name,this.mobile_primary,this.phone_secondary,this.email,this.govt_id_nbr,this.govt_id_type,this.bank_name,this.bank_acct_nbr,this.bank_acct_type,this.ifsc_code,this.created_at, this.created_by, this.dummy});

  factory Farmer.fromJson(Map<String, dynamic> json) {
    return Farmer(
      farmer_id: json['farmer_id'] as String,
      full_name: json['full_name'] as String,
      father_name: json['father_name'] as String,
      village_town_city: json['village_town_city'] as String,
      pincode: json['pincode'] as String,
      district: json['district'] as String,
      state_name: json['state_name'] as String,
      mobile_primary: json['mobile_primary'] as String,
      phone_secondary: json['phone_secondary'] as String,
      email: json['email'] as String,
      govt_id_nbr: json['govt_id_nbr'] as String,
      govt_id_type: json['govt_id_type'] as String,
      bank_name: json['bank_name'] as String,
      bank_acct_nbr: json['bank_acct_nbr'] as String,
      bank_acct_type: json['bank_acct_type'] as String,
      ifsc_code: json['ifsc_code'] as String,
      created_at: json['created_at'] as String,
      created_by: json['created_by'] as String,
    );
  }
}
