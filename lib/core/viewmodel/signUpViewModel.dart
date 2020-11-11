import 'package:wash_app/core/enum/viewState.dart';
import 'package:wash_app/core/model/responseModel.dart';
import 'package:wash_app/core/model/userProfile.dart';
import 'package:wash_app/core/services/authService.dart';
import 'package:wash_app/core/services/userService.dart';
import 'package:wash_app/core/viewmodel/baseModel.dart';
import 'package:wash_app/locator.dart';

class SignUpViewModel extends BaseViewModel {
  Future<ResponseModel> signUpUser(
      UserProfile userProfile, String password) async {
    setState(ViewState.Busy);
    try {
      await locator<AuthService>().registerUser(userProfile.email, password);
      await locator<UserService>().createUserProfile(userProfile);
      setState(ViewState.Idle);
      return ResponseModel(
          isSucessfull: true, responseMessage: "signUp Sucessfull");
    } catch (e) {
      setState(ViewState.Idle);
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }
}
