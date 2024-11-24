import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannersRecord extends FirestoreRecord {
  BannersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "banner_id" field.
  String? _bannerId;
  String get bannerId => _bannerId ?? '';
  bool hasBannerId() => _bannerId != null;

  void _initializeFields() {
    _banner = snapshotData['banner'] as String?;
    _images = getDataList(snapshotData['images']);
    _bannerId = snapshotData['banner_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banners');

  static Stream<BannersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannersRecord.fromSnapshot(s));

  static Future<BannersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannersRecord.fromSnapshot(s));

  static BannersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BannersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannersRecordData({
  String? banner,
  String? bannerId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'banner': banner,
      'banner_id': bannerId,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannersRecordDocumentEquality implements Equality<BannersRecord> {
  const BannersRecordDocumentEquality();

  @override
  bool equals(BannersRecord? e1, BannersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.banner == e2?.banner &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.bannerId == e2?.bannerId;
  }

  @override
  int hash(BannersRecord? e) =>
      const ListEquality().hash([e?.banner, e?.images, e?.bannerId]);

  @override
  bool isValidKey(Object? o) => o is BannersRecord;
}
