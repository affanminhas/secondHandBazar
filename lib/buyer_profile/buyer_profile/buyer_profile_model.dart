import '/flutter_flow/flutter_flow_util.dart';
import 'buyer_profile_widget.dart' show BuyerProfileWidget;
import 'package:flutter/material.dart';

class BuyerProfileModel extends FlutterFlowModel<BuyerProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
