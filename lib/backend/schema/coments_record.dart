import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComentsRecord extends FirestoreRecord {
  ComentsRecord._(
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

  // "timeposted" field.
  DateTime? _timeposted;
  DateTime? get timeposted => _timeposted;
  bool hasTimeposted() => _timeposted != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "coment_text" field.
  String? _comentText;
  String get comentText => _comentText ?? '';
  bool hasComentText() => _comentText != null;

  // "video_Ref" field.
  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  bool hasVideoRef() => _videoRef != null;

  // "dislikes" field.
  int? _dislikes;
  int get dislikes => _dislikes ?? 0;
  bool hasDislikes() => _dislikes != null;

  // "moderated" field.
  bool? _moderated;
  bool get moderated => _moderated ?? false;
  bool hasModerated() => _moderated != null;

  void _initializeFields() {
    _newsRef = snapshotData['news_Ref'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _timeposted = snapshotData['timeposted'] as DateTime?;
    _likes = castToType<int>(snapshotData['likes']);
    _comentText = snapshotData['coment_text'] as String?;
    _videoRef = snapshotData['video_Ref'] as DocumentReference?;
    _dislikes = castToType<int>(snapshotData['dislikes']);
    _moderated = snapshotData['moderated'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coments');

  static Stream<ComentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComentsRecord.fromSnapshot(s));

  static Future<ComentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComentsRecord.fromSnapshot(s));

  static ComentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComentsRecordData({
  DocumentReference? newsRef,
  DocumentReference? user,
  DateTime? timeposted,
  int? likes,
  String? comentText,
  DocumentReference? videoRef,
  int? dislikes,
  bool? moderated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'news_Ref': newsRef,
      'user': user,
      'timeposted': timeposted,
      'likes': likes,
      'coment_text': comentText,
      'video_Ref': videoRef,
      'dislikes': dislikes,
      'moderated': moderated,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComentsRecordDocumentEquality implements Equality<ComentsRecord> {
  const ComentsRecordDocumentEquality();

  @override
  bool equals(ComentsRecord? e1, ComentsRecord? e2) {
    return e1?.newsRef == e2?.newsRef &&
        e1?.user == e2?.user &&
        e1?.timeposted == e2?.timeposted &&
        e1?.likes == e2?.likes &&
        e1?.comentText == e2?.comentText &&
        e1?.videoRef == e2?.videoRef &&
        e1?.dislikes == e2?.dislikes &&
        e1?.moderated == e2?.moderated;
  }

  @override
  int hash(ComentsRecord? e) => const ListEquality().hash([
        e?.newsRef,
        e?.user,
        e?.timeposted,
        e?.likes,
        e?.comentText,
        e?.videoRef,
        e?.dislikes,
        e?.moderated
      ]);

  @override
  bool isValidKey(Object? o) => o is ComentsRecord;
}
