import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/Pages/layout/MainLayout.dart';

//인증에 관해서 쓰는 도구.
class AuthUtil {
  static void register(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('회원가입 되었습니다.')));
    } on FirebaseAuthException catch (e) {
      // FirebaseAuthException 예외 발생
      String message;
      if (e.code == 'weak-password') {
        message = '비밀번호 보안이 취약합니다.';
      } else if (e.code == 'email-already-in-use') {
        message = '이미 사용 중인 이메일 주소입니다.';
      } else if (e.code == 'invalid-email') {
        message = '유효하지 않은 이메일 주소입니다.';
      } else {
        message = '회원가입 중 오류가 발생했습니다.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // SnackBar를 사용하여 예외 메시지를 사용자에게 보여줌
          content: Text(message),
        ),
      );
    }
  }

  static void login(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Mainlayout()));

    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = '존재하지 않는 사용자입니다.';
      } else if (e.code == 'wrong-password') {
        message = '비밀번호가 일치하지 않습니다.';
      } else if (e.code == 'invalid-email') {
        message = '유효하지 않은 이메일 주소입니다.';
      } else {
        message = '로그인 중 오류가 발생했습니다.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        // SnackBar를 사용하여 예외 메시지를 사용자에게 보여줌
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  static bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    final isValid = regex.hasMatch(email);

    return isValid;
  }

}
