class BuyerModel {
  String? buyerId;
  String? buyerIdExt;
  String? companyName;
  String? proprietorName;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? district;
  String? addressState;
  String? pincode;
  String? phoneMain;
  String? phoneOther;
  String? email;
  String? contactName1;
  String? contactNbr1;
  String? contactName2;
  String? contactNbr2;
  String? modifiedAt;
  String? modifiedBy;

  // ignore: non_constant_identifier_names
  BuyerModel({this.buyerId,this.buyerIdExt,this.companyName,this.proprietorName,this.addressLine1,this.addressLine2,this.city,this.district,this.addressState,this.pincode,this.phoneMain,
  this.phoneOther,this.email,this.contactName1,this.contactNbr1,this.contactName2,this.contactNbr2,this.modifiedAt,this.modifiedBy});

  factory BuyerModel.fromJson(Map<String, dynamic> json) {
    return BuyerModel(
        buyerId: json['buyer_id'] as String?,
        buyerIdExt: json['buyer_id_ext'] as String?,
        companyName: json['company_name'] as String?,
        proprietorName: json['proprietor_name'] as String?,
        pincode: json['pincode'] as String?,
        addressLine1: json['address_line_1'] as String?,
        addressLine2: json['address_line_2'] as String?,
        city: json['city'] as String?,
        district: json['district'] as String?,
        addressState: json['address_state'] as String?,
        phoneMain: json['phone_main'] as String?,
        phoneOther: json['phone_other'] as String?,
        email: json['email'] as String?,
        contactName1: json['contact_name1'] as String?,
        contactNbr1: json['contact_number1'] as String?,
        contactName2: json['contact_name2'] as String?,
        contactNbr2: json['contact_number2'] as String?,
        modifiedAt: json['modified_at'] as String?,
        modifiedBy: json['modified_by'] as String?,


    );
  }

  static List<BuyerModel> fromJsonList(List list) {
    return list.map((item) => BuyerModel.fromJson(item)).toList();
  }
  //this method will prevent the override of toString
  String userAsString() {
    return '#${this.buyerId} ${this.companyName}';
  }

  ///this method will prevent the override of toString
  bool? userFilterByCreationDate(String filter) {
    return this.modifiedAt?.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(BuyerModel? model) {
    return this.buyerId == model?.buyerId;
  }

  @override
  String toString() => companyName!;

}
