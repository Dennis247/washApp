import 'package:firebase_database/firebase_database.dart';
import 'package:tuple/tuple.dart';
import 'package:wash_app/core/model/order.dart';
import 'package:wash_app/core/model/responseModel.dart';

final orderRef = FirebaseDatabase.instance.reference().child('orders');

class OrderService {
  Future<ResponseModel> createOrder(Order order) async {
    try {
      await orderRef.child(order.id).set(order.toJson());
      return ResponseModel(
          isSucessfull: true, responseMessage: "order added sucessfully");
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }

  Future<Tuple2<ResponseModel, List<Order>>> getUserOrders(
      String userId) async {
    try {
      List<Order> orders = [];
      await orderRef
          .orderByChild("userId")
          .equalTo(userId)
          .once()
          .then((dataSnapshot) {
        Map<dynamic, dynamic> ordersList = dataSnapshot.value;
        ordersList.forEach((key, value) {
          final orderValue = value as Map<String, dynamic>;
          final order = Order.fromJson(orderValue);
          orders.add(order);
        });
      });

      return Tuple2(
          ResponseModel(
              isSucessfull: true,
              responseMessage: "orders fetched sucessfully"),
          orders);
    } catch (e) {
      return Tuple2(
          ResponseModel(
              isSucessfull: true, responseMessage: "orders fetched failed"),
          null);
    }
  }
}
