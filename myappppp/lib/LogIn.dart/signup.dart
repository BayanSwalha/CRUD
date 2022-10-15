import 'package:flutter/material.dart';
import 'package:myappppp/LogIn.dart/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Sign Up"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
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
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
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
            child: Text('Sign up'),
            onPressed: () async {
              try {
                var authobject = FirebaseAuth.instance;

                UserCredential myUser =
                    await authobject.createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Email is added successfully")));
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Email is aleardy is signed up")));
              }
            },
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LogIn();
                    },
                  ));
                });
              },
              child: Text("Log In"))
        ],
      ),
    );
  }
}
