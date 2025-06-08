import 'package:style_base/pages/overview_page/overview_page_widget.dart';
import 'package:style_base/pages/update_clothing/update_clothing_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'overview_color_model.dart';
export 'overview_color_model.dart';

class OverviewColorWidget extends StatefulWidget {
  const OverviewColorWidget({super.key});

  static String routeName = 'Overview_Color';
  static String routePath = '/overviewColor';

  @override
  State<OverviewColorWidget> createState() => _OverviewColorWidgetState();
}

class _OverviewColorWidgetState extends State<OverviewColorWidget> {
  late OverviewColorModel _model;

  int count = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OverviewColorModel());
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
                                            'Filtered by Color',
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
                        // List Section (Scrollable)
                        Positioned(
                          top: 100, // Adjust this based on your header height
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
    count = 20; // Set to number of items you want to display

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 150.0), // Horizontal padding
      child: ListView.builder(
        physics:
            AlwaysScrollableScrollPhysics(), // Ensure it's always scrollable
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8.0), // Spacing between items
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
                    context.pushNamed(UpdateClothingWidget.routeName);
                  },
                ),
              ),
              title: Text(
                'Item $position',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 28.0,
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
                onPressed: () {
                  debugPrint("pressed delete");
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
