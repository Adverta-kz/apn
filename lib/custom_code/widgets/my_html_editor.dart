// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// YouTube channel - https://www.youtube.com/@flutterflowexpert
// video - https://www.youtube.com/watch?v=mHN0iDPb4oY
// widgets - Cg9Db2x1bW5fcHc3OTlqazMSxgEKEkNvbnRhaW5lcl9pY2U0eHE3NBgBIgP6AwBilgESPgoKZGltZW5zaW9ucxIwChQKCmRpbWVuc2lvbnMSBnltbzllbDIYIhYKCREAAAAAAABZQBIJEQAAAAAAAFRAEkYKC2N1cnJlbnRIdG1sEjcKFQoLY3VycmVudEh0bWwSBmoxdTlncCIeCAxCGiIYChQKEnRleHRGcm9tSHRtbEVkaXRvchABGgxNeUh0bWxFZGl0b3KCAQxNeUh0bWxFZGl0b3KYAQEYBCIFIgD6AwA=
// replace - [{"Collection name": "htmleditor"}, {"Field name": "htmltext"}, {"App State name": "textFromHtmlEditor"}]
// Join the Klaturov army - https://www.youtube.com/@flutterflowexpert/join
// Support my work - https://github.com/sponsors/bulgariamitko
// Website - https://bulgariamitko.github.io/flutterflowtutorials/
// You can book me as FF mentor - https://calendly.com/bulgaria_mitko
// GitHub repo - https://github.com/bulgariamitko/flutterflowtutorials
// Discord channel - https://discord.gg/ERDVFBkJmY

import '../../flutter_flow/flutter_flow_widgets.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class MyHtmlEditor extends StatefulWidget {
  const MyHtmlEditor({
    Key? key,
    this.width,
    this.height,
    this.currentHtml,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? currentHtml;

  @override
  _MyHtmlEditorState createState() => _MyHtmlEditorState();
}

class _MyHtmlEditorState extends State<MyHtmlEditor> {
  HtmlEditorController controller = HtmlEditorController();

  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // Get a reference to the collection
  late final CollectionReference<Object?> collectionRef;

  @override
  void initState() {
    super.initState();
    // Initialize the collection reference
    collectionRef = firestore.collection('htmleditor');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        HtmlEditor(
          controller: controller, //required
          htmlEditorOptions: HtmlEditorOptions(
            hint: "Type your Text here",
            initialText: widget.currentHtml,
          ),
          htmlToolbarOptions: HtmlToolbarOptions(
            toolbarType: ToolbarType.nativeGrid,
          ),
          otherOptions: OtherOptions(
            height: 400,
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            String data = await controller.getText();
            final doc = {'htmltext': data};
            collectionRef.limit(1).get().then((snapshot) {
              if (snapshot.docs.isNotEmpty) {
                // update document
                final docRef = snapshot.docs[0].reference;
                docRef.update(doc);
              } else {
                // create document
                collectionRef.add(doc);
              }

              // nav to a new page
              //   context.pushNamed(
              //     'actions',
              //     queryParams: {
              //       // TODO: Change the name of the parameter - 'id'
              //       'id': serializeParam(
              //         33,
              //         ParamType.String,
              //       ),
              //     }.withoutNulls,
              //   );
              // });

              // Update local state
              FFAppState().update(() {
                setState(() => FFAppState().textFromHtmlEditor = data);
              });
            });
          },
          text: 'Сохранить текст',
          options: FFButtonOptions(
            width: 130,
            height: 40,
            color: Color(0xFF0043A4),
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    ));
  }
}
