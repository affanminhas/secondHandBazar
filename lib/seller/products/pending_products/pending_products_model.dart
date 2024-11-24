import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pending_products_widget.dart' show PendingProductsWidget;
import 'package:flutter/material.dart';

class PendingProductsModel extends FlutterFlowModel<PendingProductsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for mainChip widget.
  FormFieldController<List<String>>? mainChipValueController;
  String? get mainChipValue => mainChipValueController?.value?.firstOrNull;
  set mainChipValue(String? val) =>
      mainChipValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
