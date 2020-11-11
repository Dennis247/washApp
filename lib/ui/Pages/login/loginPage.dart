import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:wash_app/core/viewmodel/loginViewModel.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
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
                        onPressed: () async {
                          var response = await model.login(
                              _emailController.text, _passwordController.text);
                          Toast.show(response.responseMessage, context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                        },
                        child: Text("login"),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
