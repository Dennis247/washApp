import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';
import 'package:wash_app/core/enum/gender.dart';
import 'package:wash_app/core/model/userProfile.dart';
import 'package:wash_app/core/viewmodel/loginViewModel.dart';
import 'package:wash_app/core/viewmodel/signUpViewModel.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPassword = new TextEditingController();
  final TextEditingController _firstNameController =
      new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _phoneNumberController =
      new TextEditingController();
  Gender _gender;

  _signUpUser(SignUpViewModel model) async {
    final userProfile = UserProfile(
        id: Uuid().v4(),
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        phoneNumber: _phoneNumberController.text,
        email: _emailController.text,
        gender: _gender);
    final response =
        await model.signUpUser(userProfile, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpViewModel>(
        builder: (context, model, widget) => Scaffold(
              appBar: AppBar(),
              body: Container(
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                      ),
                      TextFormField(
                        controller: _passwordController,
                      ),
                      MaterialButton(
                        onPressed: () async {},
                        child: Text("login"),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
