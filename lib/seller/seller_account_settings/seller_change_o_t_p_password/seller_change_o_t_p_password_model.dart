import '/flutter_flow/flutter_flow_util.dart';
import 'seller_change_o_t_p_password_widget.dart'
    show SellerChangeOTPPasswordWidget;
import 'package:flutter/material.dart';

class SellerChangeOTPPasswordModel
    extends FlutterFlowModel<SellerChangeOTPPasswordWidget> {
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
