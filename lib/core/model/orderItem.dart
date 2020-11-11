class OrderItem {
  String id;
  String washItemId;
  double cost;
  double quantity;
  String orderId;

  OrderItem({this.id, this.washItemId, this.cost, this.quantity, this.orderId});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    washItemId = json['washItemId'];
    cost = json['cost'];
    quantity = json['quantity'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['washItemId'] = this.washItemId;
    data['cost'] = this.cost;
    data['quantity'] = this.quantity;
    data['orderId'] = this.orderId;
    return data;
  }
}
