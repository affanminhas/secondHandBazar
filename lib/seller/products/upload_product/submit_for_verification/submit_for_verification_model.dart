import '/flutter_flow/flutter_flow_util.dart';
import 'submit_for_verification_widget.dart' show SubmitForVerificationWidget;
import 'package:flutter/material.dart';

class SubmitForVerificationModel
    extends FlutterFlowModel<SubmitForVerificationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Hasdefaults widget.
  bool? hasdefaultsValue;
  // State field(s) for def_des widget.
  FocusNode? defDesFocusNode;
  TextEditingController? defDesTextController;
  String? Function(BuildContext, String?)? defDesTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    defDesFocusNode?.dispose();
    defDesTextController?.dispose();
  }
}
