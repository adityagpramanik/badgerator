import 'package:badgerator/template.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Generate extends StatefulWidget {
  Generate({Key? key}) : super(key: key);

  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  var sharekey = TextEditingController();
  var fkey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: Column(
          children: [
            Column(
              children: [
                TextFormField(
                  controller: sharekey,
                  decoration: InputDecoration(
                    label: Text('Key'),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Can't be empty";
                    }
                    return "";
                  },
                ),
              ],
            ),
            TextButton(
                onPressed: () async {
                  var store = FirebaseFirestore.instance;
                  var sharekey;
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
