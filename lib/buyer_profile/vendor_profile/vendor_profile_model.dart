import '/app_component/na_v_b_a_r/na_v_b_a_r_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'vendor_profile_widget.dart' show VendorProfileWidget;
import 'package:flutter/material.dart';

class VendorProfileModel extends FlutterFlowModel<VendorProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ItemType widget.
  String? itemTypeValue;
  FormFieldController<String>? itemTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // Model for NaVBAR component.
  late NaVBARModel naVBARModel;

  @override
  void initState(BuildContext context) {
    naVBARModel = createModel(context, () => NaVBARModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    naVBARModel.dispose();
  }
}
