import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
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
  late DropzoneViewController controller2;

  Image? _image = null;

  @override
  Widget build(BuildContext context) {
    Future seelctFile() async {
      var result = await FilePicker.platform.pickFiles(allowMultiple: false);
      if (result == null)
        return;
      else {
        final bytes = result.files.single.bytes;
        setState(() {
          _image = Image.memory(
            bytes!,
            height: double.infinity,
          );
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Choose image to generate badge")),
      ),
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
                TextButton(
                    onPressed: () => seelctFile(), child: Text('Choose image')),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () async {
                  String org = '', event = '';
                  var store = FirebaseFirestore.instance;

                  await store
                      .collection('create')
                      .doc(sharekey.text)
                      .get()
                      .then((value) {
                    org = value.get('org');
                    event = value.get('event');
                  });

                  print(org);
                  print(sharekey);
                  print(event);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Template(
                              image: _image,
                              org: org,
                              event: event,
                              shareKey: sharekey.text,
                              check: false)));
                },
                child: Text("Generate"))
          ],
        ),
      ),
    );
  }
}
