class LabourGroup{
  String? groupId;
  String? leaderName;
  String? phoneNbr;
  String? groupSize;
  String? modifiedAt;
  String? modifiedBy;
  String? groupIdExt;

  LabourGroup({this.groupId,this.leaderName,this.phoneNbr,this.groupSize,this.modifiedAt,this.modifiedBy,this.groupIdExt});

  factory LabourGroup.fromJson(Map<String, dynamic> json) {
    return LabourGroup(
      groupId:  json['group_id'] as String?,
      leaderName: json['leader_name'] as String?,
      phoneNbr: json['phone_number'] as String?,
      groupSize: json['group_size'] as String?,
      modifiedAt: json['modified_at'] as String?,
      modifiedBy: json['modified_by'] as String?,
      groupIdExt: json['group_id_ext'] as String?
    );
  }

  static List<LabourGroup> fromJsonList(List list) {
    return list.map((item) => LabourGroup.fromJson(item)).toList();
  }

  String userAsString() {
    return '#${this.groupId} ${this.leaderName}';
  }

  ///this method will prevent the override of toString
  bool? userFilterByCreationDate(String filter) {
    return this.modifiedAt?.toString().contains(filter);
  }


  bool isEqual(LabourGroup? model) {
    return this.groupId == model?.groupId;
  }

  @override
  String toString() => leaderName!;
}

