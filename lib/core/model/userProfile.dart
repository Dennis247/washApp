import 'package:flutter/cupertino.dart';
import 'package:wash_app/core/enum/gender.dart';

class UserProfile {
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  Gender gender;

  UserProfile(
      {@required this.id,
      @required this.firstName,
      @required this.lastName,
      @required this.phoneNumber,
      @required this.email,
      @required this.gender});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['gender'] = this.gender;
    return data;
  }
}
