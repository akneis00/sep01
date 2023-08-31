import 'package:c_proto/Utils/AuthUtil.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  Future<void> _submit() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final name = _nameController.text;

    if (email.isEmpty) {
      _showErrorDialog('이메일을 입력해주세요. ');
      return;
    }
    if (!AuthUtil.isValidEmail(email)) {
      _showErrorDialog('올바른 이메일 형식이 아닙니다.');
      return;
    }
    if (password.isEmpty) {
      _showErrorDialog('비밀번호를 입력해주세요.');
      return;
    }
    if (confirmPassword.isEmpty) {
      _showErrorDialog('비밀번호 확인을 입력해주세요.');
      return;
    }
    if (password != confirmPassword) {
      _showErrorDialog('비밀번호가 일치하지 않습니다.');
      return;
    }
    if (name.isEmpty) {
      _showErrorDialog('이름을 입력해 주세요');
      return;
    }

    AuthUtil.register(context, email, password); //이멜 PW가 모두 에러 없으면 서버에 저장.
    await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).set(
        {'userName':name,
        'email':email,
        'uid':FirebaseAuth.instance.currentUser!.uid});
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('오류'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('확인'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign-In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail: used as ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'User Name (Real Name is required)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                // color: Colors.blue,
                // textColor: Colors.white,
                // padding: EdgeInsets.symmetric(vertical: 16.0),
                child: const Text('회원가입'),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}