import '/flutter_flow/flutter_flow_util.dart';
import 'seller_verifyemail_copy_widget.dart' show SellerVerifyemailCopyWidget;
import 'package:flutter/material.dart';

class SellerVerifyemailCopyModel
    extends FlutterFlowModel<SellerVerifyemailCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
