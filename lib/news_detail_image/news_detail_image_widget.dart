import '/auth/base_auth_user_provider.dart';
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
import 'news_detail_image_model.dart';
export 'news_detail_image_model.dart';

class NewsDetailImageWidget extends StatefulWidget {
  const NewsDetailImageWidget({
    Key? key,
    required this.newsRef,
  }) : super(key: key);

  final DocumentReference? newsRef;

  @override
  _NewsDetailImageWidgetState createState() => _NewsDetailImageWidgetState();
}

class _NewsDetailImageWidgetState extends State<NewsDetailImageWidget> {
  late NewsDetailImageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsDetailImageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ansCopy = await NewsRecord.getDocumentOnce(widget.newsRef!);
      if (loggedIn) {
        if (!_model.ansCopy!.viewed.contains(currentUserReference)) {
          await _model.ansCopy!.reference.update({
            ...mapToFirestore(
              {
                'viewed': FieldValue.arrayUnion([currentUserReference]),
                'num_views': FieldValue.increment(1),
              },
            ),
          });
        }
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
