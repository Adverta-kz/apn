// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsPartStruct extends FFFirebaseStruct {
  NewsPartStruct({
    String? text,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _image = image,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static NewsPartStruct fromMap(Map<String, dynamic> data) => NewsPartStruct(
        text: data['text'] as String?,
        image: data['image'] as String?,
      );

  static NewsPartStruct? maybeFromMap(dynamic data) =>
      data is Map ? NewsPartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewsPartStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsPartStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  static NewsPartStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NewsPartStruct(
        text: convertAlgoliaParam(
          data['text'],
          ParamType.String,
          false,
        ),
        image: convertAlgoliaParam(
          data['image'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NewsPartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewsPartStruct &&
        text == other.text &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([text, image]);
}

NewsPartStruct createNewsPartStruct({
  String? text,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NewsPartStruct(
      text: text,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NewsPartStruct? updateNewsPartStruct(
  NewsPartStruct? newsPart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    newsPart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNewsPartStructData(
  Map<String, dynamic> firestoreData,
  NewsPartStruct? newsPart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (newsPart == null) {
    return;
  }
  if (newsPart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && newsPart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final newsPartData = getNewsPartFirestoreData(newsPart, forFieldValue);
  final nestedData = newsPartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = newsPart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNewsPartFirestoreData(
  NewsPartStruct? newsPart, [
  bool forFieldValue = false,
]) {
  if (newsPart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(newsPart.toMap());

  // Add any Firestore field values
  newsPart.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNewsPartListFirestoreData(
  List<NewsPartStruct>? newsParts,
) =>
    newsParts?.map((e) => getNewsPartFirestoreData(e, true)).toList() ?? [];
