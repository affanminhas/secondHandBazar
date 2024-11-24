import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomersRecord extends FirestoreRecord {
  CustomersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Seller_id" field.
  DocumentReference? _sellerId;
  DocumentReference? get sellerId => _sellerId;
  bool hasSellerId() => _sellerId != null;

  // "number_of_items" field.
  int? _numberOfItems;
  int get numberOfItems => _numberOfItems ?? 0;
  bool hasNumberOfItems() => _numberOfItems != null;

  // "customer" field.
  DocumentReference? _customer;
  DocumentReference? get customer => _customer;
  bool hasCustomer() => _customer != null;

  void _initializeFields() {
    _sellerId = snapshotData['Seller_id'] as DocumentReference?;
    _numberOfItems = castToType<int>(snapshotData['number_of_items']);
    _customer = snapshotData['customer'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Customers');

  static Stream<CustomersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomersRecord.fromSnapshot(s));

  static Future<CustomersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomersRecord.fromSnapshot(s));

  static CustomersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomersRecordData({
  DocumentReference? sellerId,
  int? numberOfItems,
  DocumentReference? customer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Seller_id': sellerId,
      'number_of_items': numberOfItems,
      'customer': customer,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomersRecordDocumentEquality implements Equality<CustomersRecord> {
  const CustomersRecordDocumentEquality();

  @override
  bool equals(CustomersRecord? e1, CustomersRecord? e2) {
    return e1?.sellerId == e2?.sellerId &&
        e1?.numberOfItems == e2?.numberOfItems &&
        e1?.customer == e2?.customer;
  }

  @override
  int hash(CustomersRecord? e) =>
      const ListEquality().hash([e?.sellerId, e?.numberOfItems, e?.customer]);

  @override
  bool isValidKey(Object? o) => o is CustomersRecord;
}
