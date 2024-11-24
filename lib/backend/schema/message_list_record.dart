import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageListRecord extends FirestoreRecord {
  MessageListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "receiver" field.
  String? _receiver;
  String get receiver => _receiver ?? '';
  bool hasReceiver() => _receiver != null;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  bool hasSender() => _sender != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _receiver = snapshotData['receiver'] as String?;
    _sender = snapshotData['sender'] as String?;
    _image = snapshotData['image'] as String?;
    _images = getDataList(snapshotData['images']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messageList')
          : FirebaseFirestore.instance.collectionGroup('messageList');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messageList').doc(id);

  static Stream<MessageListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageListRecord.fromSnapshot(s));

  static Future<MessageListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageListRecord.fromSnapshot(s));

  static MessageListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageListRecordData({
  DateTime? createdAt,
  String? message,
  String? receiver,
  String? sender,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'message': message,
      'receiver': receiver,
      'sender': sender,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageListRecordDocumentEquality implements Equality<MessageListRecord> {
  const MessageListRecordDocumentEquality();

  @override
  bool equals(MessageListRecord? e1, MessageListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.message == e2?.message &&
        e1?.receiver == e2?.receiver &&
        e1?.sender == e2?.sender &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.images, e2?.images);
  }

  @override
  int hash(MessageListRecord? e) => const ListEquality().hash(
      [e?.createdAt, e?.message, e?.receiver, e?.sender, e?.image, e?.images]);

  @override
  bool isValidKey(Object? o) => o is MessageListRecord;
}
