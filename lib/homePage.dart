import 'package:badgerator/create.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Badgerator',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 240,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Create()));
                          },
                          child: Text(
                            "Create Badge",
                            style: TextStyle(color: Colors.black),
                          ))),
                ),
                Container(
                  height: 60,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Create()));
                          },
                          child: Text(
                            "Generate Badge",
                            style: TextStyle(color: Colors.black),
                          )),
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
