import 'package:flutter/cupertino.dart';

class Order {
  String id;
  DateTime orderDate;
  double totalCost;
  String userId;
  String orderNo;

  Order(
      {@required this.id,
      @required this.orderDate,
      @required this.totalCost,
      @required this.userId,
      @required this.orderNo});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDate = json['orderDate'];
    totalCost = json['totalCost'];
    userId = json['userId'];
    orderNo = json['orderNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderDate'] = this.orderDate;
    data['totalCost'] = this.totalCost;
    data['userId'] = this.userId;
    data['orderNo'] = this.orderNo;

    return data;
  }
}
