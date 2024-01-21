import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsRecord extends FirestoreRecord {
  NewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "num_likes" field.
  int? _numLikes;
  int get numLikes => _numLikes ?? 0;
  bool hasNumLikes() => _numLikes != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "num_views" field.
  int? _numViews;
  int get numViews => _numViews ?? 0;
  bool hasNumViews() => _numViews != null;

  // "coments_Ref" field.
  DocumentReference? _comentsRef;
  DocumentReference? get comentsRef => _comentsRef;
  bool hasComentsRef() => _comentsRef != null;

  // "viewed" field.
  List<DocumentReference>? _viewed;
  List<DocumentReference> get viewed => _viewed ?? const [];
  bool hasViewed() => _viewed != null;

  // "post_text" field.
  List<NewsPartStruct>? _postText;
  List<NewsPartStruct> get postText => _postText ?? const [];
  bool hasPostText() => _postText != null;

  // "tag" field.
  List<String>? _tag;
  List<String> get tag => _tag ?? const [];
  bool hasTag() => _tag != null;

  // "breaking_news" field.
  bool? _breakingNews;
  bool get breakingNews => _breakingNews ?? false;
  bool hasBreakingNews() => _breakingNews != null;

  void _initializeFields() {
    _postPhoto = snapshotData['post_photo'] as String?;
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['num_comments']);
    _numLikes = castToType<int>(snapshotData['num_likes']);
    _category = snapshotData['category'] as String?;
    _numViews = castToType<int>(snapshotData['num_views']);
    _comentsRef = snapshotData['coments_Ref'] as DocumentReference?;
    _viewed = getDataList(snapshotData['viewed']);
    _postText = getStructList(
      snapshotData['post_text'],
      NewsPartStruct.fromMap,
    );
    _tag = getDataList(snapshotData['tag']);
    _breakingNews = snapshotData['breaking_news'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('news');

  static Stream<NewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsRecord.fromSnapshot(s));

  static Future<NewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsRecord.fromSnapshot(s));

  static NewsRecord fromSnapshot(DocumentSnapshot snapshot) => NewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsRecord._(reference, mapFromFirestore(data));

  static NewsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      NewsRecord.getDocumentFromData(
        {
          'post_photo': snapshot.data['post_photo'],
          'post_title': snapshot.data['post_title'],
          'post_description': snapshot.data['post_description'],
          'post_user': convertAlgoliaParam(
            snapshot.data['post_user'],
            ParamType.DocumentReference,
            false,
          ),
          'time_posted': convertAlgoliaParam(
            snapshot.data['time_posted'],
            ParamType.DateTime,
            false,
          ),
          'likes': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['likes'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'num_comments': convertAlgoliaParam(
            snapshot.data['num_comments'],
            ParamType.int,
            false,
          ),
          'num_likes': convertAlgoliaParam(
            snapshot.data['num_likes'],
            ParamType.int,
            false,
          ),
          'category': snapshot.data['category'],
          'num_views': convertAlgoliaParam(
            snapshot.data['num_views'],
            ParamType.int,
            false,
          ),
          'coments_Ref': convertAlgoliaParam(
            snapshot.data['coments_Ref'],
            ParamType.DocumentReference,
            false,
          ),
          'viewed': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['viewed'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'post_text': safeGet(
            () => (snapshot.data['post_text'] as Iterable)
                .map((d) => NewsPartStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'tag': safeGet(
            () => snapshot.data['tag'].toList(),
          ),
          'breaking_news': snapshot.data['breaking_news'],
        },
        NewsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<NewsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'news',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'NewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numLikes,
  String? category,
  int? numViews,
  DocumentReference? comentsRef,
  bool? breakingNews,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_photo': postPhoto,
      'post_title': postTitle,
      'post_description': postDescription,
      'post_user': postUser,
      'time_posted': timePosted,
      'num_comments': numComments,
      'num_likes': numLikes,
      'category': category,
      'num_views': numViews,
      'coments_Ref': comentsRef,
      'breaking_news': breakingNews,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsRecordDocumentEquality implements Equality<NewsRecord> {
  const NewsRecordDocumentEquality();

  @override
  bool equals(NewsRecord? e1, NewsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postPhoto == e2?.postPhoto &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.numLikes == e2?.numLikes &&
        e1?.category == e2?.category &&
        e1?.numViews == e2?.numViews &&
        e1?.comentsRef == e2?.comentsRef &&
        listEquality.equals(e1?.viewed, e2?.viewed) &&
        listEquality.equals(e1?.postText, e2?.postText) &&
        listEquality.equals(e1?.tag, e2?.tag) &&
        e1?.breakingNews == e2?.breakingNews;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality().hash([
        e?.postPhoto,
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.numLikes,
        e?.category,
        e?.numViews,
        e?.comentsRef,
        e?.viewed,
        e?.postText,
        e?.tag,
        e?.breakingNews
      ]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
