import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "buyer_id" field.
  DocumentReference? _buyerId;
  DocumentReference? get buyerId => _buyerId;
  bool hasBuyerId() => _buyerId != null;

  // "seller_id" field.
  DocumentReference? _sellerId;
  DocumentReference? get sellerId => _sellerId;
  bool hasSellerId() => _sellerId != null;

  // "delivery_instructions" field.
  String? _deliveryInstructions;
  String get deliveryInstructions => _deliveryInstructions ?? '';
  bool hasDeliveryInstructions() => _deliveryInstructions != null;

  // "shipping_address" field.
  String? _shippingAddress;
  String get shippingAddress => _shippingAddress ?? '';
  bool hasShippingAddress() => _shippingAddress != null;

  // "productOrdered" field.
  List<DocumentReference>? _productOrdered;
  List<DocumentReference> get productOrdered => _productOrdered ?? const [];
  bool hasProductOrdered() => _productOrdered != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "phone_number" field.
  double? _phoneNumber;
  double get phoneNumber => _phoneNumber ?? 0.0;
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _buyerId = snapshotData['buyer_id'] as DocumentReference?;
    _sellerId = snapshotData['seller_id'] as DocumentReference?;
    _deliveryInstructions = snapshotData['delivery_instructions'] as String?;
    _shippingAddress = snapshotData['shipping_address'] as String?;
    _productOrdered = getDataList(snapshotData['productOrdered']);
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _phoneNumber = castToType<double>(snapshotData['phone_number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  DocumentReference? buyerId,
  DocumentReference? sellerId,
  String? deliveryInstructions,
  String? shippingAddress,
  String? status,
  DateTime? createdAt,
  DocumentReference? userRef,
  double? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'buyer_id': buyerId,
      'seller_id': sellerId,
      'delivery_instructions': deliveryInstructions,
      'shipping_address': shippingAddress,
      'status': status,
      'created_at': createdAt,
      'userRef': userRef,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.buyerId == e2?.buyerId &&
        e1?.sellerId == e2?.sellerId &&
        e1?.deliveryInstructions == e2?.deliveryInstructions &&
        e1?.shippingAddress == e2?.shippingAddress &&
        listEquality.equals(e1?.productOrdered, e2?.productOrdered) &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.buyerId,
        e?.sellerId,
        e?.deliveryInstructions,
        e?.shippingAddress,
        e?.productOrdered,
        e?.status,
        e?.createdAt,
        e?.userRef,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
