import 'package:wash_app/core/enum/serviceType.dart';

class WashItem {
  String id;
  ServiceType serviceTye;
  double price;

  WashItem({
    this.id,
    this.serviceTye,
    this.price,
  });

  WashItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceTye = json['serviceTye'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceTye'] = this.serviceTye;
    data['price'] = this.price;
    return data;
  }
}
