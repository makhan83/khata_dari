class FarmerModel {

  String? farmerId;
  String? fullName;
  String? fatherName;
  String? villageTownCityName;
  String? pincode;
  String? district;
  String? stateName;
  String? mobilePrimary;
  String? phoneSecondary;
  String? email;
  String? govtIdNbr;
  String? govtIdType;
  String? bankName;
  String? bankAcctNbr;
  String? bankAcctType;
  String? ifscCode;
  String? createdAt;
  String? createdBy;
  String? farmerIdExt;


  String? dummy;

  // ignore: non_constant_identifier_names
  FarmerModel({this.farmerId, this.fullName,this.fatherName,this.villageTownCityName,this.pincode,this.district,this.stateName,this.mobilePrimary,this.phoneSecondary,this.email,this.govtIdNbr,this.govtIdType,this.bankName,this.bankAcctNbr,this.bankAcctType,this.ifscCode,this.createdAt, this.createdBy, this.farmerIdExt,this.dummy});

  factory FarmerModel.fromJson(Map<String, dynamic> json) {
    return FarmerModel(
      farmerId: json['farmer_id'] as String?,
      fullName: json['full_name'] as String?,
      fatherName: json['father_name'] as String?,
      villageTownCityName: json['village_town_city'] as String?,
      pincode: json['pincode'] as String?,
      district: json['district'] as String?,
      stateName: json['state_name'] as String?,
      mobilePrimary: json['mobile_primary'] as String?,
      phoneSecondary: json['phone_secondary'] as String?,
      email: json['email'] as String?,
      govtIdNbr: json['govt_id_nbr'] as String?,
      govtIdType: json['govt_id_type'] as String?,
      bankName: json['bank_name'] as String?,
      bankAcctNbr: json['bank_acct_nbr'] as String?,
      bankAcctType: json['bank_acct_type'] as String?,
      ifscCode: json['ifsc_code'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      farmerIdExt: json['farmer_id_ext'] as String?

    );
  }

  static List<FarmerModel> fromJsonList(List list) {
    return list.map((item) => FarmerModel.fromJson(item)).toList();
  }
  //this method will prevent the override of toString
  String userAsString() {
    return '#${this.farmerId} ${this.fullName}';
  }

  ///this method will prevent the override of toString
  bool? userFilterByCreationDate(String filter) {
    return this.createdAt?.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(FarmerModel? model) {
    return this.farmerId == model?.farmerId;
  }

  @override
  String toString() => fullName!;

}
