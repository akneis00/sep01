import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  final String report;
  final String rating;
  final String date;

  Report({
    required this.report,
    required this.rating,
    required this.date,
  });

  factory Report.fromFirestore(   //리포트.프롬파스를 팩토리로 여기서 정의하는 것 같네
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Report(
      report: data?['report'],
      rating: data?['rating'],
      date: data?['date'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (report != null) "report": report,
      if (rating != null) "rating": rating,
      if (date != null) "date": date,
    };
  }
}