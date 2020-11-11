import 'package:wash_app/core/enum/gender.dart';
import 'package:wash_app/core/enum/serviceType.dart';
import 'package:wash_app/core/model/washItem.dart';

class CartItem {
  WashItem washItem;
  int quantity;

  CartItem({this.washItem, this.quantity});

  CartItem.fromJson(Map<String, dynamic> json) {
    washItem = json['washItem'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['washItem'] = this.washItem;
    data['quantity'] = this.quantity;

    return data;
  }
}
