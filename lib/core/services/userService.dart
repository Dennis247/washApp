import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:tuple/tuple.dart';
import 'package:wash_app/core/model/responseModel.dart';
import 'package:wash_app/core/model/userProfile.dart';

final userProfileRef =
    FirebaseDatabase.instance.reference().child('userProfiles');

class UserService {
  Future<Tuple2<ResponseModel, UserProfile>> getProfileForUser(
      String id) async {
    try {
      final dataSnapShot = await userProfileRef.child(id).once();
      final userProfileValue = dataSnapShot.value as Map<String, dynamic>;
      UserProfile userProfile = UserProfile.fromJson(userProfileValue);
      return Tuple2(
          ResponseModel(
              isSucessfull: true,
              responseMessage: "profile gotten sucessfully"),
          userProfile);
    } catch (e) {
      return Tuple2(
          ResponseModel(
              isSucessfull: true,
              responseMessage: "profile gotten sucessfully"),
          null);
    }
  }

  Future<ResponseModel> createUserProfile(UserProfile profile) async {
    try {
      await userProfileRef.child(profile.id).set(profile.toJson());
      return ResponseModel(
          isSucessfull: true, responseMessage: "profile added sucessfully");
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }

  Future<ResponseModel> updateUserProfile(UserProfile profile) async {
    try {
      await userProfileRef.child(profile.id).update(profile.toJson());
      return ResponseModel(
          isSucessfull: true, responseMessage: "profile updated sucessfully");
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }
}
