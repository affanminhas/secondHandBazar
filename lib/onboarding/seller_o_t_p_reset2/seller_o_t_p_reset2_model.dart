import '/flutter_flow/flutter_flow_util.dart';
import 'seller_o_t_p_reset2_widget.dart' show SellerOTPReset2Widget;
import 'package:flutter/material.dart';

class SellerOTPReset2Model extends FlutterFlowModel<SellerOTPReset2Widget> {
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
