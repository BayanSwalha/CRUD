import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myappppp/model.dart';

class update extends StatefulWidget {
  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  final TextEditingController item1 = TextEditingController();
  final TextEditingController value1 = TextEditingController();
  CollectionReference items = FirebaseFirestore.instance.collection('items');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: item1,
          ),
          TextField(
            controller: value1,
          ),
          TextButton(
            onPressed: () async {
              var response = await Database.updateItem(
                  item: item1.text, value: value1.text);
            },
            child: Text(
              "Add item",
            ),
          )
        ],
      ),
    );
  }
}
