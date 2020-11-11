import 'package:firebase_database/firebase_database.dart';
import 'package:tuple/tuple.dart';
import 'package:wash_app/core/model/orderItem.dart';
import 'package:wash_app/core/model/responseModel.dart';

final orderItemsRef = FirebaseDatabase.instance.reference().child('orderItems');

class OrderItemService {
  Future<ResponseModel> createOrderItem(OrderItem orderItem) async {
    try {
      await orderItemsRef.child(orderItem.id).set(orderItem.toJson());
      return ResponseModel(
          isSucessfull: true, responseMessage: "order added sucessfully");
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }

  Future<Tuple2<ResponseModel, List<OrderItem>>> getOrderItemsForOrders(
      String orderId) async {
    try {
      List<OrderItem> orderItems = [];
      await orderItemsRef
          .orderByChild("orderId")
          .equalTo(orderId)
          .once()
          .then((dataSnapshot) {
        Map<dynamic, dynamic> ordersList = dataSnapshot.value;
        ordersList.forEach((key, value) {
          final orderItemValue = value as Map<String, dynamic>;
          final orderItem = OrderItem.fromJson(orderItemValue);
          orderItems.add(orderItem);
        });
      });
      return Tuple2(
          ResponseModel(
              isSucessfull: true,
              responseMessage: "orders fetched sucessfully"),
          orderItems);
    } catch (e) {
      return Tuple2(
          ResponseModel(
              isSucessfull: false, responseMessage: "orders fetched failed"),
          null);
    }
  }
}
