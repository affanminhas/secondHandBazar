import '/flutter_flow/flutter_flow_util.dart';
import 'o_t_preset_widget.dart' show OTPresetWidget;
import 'package:flutter/material.dart';

class OTPresetModel extends FlutterFlowModel<OTPresetWidget> {
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
