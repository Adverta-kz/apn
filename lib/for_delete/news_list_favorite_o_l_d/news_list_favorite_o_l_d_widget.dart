import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_list_favorite_o_l_d_model.dart';
export 'news_list_favorite_o_l_d_model.dart';

class NewsListFavoriteOLDWidget extends StatefulWidget {
  const NewsListFavoriteOLDWidget({Key? key}) : super(key: key);

  @override
  _NewsListFavoriteOLDWidgetState createState() =>
      _NewsListFavoriteOLDWidgetState();
}

class _NewsListFavoriteOLDWidgetState extends State<NewsListFavoriteOLDWidget> {
  late NewsListFavoriteOLDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsListFavoriteOLDModel());

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(1.0),
                        bottomRight: Radius.circular(1.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.sort_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 35.0,
                          ),
                          Text(
                            'Закладки',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'San Francisco',
                                  color: FlutterFlowTheme.of(context).accent1,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {},
                            child: Icon(
                              Icons.sort_by_alpha,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(currentUserReference!),
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
                          final containerUsersRecord = snapshot.data!;
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final res = containerUsersRecord
                                          .postLikesNews
                                          .toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(res.length,
                                            (resIndex) {
                                          final resItem = res[resIndex];
                                          return StreamBuilder<NewsRecord>(
                                            stream:
                                                NewsRecord.getDocument(resItem),
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
                                              final rowNewsRecord =
                                                  snapshot.data!;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'newsDetailImage',
                                                    queryParameters: {
                                                      'newsRef': serializeParam(
                                                        rowNewsRecord.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 116.0,
                                                      height: 90.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFB3B3B3),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          rowNewsRecord
                                                              .postPhoto,
                                                          width: 300.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 195.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AutoSizeText(
                                                                rowNewsRecord
                                                                    .postTitle,
                                                                maxLines: 4,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'San Francisco',
                                                                      fontSize:
                                                                          16.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.1,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    rowNewsRecord
                                                                        .category,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'San Francisco',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          fontSize:
                                                                              12.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Icon(
                                                                    FFIcons
                                                                        .k433567,
                                                                    color: Color(
                                                                        0xFF334148),
                                                                    size: 20.0,
                                                                  ),
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'relative',
                                                                      rowNewsRecord
                                                                          .timePosted!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'San Francisco',
                                                                          color:
                                                                              Color(0xFF808080),
                                                                          fontSize:
                                                                              12.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                                      .addToStart(
                                                          SizedBox(width: 24.0))
                                                      .addToEnd(SizedBox(
                                                          width: 24.0)),
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                  if (containerUsersRecord
                                          .postLikesNews.length ==
                                      0)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 15.0),
                                      child: Text(
                                        'У вас нет новостей в закладках',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'San Francisco',
                                              fontSize: 20.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  if (containerUsersRecord
                                          .postLikesNews.length ==
                                      0)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('newsList');
                                      },
                                      child: Text(
                                        'Добавить сейчас',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'San Francisco',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 16.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
