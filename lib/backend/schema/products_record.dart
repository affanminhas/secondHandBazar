import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "has_defaults" field.
  bool? _hasDefaults;
  bool get hasDefaults => _hasDefaults ?? false;
  bool hasHasDefaults() => _hasDefaults != null;

  // "default_description" field.
  String? _defaultDescription;
  String get defaultDescription => _defaultDescription ?? '';
  bool hasDefaultDescription() => _defaultDescription != null;

  // "seller_ref" field.
  DocumentReference? _sellerRef;
  DocumentReference? get sellerRef => _sellerRef;
  bool hasSellerRef() => _sellerRef != null;

  // "sizes" field.
  List<String>? _sizes;
  List<String> get sizes => _sizes ?? const [];
  bool hasSizes() => _sizes != null;

  // "colour" field.
  List<String>? _colour;
  List<String> get colour => _colour ?? const [];
  bool hasColour() => _colour != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "delivery" field.
  List<String>? _delivery;
  List<String> get delivery => _delivery ?? const [];
  bool hasDelivery() => _delivery != null;

  // "payment_methods" field.
  List<String>? _paymentMethods;
  List<String> get paymentMethods => _paymentMethods ?? const [];
  bool hasPaymentMethods() => _paymentMethods != null;

  // "user_liked" field.
  DocumentReference? _userLiked;
  DocumentReference? get userLiked => _userLiked;
  bool hasUserLiked() => _userLiked != null;

  // "discounted_price" field.
  double? _discountedPrice;
  double get discountedPrice => _discountedPrice ?? 0.0;
  bool hasDiscountedPrice() => _discountedPrice != null;

  // "has_message" field.
  bool? _hasMessage;
  bool get hasMessage => _hasMessage ?? false;
  bool hasHasMessage() => _hasMessage != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "buyerRef" field.
  DocumentReference? _buyerRef;
  DocumentReference? get buyerRef => _buyerRef;
  bool hasBuyerRef() => _buyerRef != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "isVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _category = snapshotData['category'] as String?;
    _hasDefaults = snapshotData['has_defaults'] as bool?;
    _defaultDescription = snapshotData['default_description'] as String?;
    _sellerRef = snapshotData['seller_ref'] as DocumentReference?;
    _sizes = getDataList(snapshotData['sizes']);
    _colour = getDataList(snapshotData['colour']);
    _images = getDataList(snapshotData['images']);
    _delivery = getDataList(snapshotData['delivery']);
    _paymentMethods = getDataList(snapshotData['payment_methods']);
    _userLiked = snapshotData['user_liked'] as DocumentReference?;
    _discountedPrice = castToType<double>(snapshotData['discounted_price']);
    _hasMessage = snapshotData['has_message'] as bool?;
    _status = snapshotData['status'] as String?;
    _buyerRef = snapshotData['buyerRef'] as DocumentReference?;
    _id = snapshotData['id'] as String?;
    _isVerified = snapshotData['isVerified'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  String? description,
  double? price,
  DateTime? createdAt,
  int? quantity,
  String? category,
  bool? hasDefaults,
  String? defaultDescription,
  DocumentReference? sellerRef,
  DocumentReference? userLiked,
  double? discountedPrice,
  bool? hasMessage,
  String? status,
  DocumentReference? buyerRef,
  String? id,
  bool? isVerified,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'created_at': createdAt,
      'quantity': quantity,
      'category': category,
      'has_defaults': hasDefaults,
      'default_description': defaultDescription,
      'seller_ref': sellerRef,
      'user_liked': userLiked,
      'discounted_price': discountedPrice,
      'has_message': hasMessage,
      'status': status,
      'buyerRef': buyerRef,
      'id': id,
      'isVerified': isVerified,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.createdAt == e2?.createdAt &&
        e1?.quantity == e2?.quantity &&
        e1?.category == e2?.category &&
        e1?.hasDefaults == e2?.hasDefaults &&
        e1?.defaultDescription == e2?.defaultDescription &&
        e1?.sellerRef == e2?.sellerRef &&
        listEquality.equals(e1?.sizes, e2?.sizes) &&
        listEquality.equals(e1?.colour, e2?.colour) &&
        listEquality.equals(e1?.images, e2?.images) &&
        listEquality.equals(e1?.delivery, e2?.delivery) &&
        listEquality.equals(e1?.paymentMethods, e2?.paymentMethods) &&
        e1?.userLiked == e2?.userLiked &&
        e1?.discountedPrice == e2?.discountedPrice &&
        e1?.hasMessage == e2?.hasMessage &&
        e1?.status == e2?.status &&
        e1?.buyerRef == e2?.buyerRef &&
        e1?.id == e2?.id &&
        e1?.isVerified == e2?.isVerified;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.createdAt,
        e?.quantity,
        e?.category,
        e?.hasDefaults,
        e?.defaultDescription,
        e?.sellerRef,
        e?.sizes,
        e?.colour,
        e?.images,
        e?.delivery,
        e?.paymentMethods,
        e?.userLiked,
        e?.discountedPrice,
        e?.hasMessage,
        e?.status,
        e?.buyerRef,
        e?.id,
        e?.isVerified
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
