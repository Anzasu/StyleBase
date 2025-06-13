import 'package:style_base/backend/globals.dart';
import 'package:style_base/backend/models/ClothingItem.dart';
import 'package:style_base/backend/services/database_service.dart';
import 'package:style_base/pages/action_start/action_start_widget.dart';
import 'package:style_base/pages/overview_page/overview_page_widget.dart';
import 'package:style_base/pages/update_clothing/update_clothing_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'overview_category_model.dart';
export 'overview_category_model.dart';

class OverviewCategoryWidget extends StatefulWidget {
  const OverviewCategoryWidget({super.key});

  static String routeName = 'Overview_Category';
  static String routePath = '/overviewCategory';

  @override
  State<OverviewCategoryWidget> createState() => _OverviewCategoryWidgetState();
}

class _OverviewCategoryWidgetState extends State<OverviewCategoryWidget> {
  late OverviewCategoryModel _model;

  int count = 0;

  final DatabaseService _databaseService = DatabaseService.instance;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OverviewCategoryModel());
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
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    height: MediaQuery.sizeOf(context).height * 0.85,
                    decoration: BoxDecoration(
                      color: Color(0x22FFFFFF),
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  45.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 50.0,
                                            icon: Icon(
                                              Icons.arrow_back,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 45.0,
                                            ),
                                            onPressed: () {
                                              context.pushNamed(
                                                  OverviewPageWidget.routeName);

                                              setState(() {
                                                filterCategory = 0;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  450.0, 30.0, 0.0, 0.0),
                                          child: Text(
                                            'Filtered by Category',
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  font: GoogleFonts.interTight(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displayLarge
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 35.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: getItemsListView(),
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

  Widget getItemsListView() {
    debugPrint('Current filterCategory: $filterCategory');

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 150.0),
      child: FutureBuilder<List<ClothingItem>>(
        future: _databaseService.getCategoryItems(filterCategory),
        builder: (context, snapshot) {
          debugPrint('Snapshot state: ${snapshot.connectionState}');
          if (snapshot.hasError) {
            debugPrint('Error: ${snapshot.error}');
            return Center(
                child: Text(
              'Error loading items',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 28.0,
                  ),
            ));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            debugPrint('No data available');
            return Center(
                child: Text(
              'No items found for this category',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 28.0,
                  ),
            ));
          }

          debugPrint('Number of items: ${snapshot.data!.length}');
          return ListView.builder(
            physics:
                AlwaysScrollableScrollPhysics(), // Ensure it's always scrollable
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final item = snapshot.data![index];
              debugPrint('Displaying item: ${item.toString()}');

              return Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(36, 255, 255, 255),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 75.0,
                      icon: Icon(
                        Icons.edit,
                        color: FlutterFlowTheme.of(context).info,
                        size: 25.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateClothingWidget(
                              item: item,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  title: Text(
                    item.name,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 28.0,
                        ),
                  ),
                  subtitle: Text(
                    "Season: ${item.seasonName}, "
                    "Color: ${item.colorName}, "
                    "Type: ${item.typeName}, "
                    "Category: ${item.categoryName}",
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.normal,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 15.0,
                        ),
                  ),
                  trailing: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.delete_forever,
                      color: FlutterFlowTheme.of(context).info,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Delete Item'),
                          content: Text(
                              'Are you sure you want to delete ${item.name}?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      );

                      if (confirmed == true) {
                        try {
                          final deletedCount =
                              await _databaseService.deleteItem(item.id);
                          if (deletedCount > 0) {
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Item deleted successfully')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Item not found')),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error deleting item: $e')),
                          );
                        }
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
