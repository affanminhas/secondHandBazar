import '/flutter_flow/flutter_flow_util.dart';
import 'product_details_processing_widget.dart'
    show ProductDetailsProcessingWidget;
import 'package:flutter/material.dart';

class ProductDetailsProcessingModel
    extends FlutterFlowModel<ProductDetailsProcessingWidget> {
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
