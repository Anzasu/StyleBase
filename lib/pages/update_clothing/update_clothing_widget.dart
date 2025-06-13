import 'package:style_base/backend/globals.dart';
import 'package:style_base/backend/globals.dart' as globals;
import 'package:style_base/backend/models/ClothingItem.dart';
import 'package:style_base/backend/services/database_service.dart';
import 'package:style_base/flutter_flow/flutter_flow_icon_button.dart';
import 'package:style_base/pages/action_start/action_start_widget.dart';

import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'update_clothing_model.dart';
export 'update_clothing_model.dart';
import 'package:sqflite/sqflite.dart';

class UpdateClothingWidget extends StatefulWidget {
  const UpdateClothingWidget({
    super.key,
    required this.item, // Make this required
  });

  static String routeName = 'UpdateClothing';
  static String routePath = '/updateClothing';

  final ClothingItem item;
  @override
  State<UpdateClothingWidget> createState() => _UpdateClothingWidgetState();
}

class _UpdateClothingWidgetState extends State<UpdateClothingWidget> {
  late UpdateClothingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateClothingModel());

    _model.textController ??= TextEditingController(text: widget.item.name);

    _model.choiceChipsValueController1 =
        FormFieldController<List<String>>([widget.item.seasonName]);
    _model.choiceChipsValueController2 =
        FormFieldController<List<String>>([widget.item.colorName]);
    _model.choiceChipsValueController3 =
        FormFieldController<List<String>>([widget.item.typeName]);
    _model.choiceChipsValueController4 =
        FormFieldController<List<String>>([widget.item.categoryName]);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent2,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/01db75ae-395b-4b69-985d-99fb4427d393.jpg',
                ).image,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 7.0,
                    sigmaY: 10.0,
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: MediaQuery.sizeOf(context).height * 0.85,
                    decoration: BoxDecoration(
                      color: Color(0x22FFFFFF),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 8.0,
                                          buttonSize: 50.0,
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 45.0,
                                          ),
                                          onPressed: () {
                                            context.pushNamed(
                                                ActionStartWidget.routeName);
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 30.0, 0.0, 0.0),
                                        child: Text(
                                          'Update item',
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 35.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        try {
                                          // Get the selected values from the form
                                          final selectedSeason = _model
                                              .choiceChipsValues1?.firstOrNull;
                                          final selectedColor = _model
                                              .choiceChipsValues2?.firstOrNull;
                                          final selectedType = _model
                                              .choiceChipsValues3?.firstOrNull;
                                          final selectedCategory = _model
                                              .choiceChipsValues4?.firstOrNull;
                                          final name =
                                              _model.textController.text;

                                          // Validate name
                                          if (name.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Please enter a name')),
                                            );
                                            return;
                                          }

                                          // Convert names to IDs
                                          final seasonId = selectedSeason !=
                                                  null
                                              ? await DatabaseService.instance
                                                  .getSeasonIdFromName(
                                                      selectedSeason)
                                              : widget.item.season;

                                          final colorId = selectedColor != null
                                              ? await DatabaseService.instance
                                                  .getColorIdFromName(
                                                      selectedColor)
                                              : widget.item.color;

                                          final typeId = selectedType != null
                                              ? await DatabaseService.instance
                                                  .getTypeIdFromName(
                                                      selectedType)
                                              : widget.item.type;

                                          final categoryId = selectedCategory !=
                                                  null
                                              ? await DatabaseService.instance
                                                  .getCategoryIdFromName(
                                                      selectedCategory)
                                              : widget.item.category;

                                          // Debug prints to verify values
                                          debugPrint('Updating item with:');
                                          debugPrint('Name: $name');
                                          debugPrint(
                                              'Season: $selectedSeason → $seasonId');
                                          debugPrint(
                                              'Color: $selectedColor → $colorId');
                                          debugPrint(
                                              'Type: $selectedType → $typeId');
                                          debugPrint(
                                              'Category: $selectedCategory → $categoryId');

                                          // Create updated item
                                          final updatedItem =
                                              widget.item.copyWith(
                                            name: name,
                                            season: seasonId,
                                            color: colorId,
                                            type: typeId,
                                            category: categoryId,
                                          );

                                          // Update in database
                                          final success = await DatabaseService
                                              .instance
                                              .updateItem(updatedItem);

                                          if (success > 0) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Item updated successfully!')),
                                            );
                                            if (mounted)
                                              Navigator.pop(context, true);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content: Text(
                                                      'Failed to update item')),
                                            );
                                          }
                                        } catch (e) {
                                          debugPrint('Error updating item: $e');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Error: ${e.toString()}')),
                                          );
                                        }
                                      },
                                      text: 'UPDATE',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        color:
                                            Color.fromARGB(214, 143, 39, 164),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                          font: GoogleFonts.interTight(),
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 2.0,
                                            )
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                // Name Field
                                Text(
                                  'Name',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 28.0,
                                      ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0x29FFFFFF),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w300,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 20.0,
                                      ),
                                  onChanged: (value) {
                                    setState(() {
                                      globals.setCurrentItemName(value);
                                    });
                                  },
                                ),
                                SizedBox(height: 30),
                                // ************* Season *******************************
                                Text(
                                  'Season',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 28.0,
                                      ),
                                ),
                                SizedBox(height: 10),
                                FlutterFlowChoiceChips(
                                  options: [
                                    ChipData('Summer'),
                                    ChipData('Winter'),
                                    ChipData('Fall'),
                                    ChipData('Spring')
                                  ],
                                  onChanged: (val) {
                                    _model.choiceChipsValues1 = val;
                                    setState(() {
                                      globals.setCurrentItemSeason(
                                          _model.choiceChipsValues1!.first);
                                    });
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xB2E8B9FF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                        ),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0x2ACBAFDB),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                        ),
                                  ),
                                  chipSpacing: 25.0,
                                  multiselect: false,
                                  controller:
                                      _model.choiceChipsValueController1 ??=
                                          FormFieldController<List<String>>([]),
                                  wrapped: true,
                                ),
                                SizedBox(height: 30),
                                // **************** Color *******************
                                Text(
                                  'Color',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 28.0,
                                      ),
                                ),
                                SizedBox(height: 10),
                                FlutterFlowChoiceChips(
                                  options: [
                                    ChipData('Red'),
                                    ChipData('Black'),
                                    ChipData('Blue'),
                                    ChipData('White'),
                                    ChipData('Green'),
                                    ChipData('Yellow')
                                  ],
                                  onChanged: (val) {
                                    _model.choiceChipsValues2 = val;
                                    setState(() {
                                      globals.setCurrentItemColor(
                                          _model.choiceChipsValues2!.first);
                                    });
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xB2E8B9FF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                        ),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0x2ACBAFDB),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                        ),
                                  ),
                                  chipSpacing: 25.0,
                                  multiselect: false,
                                  controller:
                                      _model.choiceChipsValueController2 ??=
                                          FormFieldController<List<String>>([]),
                                  wrapped: true,
                                ),

                                SizedBox(height: 30),
                                // *********************** Type ************************
                                Text(
                                  'Type',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 28.0,
                                      ),
                                ),
                                SizedBox(height: 10),
                                FlutterFlowChoiceChips(
                                  options: [
                                    ChipData('Shirts'),
                                    ChipData('Pants'),
                                    ChipData('Skirts'),
                                    ChipData('Dresses'),
                                    ChipData('Jackets')
                                  ],
                                  onChanged: (val) {
                                    _model.choiceChipsValues3 = val;
                                    setState(() {
                                      globals.setCurrentItemType(
                                          _model.choiceChipsValues3!.first);
                                    });
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xB2E8B9FF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                        ),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0x2ACBAFDB),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                        ),
                                  ),
                                  chipSpacing: 25.0,
                                  multiselect: false,
                                  controller:
                                      _model.choiceChipsValueController3 ??=
                                          FormFieldController<List<String>>([]),
                                  wrapped: true,
                                ),

                                SizedBox(height: 30),
                                // *************** Category ********************
                                Text(
                                  'Category',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 28.0,
                                      ),
                                ),
                                SizedBox(height: 10),
                                FlutterFlowChoiceChips(
                                  options: [
                                    ChipData('Casual wear'),
                                    ChipData('Traditional wear'),
                                    ChipData('Formal wear'),
                                    ChipData('Sports wear')
                                  ],
                                  onChanged: (val) {
                                    _model.choiceChipsValues4 = val;
                                    setState(() {
                                      globals.setCurrentItemCategory(
                                          _model.choiceChipsValues4!.first);
                                    });
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0xB2E8B9FF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                        ),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Color(0x2ACBAFDB),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w300,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                        ),
                                  ),
                                  chipSpacing: 25.0,
                                  multiselect: false,
                                  controller:
                                      _model.choiceChipsValueController4 ??=
                                          FormFieldController<List<String>>([]),
                                  wrapped: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
