class VarietyOpenArrivals {

  String? variety;
  String? lotStatus;



  VarietyOpenArrivals({this.variety,this.lotStatus});

  factory VarietyOpenArrivals.fromJson(Map<String, dynamic> json) {
    return VarietyOpenArrivals(
        variety: json['variety'] as String?,
        lotStatus: json['lot_status'] as String?

    );
  }

  static List<VarietyOpenArrivals> fromJsonList(List list) {
    return list.map((item) => VarietyOpenArrivals.fromJson(item)).toList();
  }
  //this method will prevent the override of toString
  // String userAsString() {
  //   return '#${this.farmerId} ${this.fullName}';
  // }


  ///custom comparing function to check if two users are equal
  bool isEqual(VarietyOpenArrivals? model) {
    return this.variety == model?.variety;
  }

  @override
  String toString() => variety!;

}
