import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CareerRecord extends FirestoreRecord {
  CareerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "job_title" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "profit" field.
  String? _profit;
  String get profit => _profit ?? '';
  bool hasProfit() => _profit != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "experience" field.
  String? _experience;
  String get experience => _experience ?? '';
  bool hasExperience() => _experience != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _jobTitle = snapshotData['job_title'] as String?;
    _profit = snapshotData['profit'] as String?;
    _city = snapshotData['city'] as String?;
    _company = snapshotData['company'] as String?;
    _experience = snapshotData['experience'] as String?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('career');

  static Stream<CareerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CareerRecord.fromSnapshot(s));

  static Future<CareerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CareerRecord.fromSnapshot(s));

  static CareerRecord fromSnapshot(DocumentSnapshot snapshot) => CareerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CareerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CareerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CareerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CareerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCareerRecordData({
  String? jobTitle,
  String? profit,
  String? city,
  String? company,
  String? experience,
  DateTime? timePosted,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'job_title': jobTitle,
      'profit': profit,
      'city': city,
      'company': company,
      'experience': experience,
      'time_posted': timePosted,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class CareerRecordDocumentEquality implements Equality<CareerRecord> {
  const CareerRecordDocumentEquality();

  @override
  bool equals(CareerRecord? e1, CareerRecord? e2) {
    return e1?.jobTitle == e2?.jobTitle &&
        e1?.profit == e2?.profit &&
        e1?.city == e2?.city &&
        e1?.company == e2?.company &&
        e1?.experience == e2?.experience &&
        e1?.timePosted == e2?.timePosted &&
        e1?.description == e2?.description;
  }

  @override
  int hash(CareerRecord? e) => const ListEquality().hash([
        e?.jobTitle,
        e?.profit,
        e?.city,
        e?.company,
        e?.experience,
        e?.timePosted,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is CareerRecord;
}
