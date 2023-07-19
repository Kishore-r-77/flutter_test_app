class PolicyModel {
  PolicyModel({required this.id, required this.prcd, required this.pproduct});
  int? id;
  String? prcd;
  String? pproduct;

  PolicyModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    prcd = json['PRCD'];
    pproduct = json['PProduct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = id;
    data['PRCD'] = prcd;
    data['PProduct'] = pproduct;

    return data;
  }
}
