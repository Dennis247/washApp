import 'package:firebase_database/firebase_database.dart';
import 'package:wash_app/core/model/responseModel.dart';
import 'package:wash_app/core/model/washItem.dart';

final washItemRef = FirebaseDatabase.instance.reference().child('washItems');

class WashItemService {
  Future<ResponseModel> createWashItem(WashItem washItem) async {
    try {
      await washItemRef.child(washItem.id).set(washItem.toJson());
      return ResponseModel(
          isSucessfull: true, responseMessage: "washitem added sucessfully");
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }

  Future<ResponseModel> updateWashItem(WashItem washItem) async {
    try {
      await washItemRef.child(washItem.id).set(washItem.toJson());
      return ResponseModel(
          isSucessfull: true, responseMessage: "washitem added sucessfully");
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }

  Future<void> deleteWashItem(String id) async {
    try {
      await washItemRef.child(id).remove();
      return ResponseModel(
          isSucessfull: true, responseMessage: "washItem deleted sucessfully");
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }
}
