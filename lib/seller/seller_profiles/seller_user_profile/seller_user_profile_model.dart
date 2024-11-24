import '/flutter_flow/flutter_flow_util.dart';
import 'seller_user_profile_widget.dart' show SellerUserProfileWidget;
import 'package:flutter/material.dart';

class SellerUserProfileModel extends FlutterFlowModel<SellerUserProfileWidget> {
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
