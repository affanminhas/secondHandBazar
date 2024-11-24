import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_count_model.dart';
export 'order_count_model.dart';

class OrderCountWidget extends StatefulWidget {
  const OrderCountWidget({super.key});

  @override
  State<OrderCountWidget> createState() => _OrderCountWidgetState();
}

class _OrderCountWidgetState extends State<OrderCountWidget> {
  late OrderCountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderCountModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            borderRadius: 24.0,
            borderWidth: 1.0,
            buttonSize: 25.0,
            fillColor: FlutterFlowTheme.of(context).tertiary,
            icon: FaIcon(
              FontAwesomeIcons.minus,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 10.0,
            ),
            onPressed: () async {
              FFAppState().ItemCount = FFAppState().ItemCount + -1;
              safeSetState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: AutoSizeText(
              valueOrDefault<String>(
                FFAppState().ItemCount.toString(),
                '0',
              ),
              minFontSize: 10.0,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primary,
            borderRadius: 24.0,
            borderWidth: 1.0,
            buttonSize: 25.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 10.0,
            ),
            onPressed: () async {},
          ),
        ],
      ),
    );
  }
}
