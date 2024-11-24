import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SellerRecord extends FirestoreRecord {
  SellerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "location_state_" field.
  String? _locationState;
  String get locationState => _locationState ?? '';
  bool hasLocationState() => _locationState != null;

  // "selling_points" field.
  List<String>? _sellingPoints;
  List<String> get sellingPoints => _sellingPoints ?? const [];
  bool hasSellingPoints() => _sellingPoints != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phonenumber" field.
  int? _phonenumber;
  int get phonenumber => _phonenumber ?? 0;
  bool hasPhonenumber() => _phonenumber != null;

  // "isBuyer" field.
  bool? _isBuyer;
  bool get isBuyer => _isBuyer ?? false;
  bool hasIsBuyer() => _isBuyer != null;

  // "categoryRef" field.
  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  bool hasCategoryRef() => _categoryRef != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  void _initializeFields() {
    _businessName = snapshotData['business_name'] as String?;
    _locationState = snapshotData['location_state_'] as String?;
    _sellingPoints = getDataList(snapshotData['selling_points']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _email = snapshotData['email'] as String?;
    _phonenumber = castToType<int>(snapshotData['phonenumber']);
    _isBuyer = snapshotData['isBuyer'] as bool?;
    _categoryRef = snapshotData['categoryRef'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _id = snapshotData['id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('seller');

  static Stream<SellerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SellerRecord.fromSnapshot(s));

  static Future<SellerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SellerRecord.fromSnapshot(s));

  static SellerRecord fromSnapshot(DocumentSnapshot snapshot) => SellerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SellerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SellerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SellerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SellerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSellerRecordData({
  String? businessName,
  String? locationState,
  DocumentReference? userRef,
  String? name,
  int? age,
  String? email,
  int? phonenumber,
  bool? isBuyer,
  DocumentReference? categoryRef,
  String? image,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'business_name': businessName,
      'location_state_': locationState,
      'user_ref': userRef,
      'name': name,
      'age': age,
      'email': email,
      'phonenumber': phonenumber,
      'isBuyer': isBuyer,
      'categoryRef': categoryRef,
      'image': image,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class SellerRecordDocumentEquality implements Equality<SellerRecord> {
  const SellerRecordDocumentEquality();

  @override
  bool equals(SellerRecord? e1, SellerRecord? e2) {
    const listEquality = ListEquality();
    return e1?.businessName == e2?.businessName &&
        e1?.locationState == e2?.locationState &&
        listEquality.equals(e1?.sellingPoints, e2?.sellingPoints) &&
        e1?.userRef == e2?.userRef &&
        e1?.name == e2?.name &&
        e1?.age == e2?.age &&
        e1?.email == e2?.email &&
        e1?.phonenumber == e2?.phonenumber &&
        e1?.isBuyer == e2?.isBuyer &&
        e1?.categoryRef == e2?.categoryRef &&
        e1?.image == e2?.image &&
        e1?.id == e2?.id;
  }

  @override
  int hash(SellerRecord? e) => const ListEquality().hash([
        e?.businessName,
        e?.locationState,
        e?.sellingPoints,
        e?.userRef,
        e?.name,
        e?.age,
        e?.email,
        e?.phonenumber,
        e?.isBuyer,
        e?.categoryRef,
        e?.image,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is SellerRecord;
}
