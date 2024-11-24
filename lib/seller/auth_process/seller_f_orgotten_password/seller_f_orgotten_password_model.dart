import '/flutter_flow/flutter_flow_util.dart';
import 'seller_f_orgotten_password_widget.dart'
    show SellerFOrgottenPasswordWidget;
import 'package:flutter/material.dart';

class SellerFOrgottenPasswordModel
    extends FlutterFlowModel<SellerFOrgottenPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
