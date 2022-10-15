import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myappppp/LogIn.dart/signup.dart';

import '../CURD/create.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("LogIn"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent)),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                ),
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent)),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                ),
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 60),
                  backgroundColor: Colors.deepOrangeAccent,
                  shadowColor: Colors.black,
                  elevation: 30,
                  textStyle: TextStyle(fontSize: 25)),
              child: Text('Login'),
              onPressed: () async {
                try {
                  var authobject = FirebaseAuth.instance;

                  UserCredential myUser =
                      await authobject.signInWithEmailAndPassword(
                          email: email.text, password: password.text);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Additem1();
                    },
                  ));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("$e")));
                }
              }),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SignUp();
                  },
                ));
              },
              child: Text("Sign up"))
        ],
      ),
    );
  }
}
