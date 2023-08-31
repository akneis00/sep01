// firestor 단일로 읽어오는 거 계속 try하다가 결국 실패하고 fromfirestore tofirestore로 복귀함-_-...

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String userName;

  User({
    required this.email,
    required this.userName,
});
  factory User.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return User(
      email: data?['email'],
      userName: data?['userName'],
    );
  }

  Map<String, dynamic> toFirestore(){
    return{
      if (email != null) "email": email,
      if (userName != null) "userName": userName,
    };
  }
}