import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<NewsRecord>(
                stream: NewsRecord.getDocument(widget.newsRef!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final columnTesNewsRecord = snapshot.data!;
                  return SingleChildScrollView(
                    controller: _model.columnTes,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.network(
                                columnTesNewsRecord.postPhoto,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 383.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 60.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 34.0,
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();
                                      },
                                      child: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 350.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 27.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0x1A5474FD),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  19.0,
                                                                  3.0,
                                                                  19.0,
                                                                  3.0),
                                                      child: Text(
                                                        columnTesNewsRecord
                                                            .category,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'San Francisco',
                                                              color: Color(
                                                                  0xFF5474FD),
                                                              fontSize: 12.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (!(currentUserDocument
                                                                      ?.postLikesNews
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(widget
                                                                  .newsRef))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (loggedIn) {
                                                                      await currentUserReference!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'post_likes_news':
                                                                                FieldValue.arrayUnion([
                                                                              columnTesNewsRecord.reference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });

                                                                      await widget
                                                                          .newsRef!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'num_likes':
                                                                                FieldValue.increment(1),
                                                                          },
                                                                        ),
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        FFAppState().showfulllist =
                                                                            true;
                                                                      });
                                                                    } else {
                                                                      context.pushNamed(
                                                                          'WelcomeSlider');
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 25.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if ((currentUserDocument
                                                                      ?.postLikesNews
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(widget
                                                                  .newsRef))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'post_likes_news':
                                                                              FieldValue.arrayRemove([
                                                                            columnTesNewsRecord.reference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });

                                                                    await widget
                                                                        .newsRef!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'num_likes':
                                                                              FieldValue.increment(-(1)),
                                                                        },
                                                                      ),
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .showfulllist =
                                                                          true;
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    size: 25.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 327.0,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  23.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        columnTesNewsRecord
                                                            .postTitle,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'San Francisco',
                                                              fontSize: 24.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.1,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 24.5),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          columnTesNewsRecord
                                                              .postUser!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final rowUsersRecord =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              dateTimeFormat(
                                                                'H:mm d MMM y   ',
                                                                columnTesNewsRecord
                                                                    .timePosted!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'San Francisco',
                                                                    color: Color(
                                                                        0xFF616161),
                                                                    fontSize:
                                                                        13.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .remove_red_eye_outlined,
                                                              color: Color(
                                                                  0xFF616161),
                                                              size: 20.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                columnTesNewsRecord
                                                                    .numViews
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'San Francisco',
                                                                      color: Color(
                                                                          0xFF616161),
                                                                      fontSize:
                                                                          13.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width: 50.0,
                                                          height: 34.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF616161),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await Share
                                                                            .share(
                                                                          'newsapn://newsapn.com${GoRouter.of(context).location}',
                                                                          sharePositionOrigin:
                                                                              getWidgetBoundingBox(context),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .ios_share_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.showcoments =
                                                                  true;
                                                            });
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000));
                                                            await _model
                                                                .columnTes
                                                                ?.animateTo(
                                                              _model
                                                                  .columnTes!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 60.0,
                                                            height: 34.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF616161),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        columnTesNewsRecord
                                                                            .numComments
                                                                            .toString(),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'San Francisco',
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              fontSize: 13.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          13.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .mode_comment,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 326.0,
                                                child: Divider(
                                                  thickness: 1.0,
                                                  color: Color(0xFFD9D9D9),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.95,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Html(
                                                      data: columnTesNewsRecord
                                                          .postDescription,
                                                      onLinkTap:
                                                          (url, _, __, ___) =>
                                                              launchURL(url!),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.95,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    30.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (_model
                                                                    .showcoments ==
                                                                false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            35.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model.showcoments =
                                                                              true;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.35,
                                                                        height:
                                                                            38.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'Коментарии',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'San Francisco',
                                                                                    color: Colors.white,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.keyboard_arrow_right,
                                                                              color: Colors.white,
                                                                              size: 24.0,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            if (_model
                                                                    .showcoments ==
                                                                true)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            35.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model.showcoments =
                                                                              false;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.35,
                                                                        height:
                                                                            38.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'Коментарии',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'San Francisco',
                                                                                    color: Colors.white,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                            Icon(
                                                                              Icons.keyboard_arrow_down,
                                                                              color: Colors.white,
                                                                              size: 24.0,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            if (_model
                                                                .showcoments)
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            29.5,
                                                                            0.0,
                                                                            19.5),
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryComentsRecordCount(
                                                                        queryBuilder:
                                                                            (comentsRecord) =>
                                                                                comentsRecord.where(
                                                                          'news_Ref',
                                                                          isEqualTo:
                                                                              widget.newsRef,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int rowCount =
                                                                            snapshot.data!;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Коментарии (${rowCount.toString()})',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'San Francisco',
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                    fontSize: 16.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      controller:
                                                                          _model
                                                                              .columnController,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                20.0),
                                                                            child:
                                                                                StreamBuilder<List<ComentsRecord>>(
                                                                              stream: queryComentsRecord(
                                                                                queryBuilder: (comentsRecord) => comentsRecord
                                                                                    .where(
                                                                                      'news_Ref',
                                                                                      isEqualTo: widget.newsRef,
                                                                                    )
                                                                                    .where(
                                                                                      'moderated',
                                                                                      isEqualTo: true,
                                                                                    ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<ComentsRecord> columnComentsRecordList = snapshot.data!;
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: List.generate(columnComentsRecordList.length, (columnIndex) {
                                                                                    final columnComentsRecord = columnComentsRecordList[columnIndex];
                                                                                    return Visibility(
                                                                                      visible: columnComentsRecord.moderated,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Stack(
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          StreamBuilder<UsersRecord>(
                                                                                                            stream: UsersRecord.getDocument(columnComentsRecord.user!),
                                                                                                            builder: (context, snapshot) {
                                                                                                              // Customize what your widget looks like when it's loading.
                                                                                                              if (!snapshot.hasData) {
                                                                                                                return Center(
                                                                                                                  child: SizedBox(
                                                                                                                    width: 50.0,
                                                                                                                    height: 50.0,
                                                                                                                    child: CircularProgressIndicator(
                                                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              }
                                                                                                              final stackUsersRecord = snapshot.data!;
                                                                                                              return Stack(
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                    child: Container(
                                                                                                                      width: 40.0,
                                                                                                                      height: 40.0,
                                                                                                                      clipBehavior: Clip.antiAlias,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        shape: BoxShape.circle,
                                                                                                                      ),
                                                                                                                      child: Image.network(
                                                                                                                        stackUsersRecord.photoUrl,
                                                                                                                        fit: BoxFit.cover,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(45.0, 0.0, 0.0, 5.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              '${stackUsersRecord.name} ${stackUsersRecord.secondName}',
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'San Francisco',
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    fontSize: 16.0,
                                                                                                                                    useGoogleFonts: false,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            if (columnComentsRecord.user == currentUserReference)
                                                                                                                              InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await columnComentsRecord.reference.delete();

                                                                                                                                  await widget.newsRef!.update({
                                                                                                                                    ...mapToFirestore(
                                                                                                                                      {
                                                                                                                                        'num_comments': FieldValue.increment(-(1)),
                                                                                                                                      },
                                                                                                                                    ),
                                                                                                                                  });
                                                                                                                                },
                                                                                                                                child: Icon(
                                                                                                                                  Icons.delete_outline,
                                                                                                                                  color: Color(0xFFFF4A4D),
                                                                                                                                  size: 20.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          width: 279.0,
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Text(
                                                                                                                            columnComentsRecord.comentText,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'San Francisco',
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                  lineHeight: 1.2,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  dateTimeFormat(
                                                                                                                    'd/M/y',
                                                                                                                    columnComentsRecord.timeposted!,
                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'San Francisco',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 12.0,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                if (!(currentUserDocument?.likes?.toList() ?? []).contains(columnComentsRecord.reference))
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                                                    child: AuthUserStreamWidget(
                                                                                                                      builder: (context) => InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          if (loggedIn) {
                                                                                                                            if ((currentUserDocument?.dislikesUs?.toList() ?? []).contains(columnComentsRecord.reference)) {
                                                                                                                              await columnComentsRecord.reference.update({
                                                                                                                                ...mapToFirestore(
                                                                                                                                  {
                                                                                                                                    'dislikes': FieldValue.increment(-(1)),
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              });

                                                                                                                              await currentUserReference!.update({
                                                                                                                                ...mapToFirestore(
                                                                                                                                  {
                                                                                                                                    'dislikesUs': FieldValue.arrayRemove([columnComentsRecord.reference]),
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              });
                                                                                                                            }

                                                                                                                            await currentUserReference!.update({
                                                                                                                              ...mapToFirestore(
                                                                                                                                {
                                                                                                                                  'likes': FieldValue.arrayUnion([columnComentsRecord.reference]),
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            });

                                                                                                                            await columnComentsRecord.reference.update({
                                                                                                                              ...mapToFirestore(
                                                                                                                                {
                                                                                                                                  'likes': FieldValue.increment(1),
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            });
                                                                                                                          } else {
                                                                                                                            context.pushNamed('Login');
                                                                                                                          }
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.thumb_up_off_alt,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          size: 15.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if ((currentUserDocument?.likes?.toList() ?? []).contains(columnComentsRecord.reference))
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                                                    child: AuthUserStreamWidget(
                                                                                                                      builder: (context) => InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          await currentUserReference!.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'likes': FieldValue.arrayRemove([columnComentsRecord.reference]),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });

                                                                                                                          await columnComentsRecord.reference.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'likes': FieldValue.increment(-(1)),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.thumb_up_alt_rounded,
                                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                                          size: 15.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (!(currentUserDocument?.dislikesUs?.toList() ?? []).contains(columnComentsRecord.reference))
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                                                    child: AuthUserStreamWidget(
                                                                                                                      builder: (context) => InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          if (loggedIn) {
                                                                                                                            if ((currentUserDocument?.likes?.toList() ?? []).contains(columnComentsRecord.reference)) {
                                                                                                                              await columnComentsRecord.reference.update({
                                                                                                                                ...mapToFirestore(
                                                                                                                                  {
                                                                                                                                    'likes': FieldValue.increment(-(1)),
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              });

                                                                                                                              await currentUserReference!.update({
                                                                                                                                ...mapToFirestore(
                                                                                                                                  {
                                                                                                                                    'likes': FieldValue.arrayRemove([columnComentsRecord.reference]),
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              });
                                                                                                                            }

                                                                                                                            await currentUserReference!.update({
                                                                                                                              ...mapToFirestore(
                                                                                                                                {
                                                                                                                                  'dislikesUs': FieldValue.arrayUnion([columnComentsRecord.reference]),
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            });

                                                                                                                            await columnComentsRecord.reference.update({
                                                                                                                              ...mapToFirestore(
                                                                                                                                {
                                                                                                                                  'dislikes': FieldValue.increment(1),
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            });
                                                                                                                          } else {
                                                                                                                            context.pushNamed('Login');
                                                                                                                          }
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.thumb_down_outlined,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          size: 15.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if ((currentUserDocument?.dislikesUs?.toList() ?? []).contains(columnComentsRecord.reference))
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 4.0, 0.0),
                                                                                                                    child: AuthUserStreamWidget(
                                                                                                                      builder: (context) => InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          await currentUserReference!.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'likes': FieldValue.arrayRemove([columnComentsRecord.reference]),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });

                                                                                                                          await columnComentsRecord.reference.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'likes': FieldValue.increment(-(1)),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.thumb_down_rounded,
                                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                                          size: 15.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                Text(
                                                                                                                  '${columnComentsRecord.likes.toString()} лайка(ов) | ${columnComentsRecord.dislikes.toString()} дизлайка(ов)',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'San Francisco',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 12.0,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  }).divide(SizedBox(height: 15.0)),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Form(
                                                                            key:
                                                                                _model.formKey,
                                                                            autovalidateMode:
                                                                                AutovalidateMode.disabled,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 30.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController,
                                                                                        focusNode: _model.textFieldFocusNode,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          labelText: 'Напишите ваш комментарий',
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'San Francisco',
                                                                                                color: Color(0xFFA0A3BD),
                                                                                                letterSpacing: 0.25,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0xFF4E4B66),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(6.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0xFF4E4B66),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(6.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(6.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(6.0),
                                                                                          ),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        validator: _model.textControllerValidator.asValidator(context),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 12.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 48.0,
                                                                                    fillColor: FlutterFlowTheme.of(context).accent1,
                                                                                    icon: Icon(
                                                                                      Icons.arrow_outward_sharp,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      if (loggedIn) {
                                                                                        if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                                                                          return;
                                                                                        }

                                                                                        await ComentsRecord.collection.doc().set(createComentsRecordData(
                                                                                              user: currentUserReference,
                                                                                              timeposted: getCurrentTimestamp,
                                                                                              likes: 0,
                                                                                              comentText: _model.textController.text,
                                                                                              newsRef: widget.newsRef,
                                                                                              moderated: false,
                                                                                            ));

                                                                                        await widget.newsRef!.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'num_comments': FieldValue.increment(1),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                                child: AlertDialog(
                                                                                              content: Text('Комментарий добавлен'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ок'),
                                                                                                ),
                                                                                              ],
                                                                                            ));
                                                                                          },
                                                                                        );
                                                                                        setState(() {
                                                                                          _model.textController?.clear();
                                                                                        });
                                                                                      } else {
                                                                                        context.pushNamed('WelcomeSlider');
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: wrapWithModel(
                    model: _model.navBarFlotingModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarFlotingWidget(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
