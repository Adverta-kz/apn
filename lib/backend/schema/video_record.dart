import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoRecord extends FirestoreRecord {
  VideoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "tags" field.
  List<DocumentReference>? _tags;
  List<DocumentReference> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "post_video" field.
  String? _postVideo;
  String get postVideo => _postVideo ?? '';
  bool hasPostVideo() => _postVideo != null;

  // "video_oblozhka" field.
  String? _videoOblozhka;
  String get videoOblozhka => _videoOblozhka ?? '';
  bool hasVideoOblozhka() => _videoOblozhka != null;

  // "viewed" field.
  List<DocumentReference>? _viewed;
  List<DocumentReference> get viewed => _viewed ?? const [];
  bool hasViewed() => _viewed != null;

  void _initializeFields() {
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['num_comments']);
    _numLikes = castToType<int>(snapshotData['num_likes']);
    _category = snapshotData['category'] as String?;
    _numViews = castToType<int>(snapshotData['num_views']);
    _tags = getDataList(snapshotData['tags']);
    _postVideo = snapshotData['post_video'] as String?;
    _videoOblozhka = snapshotData['video_oblozhka'] as String?;
    _viewed = getDataList(snapshotData['viewed']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video');

  static Stream<VideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoRecord.fromSnapshot(s));

  static Future<VideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoRecord.fromSnapshot(s));

  static VideoRecord fromSnapshot(DocumentSnapshot snapshot) => VideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoRecordData({
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  int? numComments,
  int? numLikes,
  String? category,
  int? numViews,
  String? postVideo,
  String? videoOblozhka,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_title': postTitle,
      'post_description': postDescription,
      'post_user': postUser,
      'time_posted': timePosted,
      'num_comments': numComments,
      'num_likes': numLikes,
      'category': category,
      'num_views': numViews,
      'post_video': postVideo,
      'video_oblozhka': videoOblozhka,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoRecordDocumentEquality implements Equality<VideoRecord> {
  const VideoRecordDocumentEquality();

  @override
  bool equals(VideoRecord? e1, VideoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.numLikes == e2?.numLikes &&
        e1?.category == e2?.category &&
        e1?.numViews == e2?.numViews &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.postVideo == e2?.postVideo &&
        e1?.videoOblozhka == e2?.videoOblozhka &&
        listEquality.equals(e1?.viewed, e2?.viewed);
  }

  @override
  int hash(VideoRecord? e) => const ListEquality().hash([
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.numLikes,
        e?.category,
        e?.numViews,
        e?.tags,
        e?.postVideo,
        e?.videoOblozhka,
        e?.viewed
      ]);

  @override
  bool isValidKey(Object? o) => o is VideoRecord;
}
