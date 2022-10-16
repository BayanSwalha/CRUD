import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myappppp/CURD/read.dart';

class update1 extends StatefulWidget {
  @override
  State<update1> createState() => _update1State();
}

class _update1State extends State<update1> {
  final TextEditingController item1 = TextEditingController();
  final TextEditingController value1 = TextEditingController();

  DocumentReference items =
      FirebaseFirestore.instance.collection('items').doc();
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
              final docc = FirebaseFirestore.instance.collection('item1').doc();
              docc.update({'title': item1, 'value': value1});
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ListPage();
                },
              ));
            },
            child: Text(
              "Update Item",
            ),
          )
        ],
      ),
    );
  }
}

class edit {}
