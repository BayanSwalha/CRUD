import 'package:cloud_firestore/cloud_firestore.dart';

final docItemm = FirebaseFirestore.instance;
CollectionReference itemsAndValue = docItemm.collection('items');

class ListOfItems {
  String? item;
  String? value;

  ListOfItems({required this.item, required this.value});
}

class Database {
  static String? itemUid;

  static Future<void> addItem({
    required String item,
    required String value,
  }) async {
    DocumentReference documentReferencer = itemsAndValue.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": item,
      "value": value,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String item,
    required String value,
  }) async {
    DocumentReference documentReferencer = itemsAndValue.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "item": item,
      "value": value,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection = itemsAndValue;

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer = itemsAndValue.doc();

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
