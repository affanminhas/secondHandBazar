import '/flutter_flow/flutter_flow_util.dart';
import 'phone_login_widget.dart' show PhoneLoginWidget;
import 'package:flutter/material.dart';

class PhoneLoginModel extends FlutterFlowModel<PhoneLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
