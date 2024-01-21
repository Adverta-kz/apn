import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_detail_video_model.dart';
export 'news_detail_video_model.dart';

class NewsDetailVideoWidget extends StatefulWidget {
  const NewsDetailVideoWidget({
    Key? key,
    required this.videoRef,
  }) : super(key: key);

  final DocumentReference? videoRef;

  @override
  _NewsDetailVideoWidgetState createState() => _NewsDetailVideoWidgetState();
}

class _NewsDetailVideoWidgetState extends State<NewsDetailVideoWidget> {
  late NewsDetailVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsDetailVideoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ans = await VideoRecord.getDocumentOnce(widget.videoRef!);
      if (!_model.ans!.viewed.contains(currentUserReference)) {
        await _model.ans!.reference.update({
          ...mapToFirestore(
            {
              'num_views': FieldValue.increment(1),
              'viewed': FieldValue.arrayUnion([currentUserReference]),
            },
          ),
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
