import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagsRecord extends FirestoreRecord {
  TagsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "usage_count" field.
  String? _usageCount;
  String get usageCount => _usageCount ?? '';
  bool hasUsageCount() => _usageCount != null;

  // "news_ref" field.
  List<DocumentReference>? _newsRef;
  List<DocumentReference> get newsRef => _newsRef ?? const [];
  bool hasNewsRef() => _newsRef != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _usageCount = snapshotData['usage_count'] as String?;
    _newsRef = getDataList(snapshotData['news_ref']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tags');

  static Stream<TagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagsRecord.fromSnapshot(s));

  static Future<TagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagsRecord.fromSnapshot(s));

  static TagsRecord fromSnapshot(DocumentSnapshot snapshot) => TagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagsRecordData({
  String? name,
  String? usageCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'usage_count': usageCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class TagsRecordDocumentEquality implements Equality<TagsRecord> {
  const TagsRecordDocumentEquality();

  @override
  bool equals(TagsRecord? e1, TagsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.usageCount == e2?.usageCount &&
        listEquality.equals(e1?.newsRef, e2?.newsRef);
  }

  @override
  int hash(TagsRecord? e) =>
      const ListEquality().hash([e?.name, e?.usageCount, e?.newsRef]);

  @override
  bool isValidKey(Object? o) => o is TagsRecord;
}
