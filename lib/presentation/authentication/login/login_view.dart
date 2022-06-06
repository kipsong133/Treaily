import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treaily/base/constants/route+constants.dart';
import 'package:treaily/presentation/authentication/auth_service.dart';

import 'login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Consumer<AuthService>(
      builder: (context, authService, child) {
        // User? user = authService.currentUser(); // 이미 로그인 되어있는지 확인하는 코드

        return Scaffold(
          body: Container(
            child: SafeArea(
              child: Column(children: [
                Spacer(
                  flex: 2,
                ),
                _logoImageContainer(),
                Spacer(
                  flex: 2,
                ),
                _emailAndPasswordTextFields(),
                SizedBox(height: 22),
                _loginButton(_emailController, _passwordController),
                Spacer(
                  flex: 1,
                ),
                TextButton(
                  onPressed: () {
                    // signUpButtonDidTap(context);
                    authService.signUp(
                      email: _emailController.text,
                      password: _passwordController.text,
                      onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('회원가입 성공'),
                        ));
                      },
                      onError: (_) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('회원가입 실패'),
                        ));
                      },
                    );
                  },
                  child: Text('회원가입'),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }

  _loginButton(TextEditingController email, TextEditingController password) {
    return Consumer<AuthService>(builder: (context, authService, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 22, right: 22),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    authService.signIn(
                      email: email.text,
                      password: password.text,
                      onSuccess: () {


                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('로그인 성공'),
                        ));
                      },
                      onError: (error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('회원가입 성공'),
                        ));
                      },
                    );
                  },
                  child: Text('로그인'),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Padding _emailAndPasswordTextFields() {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: Wrap(
        runSpacing: 12,
        children: [
          Container(
            height: 48,
            child: _loginTextField(
                title: '이메일', controller: _emailController, isPassword: false),
          ),
          Container(
            height: 48,
            child: _loginTextField(
                title: '비밀번호',
                controller: _passwordController,
                isPassword: true),
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

  signUpButtonDidTap(BuildContext context) {
    Navigator.of(context).pushNamed(TreailyRouter.signUp);
  }
}

class _loginTextField extends StatefulWidget {
  const _loginTextField({
    Key? key,
    required this.title,
    required this.controller,
    required this.isPassword,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final bool isPassword;

  @override
  State<_loginTextField> createState() => _loginTextFieldState();
}

class _loginTextFieldState extends State<_loginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // widget.controller.text = value;
      },
      controller: widget.controller,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.title,
      ),
    );
  }
}
