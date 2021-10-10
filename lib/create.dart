import 'package:badgerator/template.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var org = TextEditingController();
  var event = TextEditingController();
  var fkey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: org,
                    decoration: InputDecoration(
                      label: Text('Organisation'),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Can't be empty";
                      }
                      return "";
                    },
                  ),
                  TextFormField(
                    controller: event,
                    decoration: InputDecoration(
                      label: Text('Event'),
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
                    print(org.text);
                    print(event.text);

                    var store = FirebaseFirestore.instance;
                    var sharekey;

                    await store.collection('create').add({
                      'org': org.text,
                      'event': event.text,
                    }).then((value) async {
                      sharekey = await (value.id).toString();
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Template(
                                  org: org.text,
                                  event: event.text,
                                  shareKey: sharekey,
                                  check: true,
                                )));
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
