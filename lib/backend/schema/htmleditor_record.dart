import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HtmleditorRecord extends FirestoreRecord {
  HtmleditorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "newsIMG_ref" field.
  DocumentReference? _newsIMGRef;
  DocumentReference? get newsIMGRef => _newsIMGRef;
  bool hasNewsIMGRef() => _newsIMGRef != null;

  // "newsVIDEO_ref" field.
  DocumentReference? _newsVIDEORef;
  DocumentReference? get newsVIDEORef => _newsVIDEORef;
  bool hasNewsVIDEORef() => _newsVIDEORef != null;

  // "htmltext" field.
  String? _htmltext;
  String get htmltext => _htmltext ?? '';
  bool hasHtmltext() => _htmltext != null;

  // "pk" field.
  int? _pk;
  int get pk => _pk ?? 0;
  bool hasPk() => _pk != null;

  void _initializeFields() {
    _newsIMGRef = snapshotData['newsIMG_ref'] as DocumentReference?;
    _newsVIDEORef = snapshotData['newsVIDEO_ref'] as DocumentReference?;
    _htmltext = snapshotData['htmltext'] as String?;
    _pk = castToType<int>(snapshotData['pk']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('htmleditor');

  static Stream<HtmleditorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HtmleditorRecord.fromSnapshot(s));

  static Future<HtmleditorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HtmleditorRecord.fromSnapshot(s));

  static HtmleditorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HtmleditorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HtmleditorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HtmleditorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HtmleditorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HtmleditorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHtmleditorRecordData({
  DocumentReference? newsIMGRef,
  DocumentReference? newsVIDEORef,
  String? htmltext,
  int? pk,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'newsIMG_ref': newsIMGRef,
      'newsVIDEO_ref': newsVIDEORef,
      'htmltext': htmltext,
      'pk': pk,
    }.withoutNulls,
  );

  return firestoreData;
}

class HtmleditorRecordDocumentEquality implements Equality<HtmleditorRecord> {
  const HtmleditorRecordDocumentEquality();

  @override
  bool equals(HtmleditorRecord? e1, HtmleditorRecord? e2) {
    return e1?.newsIMGRef == e2?.newsIMGRef &&
        e1?.newsVIDEORef == e2?.newsVIDEORef &&
        e1?.htmltext == e2?.htmltext &&
        e1?.pk == e2?.pk;
  }

  @override
  int hash(HtmleditorRecord? e) => const ListEquality()
      .hash([e?.newsIMGRef, e?.newsVIDEORef, e?.htmltext, e?.pk]);

  @override
  bool isValidKey(Object? o) => o is HtmleditorRecord;
}
