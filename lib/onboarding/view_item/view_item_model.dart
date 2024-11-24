import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'view_item_widget.dart' show ViewItemWidget;
import 'package:flutter/material.dart';

class ViewItemModel extends FlutterFlowModel<ViewItemWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for colorChips widget.
  FormFieldController<List<String>>? colorChipsValueController;
  String? get colorChipsValue => colorChipsValueController?.value?.firstOrNull;
  set colorChipsValue(String? val) =>
      colorChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for SizeChips widget.
  FormFieldController<List<String>>? sizeChipsValueController;
  String? get sizeChipsValue => sizeChipsValueController?.value?.firstOrNull;
  set sizeChipsValue(String? val) =>
      sizeChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
