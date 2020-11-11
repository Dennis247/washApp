import 'package:wash_app/core/enum/viewState.dart';
import 'package:wash_app/core/model/responseModel.dart';
import 'package:wash_app/core/services/authService.dart';
import 'package:wash_app/core/viewmodel/baseModel.dart';
import 'package:wash_app/locator.dart';

class LoginViewModel extends BaseViewModel {
  Future<ResponseModel> login(String email, String password) async {
    setState(ViewState.Busy);
    try {
      final response = await locator<AuthService>().loginUser(email, password);
      setState(ViewState.Idle);
      return response;
    } catch (e) {
      setState(ViewState.Idle);
      return ResponseModel(isSucessfull: false, responseMessage: e.toString());
    }
  }
}
