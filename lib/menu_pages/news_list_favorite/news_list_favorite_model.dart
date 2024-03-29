import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile_pages/menu_popup/menu_popup_widget.dart';
import 'news_list_favorite_widget.dart' show NewsListFavoriteWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewsListFavoriteModel extends FlutterFlowModel<NewsListFavoriteWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;
  // Model for menuPopup component.
  late MenuPopupModel menuPopupModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
    menuPopupModel = createModel(context, () => MenuPopupModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navBarFlotingModel.dispose();
    menuPopupModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
