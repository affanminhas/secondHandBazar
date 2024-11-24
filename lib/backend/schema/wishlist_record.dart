import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WishlistRecord extends FirestoreRecord {
  WishlistRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "buyer_id" field.
  DocumentReference? _buyerId;
  DocumentReference? get buyerId => _buyerId;
  bool hasBuyerId() => _buyerId != null;

  // "product" field.
  List<DocumentReference>? _product;
  List<DocumentReference> get product => _product ?? const [];
  bool hasProduct() => _product != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "isLiked" field.
  bool? _isLiked;
  bool get isLiked => _isLiked ?? false;
  bool hasIsLiked() => _isLiked != null;

  void _initializeFields() {
    _buyerId = snapshotData['buyer_id'] as DocumentReference?;
    _product = getDataList(snapshotData['product']);
    _userId = snapshotData['user_id'] as DocumentReference?;
    _isLiked = snapshotData['isLiked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wishlist');

  static Stream<WishlistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WishlistRecord.fromSnapshot(s));

  static Future<WishlistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WishlistRecord.fromSnapshot(s));

  static WishlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WishlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WishlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WishlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WishlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WishlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWishlistRecordData({
  DocumentReference? buyerId,
  DocumentReference? userId,
  bool? isLiked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'buyer_id': buyerId,
      'user_id': userId,
      'isLiked': isLiked,
    }.withoutNulls,
  );

  return firestoreData;
}

class WishlistRecordDocumentEquality implements Equality<WishlistRecord> {
  const WishlistRecordDocumentEquality();

  @override
  bool equals(WishlistRecord? e1, WishlistRecord? e2) {
    const listEquality = ListEquality();
    return e1?.buyerId == e2?.buyerId &&
        listEquality.equals(e1?.product, e2?.product) &&
        e1?.userId == e2?.userId &&
        e1?.isLiked == e2?.isLiked;
  }

  @override
  int hash(WishlistRecord? e) => const ListEquality()
      .hash([e?.buyerId, e?.product, e?.userId, e?.isLiked]);

  @override
  bool isValidKey(Object? o) => o is WishlistRecord;
}
