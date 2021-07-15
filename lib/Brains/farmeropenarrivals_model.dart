class FarmerOpenArrivals {

  String? farmerId;
  String? fullName;
  String? fatherName;
  String? villageTownCityName;
  String? mobilePrimary;
  String? farmerIdExt;
  String? arrivalId;


  FarmerOpenArrivals({this.farmerId, this.fullName,this.fatherName,this.villageTownCityName,this.mobilePrimary, this.farmerIdExt,this.arrivalId});

  factory FarmerOpenArrivals.fromJson(Map<String, dynamic> json) {
    return FarmerOpenArrivals(
        farmerId: json['farmer_id'] as String?,
        fullName: json['full_name'] as String?,
        fatherName: json['father_name'] as String?,
        villageTownCityName: json['village_town_city'] as String?,
        mobilePrimary: json['mobile_primary'] as String?,
        farmerIdExt: json['farmer_id_ext'] as String?,
        arrivalId: json['arrival_id'] as String?
    );
  }

  static List<FarmerOpenArrivals> fromJsonList(List list) {
    return list.map((item) => FarmerOpenArrivals.fromJson(item)).toList();
  }
  //this method will prevent the override of toString
  String userAsString() {
    return '#${this.farmerId} ${this.fullName}';
  }


  ///custom comparing function to check if two users are equal
  bool isEqual(FarmerOpenArrivals? model) {
    return this.farmerId == model?.farmerId;
  }

  @override
  String toString() => fullName!;

}
