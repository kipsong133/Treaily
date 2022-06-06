import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  // 현재 유저
  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  void signUp({
    // 회원가입
    required String email,
    required String password,
    required Function onSuccess,
    required Function(String error) onError,
  }) async {
    if (email.isEmpty) {
      onError('이메일을 입력해주세요.');
      return;
    }

    if (password.isEmpty) {
      onError('비밀번호를 입력해주세요.');
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      onSuccess();

    } on FirebaseAuthException catch (error) {
      onError(error.message ?? '');

    } catch (error) {
      onError(error.toString());
    }

  }

  void signIn({ // 로그인
    required String email,
    required String password,
    required Function onSuccess,
    required Function(String error) onError,
  }) async {
    if (email.isEmpty) {
      onError('이메일을 입력해주세요.');
      return;
    }

    if (password.isEmpty) {
      onError('비밀번호를 입력해주세요.');
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      onSuccess();
      notifyListeners();

    } on FirebaseAuthException catch(error) {
      onError(error.message ?? '');

    } catch (error) {
      onError(error.toString());
    }
  }

  void signOut() async { // 로그아웃
    await FirebaseAuth.instance.signOut();
    notifyListeners();
    // TODO: 로그아웃 기능 구현하는 곳에 아래 코드 작성할 것
    // context.read<AuthSerivce>().signOut();
  }
}
