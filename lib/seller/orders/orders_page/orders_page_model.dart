import '/flutter_flow/flutter_flow_util.dart';
import 'orders_page_widget.dart' show OrdersPageWidget;
import 'package:flutter/material.dart';

class OrdersPageModel extends FlutterFlowModel<OrdersPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for tabview widget.
  TabController? tabviewController;
  int get tabviewCurrentIndex =>
      tabviewController != null ? tabviewController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabviewController?.dispose();
  }
}
