import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_product_widget.dart' show CreateProductWidget;
import 'package:flutter/material.dart';

class CreateProductModel extends FlutterFlowModel<CreateProductWidget> {
  ///  Local state fields for this page.

  bool? choiceMade = false;

  List<String> colours = [];
  void addToColours(String item) => colours.add(item);
  void removeFromColours(String item) => colours.remove(item);
  void removeAtIndexFromColours(int index) => colours.removeAt(index);
  void insertAtIndexInColours(int index, String item) =>
      colours.insert(index, item);
  void updateColoursAtIndex(int index, Function(String) updateFn) =>
      colours[index] = updateFn(colours[index]);

  List<String> imags = [];
  void addToImags(String item) => imags.add(item);
  void removeFromImags(String item) => imags.remove(item);
  void removeAtIndexFromImags(int index) => imags.removeAt(index);
  void insertAtIndexInImags(int index, String item) =>
      imags.insert(index, item);
  void updateImagsAtIndex(int index, Function(String) updateFn) =>
      imags[index] = updateFn(imags[index]);

  List<String> selectedSizes = [];
  void addToSelectedSizes(String item) => selectedSizes.add(item);
  void removeFromSelectedSizes(String item) => selectedSizes.remove(item);
  void removeAtIndexFromSelectedSizes(int index) =>
      selectedSizes.removeAt(index);
  void insertAtIndexInSelectedSizes(int index, String item) =>
      selectedSizes.insert(index, item);
  void updateSelectedSizesAtIndex(int index, Function(String) updateFn) =>
      selectedSizes[index] = updateFn(selectedSizes[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for Category widget.
  FormFieldController<String>? categoryValueController;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for HasDiscountPrice widget.
  bool? hasDiscountPriceValue;
  // State field(s) for discountTextfiled widget.
  FocusNode? discountTextfiledFocusNode;
  TextEditingController? discountTextfiledTextController;
  String? Function(BuildContext, String?)?
      discountTextfiledTextControllerValidator;
  // State field(s) for Sizes widget.
  FormFieldController<List<String>>? sizesValueController;
  String? get sizesValue => sizesValueController?.value?.firstOrNull;
  set sizesValue(String? val) =>
      sizesValueController?.value = val != null ? [val] : [];
  // State field(s) for color widget.
  FocusNode? colorFocusNode;
  TextEditingController? colorTextController;
  String? Function(BuildContext, String?)? colorTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    discountTextfiledFocusNode?.dispose();
    discountTextfiledTextController?.dispose();

    colorFocusNode?.dispose();
    colorTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();
  }

  /// Additional helper methods.
  String? get categoryValue => categoryValueController?.value;
}
