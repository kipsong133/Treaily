import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(children: [
            Spacer(),
            _logoImageContainer(),
            Spacer(),
            _emailAndPasswordTextFields(),
            SizedBox(height: 22),
            _loginButton(viewModel),
            Spacer(),
          ]),
        ),
      ),
    );
  }

  Padding _loginButton(LoginViewModel viewModel) {
    return Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('로그인'),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Padding _emailAndPasswordTextFields() {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: Wrap(
        runSpacing: 12,
        children: [
          Container(
            height: 48,
            child: _loginTextField(title: '이메일'),
          ),
          Container(
            height: 48,
            child: _loginTextField(title: '비밀번호'),
          ),
        ],
      ),
    );
  }

  Container _logoImageContainer() {
    return Container(
      child: Placeholder(),
      width: 200,
      height: 200,
    );
  }
}

class _loginTextField extends StatefulWidget {
  const _loginTextField({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<_loginTextField> createState() => _loginTextFieldState();
}

class _loginTextFieldState extends State<_loginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.title,
      ),
    );
  }
}
