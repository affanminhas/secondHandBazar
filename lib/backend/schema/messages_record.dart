import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "admin" field.
  String? _admin;
  String get admin => _admin ?? '';
  bool hasAdmin() => _admin != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  bool hasAvatar() => _avatar != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "message" field.
  MessagesStruct? _message;
  MessagesStruct get message => _message ?? MessagesStruct();
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _admin = snapshotData['admin'] as String?;
    _avatar = snapshotData['avatar'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _productId = snapshotData['productId'] as String?;
    _user = snapshotData['user'] as String?;
    _username = snapshotData['username'] as String?;
    _message = MessagesStruct.maybeFromMap(snapshotData['message']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? admin,
  String? avatar,
  DateTime? createdAt,
  String? productId,
  String? user,
  String? username,
  MessagesStruct? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin': admin,
      'avatar': avatar,
      'createdAt': createdAt,
      'productId': productId,
      'user': user,
      'username': username,
      'message': MessagesStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "message" field.
  addMessagesStructData(firestoreData, message, 'message');

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.admin == e2?.admin &&
        e1?.avatar == e2?.avatar &&
        e1?.createdAt == e2?.createdAt &&
        e1?.productId == e2?.productId &&
        e1?.user == e2?.user &&
        e1?.username == e2?.username &&
        e1?.message == e2?.message;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.admin,
        e?.avatar,
        e?.createdAt,
        e?.productId,
        e?.user,
        e?.username,
        e?.message
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
