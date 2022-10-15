import 'package:flutter/material.dart';
import 'package:myappppp/model.dart';

class Additem1 extends StatefulWidget {
  Additem1();

  @override
  State<Additem1> createState() => _Additem1State();
}

class _Additem1State extends State<Additem1> {
  final TextEditingController item1 = TextEditingController();
  final TextEditingController value1 = TextEditingController();
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
              var response =
                  await Database.addItem(item: item1.text, value: value1.text);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("item created")));
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
