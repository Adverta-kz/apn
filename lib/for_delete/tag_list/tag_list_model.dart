import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile_pages/menu_popup/menu_popup_widget.dart';
import 'tag_list_widget.dart' show TagListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TagListModel extends FlutterFlowModel<TagListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for menuPopup component.
  late MenuPopupModel menuPopupModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    menuPopupModel = createModel(context, () => MenuPopupModel());
  }

  void dispose() {
    unfocusNode.dispose();
    menuPopupModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
