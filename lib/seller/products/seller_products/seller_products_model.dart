import '/flutter_flow/flutter_flow_util.dart';
import 'seller_products_widget.dart' show SellerProductsWidget;
import 'package:flutter/material.dart';

class SellerProductsModel extends FlutterFlowModel<SellerProductsWidget> {
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
