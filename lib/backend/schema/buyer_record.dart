import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuyerRecord extends FirestoreRecord {
  BuyerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "phone_number" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "buyerinterest" field.
  List<String>? _buyerinterest;
  List<String> get buyerinterest => _buyerinterest ?? const [];
  bool hasBuyerinterest() => _buyerinterest != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "isBuyer" field.
  bool? _isBuyer;
  bool get isBuyer => _isBuyer ?? false;
  bool hasIsBuyer() => _isBuyer != null;

  // "number_of_items" field.
  int? _numberOfItems;
  int get numberOfItems => _numberOfItems ?? 0;
  bool hasNumberOfItems() => _numberOfItems != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _phoneNumber = castToType<int>(snapshotData['phone_number']);
    _buyerinterest = getDataList(snapshotData['buyerinterest']);
    _location = snapshotData['location'] as String?;
    _email = snapshotData['email'] as String?;
    _image = snapshotData['image'] as String?;
    _isBuyer = snapshotData['isBuyer'] as bool?;
    _numberOfItems = castToType<int>(snapshotData['number_of_items']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('buyer');

  static Stream<BuyerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BuyerRecord.fromSnapshot(s));

  static Future<BuyerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BuyerRecord.fromSnapshot(s));

  static BuyerRecord fromSnapshot(DocumentSnapshot snapshot) => BuyerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BuyerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BuyerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BuyerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BuyerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBuyerRecordData({
  DocumentReference? userId,
  String? name,
  int? age,
  int? phoneNumber,
  String? location,
  String? email,
  String? image,
  bool? isBuyer,
  int? numberOfItems,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'name': name,
      'age': age,
      'phone_number': phoneNumber,
      'location': location,
      'email': email,
      'image': image,
      'isBuyer': isBuyer,
      'number_of_items': numberOfItems,
    }.withoutNulls,
  );

  return firestoreData;
}

class BuyerRecordDocumentEquality implements Equality<BuyerRecord> {
  const BuyerRecordDocumentEquality();

  @override
  bool equals(BuyerRecord? e1, BuyerRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.name == e2?.name &&
        e1?.age == e2?.age &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.buyerinterest, e2?.buyerinterest) &&
        e1?.location == e2?.location &&
        e1?.email == e2?.email &&
        e1?.image == e2?.image &&
        e1?.isBuyer == e2?.isBuyer &&
        e1?.numberOfItems == e2?.numberOfItems;
  }

  @override
  int hash(BuyerRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.name,
        e?.age,
        e?.phoneNumber,
        e?.buyerinterest,
        e?.location,
        e?.email,
        e?.image,
        e?.isBuyer,
        e?.numberOfItems
      ]);

  @override
  bool isValidKey(Object? o) => o is BuyerRecord;
}
