import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'job_admin_widget.dart' show JobAdminWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JobAdminModel extends FlutterFlowModel<JobAdminWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberController1;
  String? Function(BuildContext, String?)? phoneNumberController1Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberController2;
  String? Function(BuildContext, String?)? phoneNumberController2Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode3;
  TextEditingController? phoneNumberController3;
  String? Function(BuildContext, String?)? phoneNumberController3Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode4;
  TextEditingController? phoneNumberController4;
  String? Function(BuildContext, String?)? phoneNumberController4Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode5;
  TextEditingController? phoneNumberController5;
  String? Function(BuildContext, String?)? phoneNumberController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode1?.dispose();
    phoneNumberController1?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberController2?.dispose();

    phoneNumberFocusNode3?.dispose();
    phoneNumberController3?.dispose();

    phoneNumberFocusNode4?.dispose();
    phoneNumberController4?.dispose();

    phoneNumberFocusNode5?.dispose();
    phoneNumberController5?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
