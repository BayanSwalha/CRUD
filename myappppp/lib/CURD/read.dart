import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myappppp/model.dart';

import '../CURD/create.dart';
import '../CURD/update.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Additem1();
            },
          ));
        },
      ),
      appBar: AppBar(),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: snapshot.data!.docs.map((e) {
                  return Column(children: [
                    ListTile(
                      title: Text(e['title']),
                      subtitle: Text(
                        e['value'],
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return update1();
                                },
                              ));
                            },
                            child: Text("Edit")),
                        TextButton(
                            onPressed: () async {
                              var response = FirebaseFirestore.instance
                                  .collection('item1')
                                  .doc(e.id);
                              response.delete();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Deleted")));
                            },
                            child: Text("Delete")),
                      ],
                    ),
                    Divider(
                      thickness: 5,
                    )
                  ]);
                }).toList(),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
