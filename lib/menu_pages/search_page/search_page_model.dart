import '/backend/backend.dart';
import '/components/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile_pages/menu_popup/menu_popup_widget.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  List<String> tags = [];
  void addToTags(String item) => tags.add(item);
  void removeFromTags(String item) => tags.remove(item);
  void removeAtIndexFromTags(int index) => tags.removeAt(index);
  void insertAtIndexInTags(int index, String item) => tags.insert(index, item);
  void updateTagsAtIndex(int index, Function(String) updateFn) =>
      tags[index] = updateFn(tags[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<NewsRecord> simpleSearchResults = [];
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchController;
  String? Function(BuildContext, String?)? searchControllerValidator;
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
    searchFocusNode?.dispose();
    searchController?.dispose();

    navBarFlotingModel.dispose();
    menuPopupModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
