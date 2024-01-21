import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerComentsRecord extends FirestoreRecord {
  AnswerComentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "news_Ref" field.
  DocumentReference? _newsRef;
  DocumentReference? get newsRef => _newsRef;
  bool hasNewsRef() => _newsRef != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "coment_text" field.
  String? _comentText;
  String get comentText => _comentText ?? '';
  bool hasComentText() => _comentText != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "video_Ref" field.
  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  bool hasVideoRef() => _videoRef != null;

  // "answer_User" field.
  DocumentReference? _answerUser;
  DocumentReference? get answerUser => _answerUser;
  bool hasAnswerUser() => _answerUser != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _newsRef = snapshotData['news_Ref'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _comentText = snapshotData['coment_text'] as String?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = castToType<int>(snapshotData['likes']);
    _videoRef = snapshotData['video_Ref'] as DocumentReference?;
    _answerUser = snapshotData['answer_User'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('answer_coments')
          : FirebaseFirestore.instance.collectionGroup('answer_coments');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('answer_coments').doc();

  static Stream<AnswerComentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswerComentsRecord.fromSnapshot(s));

  static Future<AnswerComentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswerComentsRecord.fromSnapshot(s));

  static AnswerComentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnswerComentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswerComentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswerComentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswerComentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswerComentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswerComentsRecordData({
  DocumentReference? newsRef,
  DocumentReference? user,
  String? comentText,
  DateTime? timePosted,
  int? likes,
  DocumentReference? videoRef,
  DocumentReference? answerUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'news_Ref': newsRef,
      'user': user,
      'coment_text': comentText,
      'time_posted': timePosted,
      'likes': likes,
      'video_Ref': videoRef,
      'answer_User': answerUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnswerComentsRecordDocumentEquality
    implements Equality<AnswerComentsRecord> {
  const AnswerComentsRecordDocumentEquality();

  @override
  bool equals(AnswerComentsRecord? e1, AnswerComentsRecord? e2) {
    return e1?.newsRef == e2?.newsRef &&
        e1?.user == e2?.user &&
        e1?.comentText == e2?.comentText &&
        e1?.timePosted == e2?.timePosted &&
        e1?.likes == e2?.likes &&
        e1?.videoRef == e2?.videoRef &&
        e1?.answerUser == e2?.answerUser;
  }

  @override
  int hash(AnswerComentsRecord? e) => const ListEquality().hash([
        e?.newsRef,
        e?.user,
        e?.comentText,
        e?.timePosted,
        e?.likes,
        e?.videoRef,
        e?.answerUser
      ]);

  @override
  bool isValidKey(Object? o) => o is AnswerComentsRecord;
}
