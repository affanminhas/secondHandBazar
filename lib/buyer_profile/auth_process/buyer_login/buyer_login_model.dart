import '/flutter_flow/flutter_flow_util.dart';
import 'buyer_login_widget.dart' show BuyerLoginWidget;
import 'package:flutter/material.dart';

class BuyerLoginModel extends FlutterFlowModel<BuyerLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailTExtFeild widget.
  FocusNode? emailTExtFeildFocusNode;
  TextEditingController? emailTExtFeildTextController;
  String? Function(BuildContext, String?)?
      emailTExtFeildTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailTExtFeildFocusNode?.dispose();
    emailTExtFeildTextController?.dispose();

    textFieldFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
