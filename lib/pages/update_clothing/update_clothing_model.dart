import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_clothing_widget.dart' show AddClothingWidget;
import 'package:flutter/material.dart';

class AddClothingModel extends FlutterFlowModel<AddClothingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController3;
  List<String>? get choiceChipsValues3 => choiceChipsValueController3?.value;
  set choiceChipsValues3(List<String>? val) =>
      choiceChipsValueController3?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController4;
  List<String>? get choiceChipsValues4 => choiceChipsValueController4?.value;
  set choiceChipsValues4(List<String>? val) =>
      choiceChipsValueController4?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
