import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wash_app/core/model/responseModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  User get user {
    return _user;
  }

  Future<ResponseModel> registerUser(String email, String password) async {
    try {
      final User signUpUSer = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (signUpUSer != null) {
        _user = signUpUSer;
        return ResponseModel(
            isSucessfull: true, responseMessage: "user sign up sucessfull");
      } else {
        return ResponseModel(
            isSucessfull: true, responseMessage: "user signUp failed");
      }
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }

  Future<ResponseModel> loginUser(String email, String password) async {
    try {
      final User loggedUser = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      _user = loggedUser;
      return ResponseModel(
          isSucessfull: true, responseMessage: "login sucessfull");
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }

  Future<ResponseModel> signOut() async {
    try {
      await _auth.signOut();
      return ResponseModel(
          isSucessfull: true, responseMessage: "sign out sucessfull");
    } catch (e) {
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }

  Future<void> storeAutoLoggedData() async {
    String token;
    DateTime expiryDate;
    await _user.getIdTokenResult().then(
        (value) => {token = value.token, expiryDate = value.expirationTime});
    final sharedPrefs = await SharedPreferences.getInstance();
    final userData = json
        .encode({'token': token, 'expiryDate': expiryDate.toIso8601String()});

    sharedPrefs.setString('userData', userData);
  }

  Future<bool> tryAutoLogin() async {
    final sharedPref = await SharedPreferences.getInstance();
    if (!sharedPref.containsKey('userData')) {
      return false;
    }
    final sharedData = sharedPref.getString('userData');
    final extractedUserData = json.decode(sharedData) as Map<String, Object>;
    final exipiryDate = DateTime.parse(extractedUserData['expiryDate']);
    if (exipiryDate.isBefore(DateTime.now())) return false;
    String token = extractedUserData['token'];
    final User loggedUser = (await _auth.signInWithCustomToken(token)).user;
    _user = loggedUser;
    return true;
  }
}
