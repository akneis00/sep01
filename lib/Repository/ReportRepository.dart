import 'package:cloud_firestore/cloud_firestore.dart';
import '../Classes/ReportClass.dart';

class ReportRepository {
  static const collectionName = "Report";  //리포트라는 컬렉션 내에서만 이루어지고 있는 중ㅋ

  static FirebaseFirestore _db() => FirebaseFirestore.instance;  //DB 접근하기

   static CollectionReference<Report> _cRef() =>          //리포트라는 컬렉션에 접근하기.
      _db().collection(collectionName).withConverter(     // 여기에서 컬렉션 이름을 아예 박아놓음.
        fromFirestore: Report.fromFirestore,
        toFirestore: (Report report, options) => report.toFirestore(),
      );

  static DocumentReference<Report> _dRef([String? documentId]) =>
      _cRef().doc(documentId);

  static Future<void> create(Report report,
      {SetOptions? options}) async {
    await _dRef().set(report, options);
  }

  static Future<void> update(Report report,
      {required String documentId, SetOptions? options}) async {
    await _dRef(documentId).set(report, options);
  }

  static Future<void> delete(Report report, {required String documentId}) async {
    await _dRef(documentId).delete();
  }

  static Future<Report?> get({required String documentId}) async {
    DocumentSnapshot<Report> reportSnapshot = await _dRef(documentId).get();
    Report? report = reportSnapshot.data();
    return report;
  }

  static Future<List<Report>> getList(
      Object field, {
        Object? isEqualTo,
        Object? isNotEqualTo,
        Object? isLessThan,
        Object? isLessThanOrEqualTo,
        Object? isGreaterThan,
        Object? isGreaterThanOrEqualTo,
        Object? arrayContains,
        List<Object?>? arrayContainsAny,
        List<Object?>? whereIn,
        List<Object?>? whereNotIn,
        bool? isNull,
      }) async {
    Query<Report> query = _cRef().where(
      field,
      isEqualTo: isEqualTo,
      isNotEqualTo: isNotEqualTo,
      isLessThan: isLessThan,
      isLessThanOrEqualTo: isLessThanOrEqualTo,
      isGreaterThan: isGreaterThan,
      isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
      arrayContains: arrayContains,
      arrayContainsAny: arrayContainsAny,
      whereIn: whereIn,
      whereNotIn: whereNotIn,
      isNull: isNull,
    );
    QuerySnapshot<Report> querySnapshot = await query.get();

    //queryDocumentSnapshotList는 Query를 통해 얻은 QueryDocumentSnapshot의 List이다.
    List<QueryDocumentSnapshot<Report>> queryDocumentSnapshotList =
        querySnapshot.docs;
    //queryDocumentSnapshotList -> reportList로 변환 필요
    List<Report> reportList =
    queryDocumentSnapshotList.map((e) => e.data()).toList();

    return reportList;
  }
}