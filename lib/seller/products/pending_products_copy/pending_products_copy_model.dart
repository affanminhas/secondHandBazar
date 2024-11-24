import '/flutter_flow/flutter_flow_util.dart';
import 'pending_products_copy_widget.dart' show PendingProductsCopyWidget;
import 'package:flutter/material.dart';

class PendingProductsCopyModel
    extends FlutterFlowModel<PendingProductsCopyWidget> {
  ///  Local state fields for this page.

  String selectedTab = 'All';

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
