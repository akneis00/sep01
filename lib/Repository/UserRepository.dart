//무지성으로 과외에서 배운 ReportRepository를 user에 대응해서 작성한 페이지.
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Classes/UserClass.dart';

class UserRepository {
  static const collectionName = 'user';

  static FirebaseFirestore _db() => FirebaseFirestore.instance;

  static CollectionReference<User> _cRef() =>
      _db().collection(collectionName).withConverter(
            fromFirestore: User.fromFirestore,
            toFirestore: (User user, options) => user.toFirestore(),
          );

  static DocumentReference<User> _dRef([String? documentID]) =>
      _cRef().doc(documentID);

  static Future<void> create(User user, {SetOptions? options}) async {
    await _dRef().set(user, options);
  }

  static Future<void> update(User user,
      {required String documentID, SetOptions? options}) async {
    await _dRef(documentID).set(user, options);
  }

  static Future<void> delete(User user, {required String documentId}) async {
    await _dRef(documentId).delete();
  }

  static Future<User?> get({required String documentId}) async {
    DocumentSnapshot<User> reportSnapshot = await _dRef(documentId).get();
    User? user = reportSnapshot.data();
    return user;
  }

  static Future<List<User>> getList(
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
    Query<User> query = _cRef().where(
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
    QuerySnapshot<User> querySnapshot = await query.get();

    List<QueryDocumentSnapshot<User>> queryDocumentSnapshotList =
        querySnapshot.docs;
    List<User> userList =
        queryDocumentSnapshotList.map((e) => e.data()).toList();

    return userList;
  }
}
