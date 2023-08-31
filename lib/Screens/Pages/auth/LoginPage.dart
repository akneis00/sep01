import 'package:c_proto/Screens/Pages/layout/MainLayout.dart';
import 'package:c_proto/Screens/Pages/auth/SignUpPage.dart';
import 'package:flutter/material.dart';

import '../../../Utils/AuthUtil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _myEmailController = TextEditingController();
  final _myPasswordController = TextEditingController();

  bool isLoading = true;

  //230301 투두에서 사용한 서클인디케이터. Async를 써야하니 로긴 구현시점에 공부해서 완성하자
  void _submit() {
    final email = _myEmailController.text;
    final password = _myPasswordController.text;

    if (email.isEmpty) {
      _showErrorDialog('이메일을 입력해주세요.');
      return;
    }

    if (password.isEmpty) {
      _showErrorDialog('비밀번호를 입력해주세요.');
      return;
    }
    AuthUtil.login(context, email, password);
  }

  @override
  Widget build(BuildContext context) {
    // if(!isLoading) {
    //   return const Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 535,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "RepTrack",
                    style: TextStyle(
                        fontSize: 60,
                        fontFamily: 'SpokaHan',
                        fontWeight: FontWeight.w100,
                        height: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _myEmailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'e-mail',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _myPasswordController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'password', ),obscureText: true,
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                child: Text("Log In",
                                    style: TextStyle(fontSize: 20)),
                                onPressed: _submit,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                child: Text("비밀번호 분실"),
                                onPressed: () {},
                              ),
                              TextButton(
                                  child: Text(
                                    "가입하기",
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPage()));
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
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
}
