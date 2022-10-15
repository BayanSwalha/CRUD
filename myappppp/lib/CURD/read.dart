import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:myappppp/CURD/create.dart';
import 'package:myappppp/CURD/update.dart';

import '../model.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {
  final Stream<QuerySnapshot> collectionReference = Database.readItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: snapshot.data!.docs.map((e) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(e['item']),
                          subtitle: Text(e["value"]),
                        ),
                        Row(
                          children: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return update();
                                    },
                                  ));
                                },
                                child: Text("Edit")),
                            TextButton(
                                onPressed: () async {
                                  var response =
                                      Database.deleteItem(docId: e.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Deleted")));
                                },
                                child: Text("Delete")),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Additem1();
            },
          ));
        },
      ),
    );
  }
}
