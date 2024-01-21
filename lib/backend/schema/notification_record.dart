import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "n_user" field.
  DocumentReference? _nUser;
  DocumentReference? get nUser => _nUser;
  bool hasNUser() => _nUser != null;

  // "n_title" field.
  String? _nTitle;
  String get nTitle => _nTitle ?? '';
  bool hasNTitle() => _nTitle != null;

  // "n_body" field.
  String? _nBody;
  String get nBody => _nBody ?? '';
  bool hasNBody() => _nBody != null;

  // "n_readed" field.
  bool? _nReaded;
  bool get nReaded => _nReaded ?? false;
  bool hasNReaded() => _nReaded != null;

  // "n_date" field.
  DateTime? _nDate;
  DateTime? get nDate => _nDate;
  bool hasNDate() => _nDate != null;

  // "n_author" field.
  String? _nAuthor;
  String get nAuthor => _nAuthor ?? '';
  bool hasNAuthor() => _nAuthor != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nUser = snapshotData['n_user'] as DocumentReference?;
    _nTitle = snapshotData['n_title'] as String?;
    _nBody = snapshotData['n_body'] as String?;
    _nReaded = snapshotData['n_readed'] as bool?;
    _nDate = snapshotData['n_date'] as DateTime?;
    _nAuthor = snapshotData['n_author'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('notification')
          : FirebaseFirestore.instance.collectionGroup('notification');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('notification').doc();

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DocumentReference? nUser,
  String? nTitle,
  String? nBody,
  bool? nReaded,
  DateTime? nDate,
  String? nAuthor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'n_user': nUser,
      'n_title': nTitle,
      'n_body': nBody,
      'n_readed': nReaded,
      'n_date': nDate,
      'n_author': nAuthor,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.nUser == e2?.nUser &&
        e1?.nTitle == e2?.nTitle &&
        e1?.nBody == e2?.nBody &&
        e1?.nReaded == e2?.nReaded &&
        e1?.nDate == e2?.nDate &&
        e1?.nAuthor == e2?.nAuthor;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality()
      .hash([e?.nUser, e?.nTitle, e?.nBody, e?.nReaded, e?.nDate, e?.nAuthor]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
