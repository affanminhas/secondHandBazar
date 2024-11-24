import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_product_choice_widget.dart' show CreateProductChoiceWidget;
import 'package:flutter/material.dart';

class CreateProductChoiceModel
    extends FlutterFlowModel<CreateProductChoiceWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Delivery widget.
  FormFieldController<String>? deliveryValueController;
  // State field(s) for payment widget.
  FormFieldController<String>? paymentValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get deliveryValue => deliveryValueController?.value;
  String? get paymentValue => paymentValueController?.value;
}
