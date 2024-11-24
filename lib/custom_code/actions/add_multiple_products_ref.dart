// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addMultipleProductsRef(
  DocumentReference? userRef,
  DocumentReference? buyerRef,
  String? deliveryInstructions,
  String? shippingAddress,
  String? status,
  DateTime? createdAt,
  List<DocumentReference>? productOrdered,
  int? cartItemLength,
) async {
  // Add your function code here!
  cartItemLength ??= 1;
  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // Get a reference to the collection
  final collectionRef = firestore.collection('Order');

  // final doc = await createOrderRecordData(
  //     userRef: userRef,
  //     buyerId: buyerRef,
  //     deliveryInstructions: deliveryInstructions,
  //     shippingAddress: shippingAddress,
  //     status: 'pending',
  //     createdAt: createdAt);

  final doc2 = {
    'userRef': userRef,
    'productOrdered': productOrdered,
    'buyerId': buyerRef,
    'deliveryInstructions': deliveryInstructions,
    'shippingAddress': shippingAddress,
    'status': 'pending',
    'createdAt': createdAt
  };

  // final doc2 = await mapToFirestore({
  //   'productOrdered': [productOrdered],
  // });
  //await collectionRef.add(doc);
  await collectionRef.add(doc2);
  // for (int i = 0; i <= cartItemLength; i++) {
  //   final doc1 = createOrderRecordData(productOrdered: productOrdered![i]);
  //   // ...mapToFirestore(
  //   //         {
  //   //           'productOrdered': [
  //   //             paymentScreenCartRecordList.first.productRef
  //   //           ],
  //   //         },
  // }
}
