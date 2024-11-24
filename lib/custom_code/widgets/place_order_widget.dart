// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PlaceOrderWidget extends StatefulWidget {
  const PlaceOrderWidget({
    super.key,
    this.width,
    this.height,
    required this.amount,
    required this.name,
    required this.contact,
    required this.email,
    required this.description,
    required this.currentUserRef,
    required this.buyerRef,
    required this.deliveryInstruction,
    required this.shippingAddress,
    required this.productOrdered,
    required this.cartItems,
  });

  final double? width;
  final double? height;
  final double amount;
  final String name;
  final String contact;
  final String email;
  final String description;

  final DocumentReference currentUserRef;
  final DocumentReference buyerRef;
  final String deliveryInstruction;
  final String shippingAddress;
  final List<DocumentReference> productOrdered;
  final int cartItems;

  @override
  State<PlaceOrderWidget> createState() => _PlaceOrderWidgetState();
}

class _PlaceOrderWidgetState extends State<PlaceOrderWidget> {
  late final Razorpay _razorpay;
  String _paymentResponseMessage = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeRazorpay();
  }

  _initializeRazorpay() {
    _razorpay = Razorpay();
    if (!kIsWeb) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    }
  }

  Widget circularProgressIndicator() => const SizedBox(
        height: 26,
        width: 26,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 3,
        ),
      );

  Future<void> getOrderId() async {
    setState(() {
      isLoading = true;
    });
    String username = 'rzp_live_gjG4BqXNEDRl0y';
    String password = 'GX7MKpXFd26cGzv8QKtAJBra';

    /// Encoding the username and password in base64
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    /// Define the headers with the Authorization header
    var headers = {
      'content-type': 'application/json',
      'Authorization': basicAuth,
    };

    /// Define the body of the request
    var body = {
      'amount': widget.amount * 100,
      'currency': 'INR',
    };
    try {
      final response = await http.post(
        headers: headers,
        Uri.parse('https://api.razorpay.com/v1/orders'),
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;
        log(result.toString());
        openRazorPaySheet(result);
      }
    } catch (e) {
      log('Error getting order id: ${e.toString()}');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void openRazorPaySheet(Map<String, dynamic> result) {
    var options = {
      'key': 'rzp_live_gjG4BqXNEDRl0y',
      'amount': result['amount'], //in the smallest currency sub-unit.
      'name': widget.name,
      'order_id': result['id'], // Generate order_id using Orders API
      'description': widget.description,
      'timeout': 120, // in seconds
      'prefill': {
        'contact': widget.contact,
        'email': widget.email,
      }
    };

    /// Opening the Razorpay sheet
    _razorpay.open(options);
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        backgroundColor: Colors.green,
        content: Row(
          children: [
            Text("Payment successful"),
            Spacer(),
            Icon(Icons.check, color: Colors.white, size: 22),
          ],
        ),
        duration: Duration(milliseconds: 3000),
      ),
    );
    await updateBackend();
    if (mounted) {
      context.goNamed('PaymentSuccess');
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Text("Payment Failed"),
            Spacer(),
            Icon(Icons.clear, color: Colors.white, size: 22),
          ],
        ),
        duration: Duration(milliseconds: 3000),
      ),
    );
  }

  Future<void> updateBackend() async {
    final fireStore = FirebaseFirestore.instance;
    final collectionRef = fireStore.collection('Order');
    final doc2 = {
      'userRef': widget.currentUserRef,
      'productOrdered': widget.productOrdered,
      'buyerId': widget.buyerRef,
      'deliveryInstructions': widget.deliveryInstruction,
      'shippingAddress': widget.shippingAddress,
      'status': 'pending',
      'createdAt': getCurrentTimestamp,
    };
    await collectionRef.add(doc2);

    await widget.buyerRef.update(createBuyerRecordData(
      numberOfItems: 1,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            getOrderId();
          },
          color: FlutterFlowTheme.of(context).primary,
          height: 50.0,
          minWidth: double.infinity,
          elevation: 2.0,
          padding: const EdgeInsets.all(0.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          disabledColor: FlutterFlowTheme.of(context).secondaryText,
          disabledTextColor: FlutterFlowTheme.of(context).secondaryBackground,
          child: Text(
            isLoading ? 'Loading Razorpay...' : 'Place Order',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleSmallFamily),
                ),
          ),
        ),
      ],
    );
  }
}
