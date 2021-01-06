import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart' show LoginViewModel;

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _textController = <String, TextEditingController>{
    "email": TextEditingController(text: "dev@dev.com"),
    "password": TextEditingController(text: "password"),
  };

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textController['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value.isEmpty ? 'This field is required.' : null,
              ),
              TextFormField(
                controller: _textController['password'],
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value.isEmpty ? 'This field is required.' : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 70,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print({
                          'email': _textController['email'].text,
                          'password': _textController['password'].text
                        });

                        await model.login(
                            email: _textController['email'].text,
                            password: _textController['password'].text);
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
