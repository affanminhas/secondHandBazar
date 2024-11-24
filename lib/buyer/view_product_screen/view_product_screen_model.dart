import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'view_product_screen_widget.dart' show ViewProductScreenWidget;
import 'package:flutter/material.dart';

class ViewProductScreenModel extends FlutterFlowModel<ViewProductScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for sizeChips widget.
  FormFieldController<List<String>>? sizeChipsValueController;
  String? get sizeChipsValue => sizeChipsValueController?.value?.firstOrNull;
  set sizeChipsValue(String? val) =>
      sizeChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for colorChips widget.
  FormFieldController<List<String>>? colorChipsValueController;
  String? get colorChipsValue => colorChipsValueController?.value?.firstOrNull;
  set colorChipsValue(String? val) =>
      colorChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
