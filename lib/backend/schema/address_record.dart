import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressRecord extends FirestoreRecord {
  AddressRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "address_type" field.
  String? _addressType;
  String get addressType => _addressType ?? '';
  bool hasAddressType() => _addressType != null;

  // "phone_number" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 0;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "buyerRef" field.
  DocumentReference? _buyerRef;
  DocumentReference? get buyerRef => _buyerRef;
  bool hasBuyerRef() => _buyerRef != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "pincode" field.
  String? _pincode;
  String get pincode => _pincode ?? '';
  bool hasPincode() => _pincode != null;

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _addressType = snapshotData['address_type'] as String?;
    _phoneNumber = castToType<int>(snapshotData['phone_number']);
    _buyerRef = snapshotData['buyerRef'] as DocumentReference?;
    _userId = snapshotData['user_id'] as String?;
    _pincode = snapshotData['pincode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('address');

  static Stream<AddressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddressRecord.fromSnapshot(s));

  static Future<AddressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AddressRecord.fromSnapshot(s));

  static AddressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddressRecordData({
  String? address,
  String? addressType,
  int? phoneNumber,
  DocumentReference? buyerRef,
  String? userId,
  String? pincode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'address_type': addressType,
      'phone_number': phoneNumber,
      'buyerRef': buyerRef,
      'user_id': userId,
      'pincode': pincode,
    }.withoutNulls,
  );

  return firestoreData;
}

class AddressRecordDocumentEquality implements Equality<AddressRecord> {
  const AddressRecordDocumentEquality();

  @override
  bool equals(AddressRecord? e1, AddressRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.addressType == e2?.addressType &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.buyerRef == e2?.buyerRef &&
        e1?.userId == e2?.userId &&
        e1?.pincode == e2?.pincode;
  }

  @override
  int hash(AddressRecord? e) => const ListEquality().hash([
        e?.address,
        e?.addressType,
        e?.phoneNumber,
        e?.buyerRef,
        e?.userId,
        e?.pincode
      ]);

  @override
  bool isValidKey(Object? o) => o is AddressRecord;
}
