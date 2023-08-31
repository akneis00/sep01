// 마지막 강의에서 급하게 수정하던 페이지. 결국 에러 해결 못해서 처음부터 다시 하는거로. 일단 이 페이지는 남겨두자. "프리즈드 해두시는게 나중에 좋으실거에요" 라고 했던듯.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// part 'UserClass.freezed.dart';
// part 'UserClass.g.dart';

// @freezed
// class User with _$User{
//   factory User({
//     required String id,
//     required String pw
// }) = _User;
//
//   factory User.fromJson(Map<String, Object?> json)
//   => _$UserFromJson(json);
//
//   const User._(); //커스텀하기 위한 조건.
//
// }
//
// @freezed
// class Report with _$Report {
//   const factory Report({
//     required String report,
//     required String rating,
//     required String date,
//   }) = _Report;
//
//   factory Report.fromJson(Map<String, Object?> json)
//   => _$ReportFromJson(json);
// }
//
// class Report {
//   final String report;
//   final String rating;
//   final String date;
//
//   Report({
//     required this.report,
//     required this.rating,
//     required this.date,
//   });
//
//   factory Report.fromFirestore(
//       DocumentSnapshot<Map<String, dynamic>> snapshot,
//       SnapshotOptions? options,
//       ) {
//     final data = snapshot.data();
//     return Report(
//       report: data?['report'],
//       rating: data?['rating'],
//       date: data?['date'],
//     );
//   }
//
//   Map<String, dynamic> toFirestore() {
//     return {
//       if (report != null) "report": report,
//       if (rating != null) "rating": rating,
//       if (date != null) "date": date,
//     };
//   }
// }