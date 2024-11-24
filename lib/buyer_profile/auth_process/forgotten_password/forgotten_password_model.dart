import '/flutter_flow/flutter_flow_util.dart';
import 'forgotten_password_widget.dart' show ForgottenPasswordWidget;
import 'package:flutter/material.dart';

class ForgottenPasswordModel extends FlutterFlowModel<ForgottenPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
