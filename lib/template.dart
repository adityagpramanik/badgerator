import 'dart:html';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Template extends StatefulWidget {
  String org, event, shareKey;
  bool check;
  var image;
  Template({
    Key? key,
    required this.org,
    required this.event,
    required this.shareKey,
    required this.check,
    this.image,
  }) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  var field = TextEditingController();
  var fkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height / 2,
                  width: size.height / 2,
                  decoration: BoxDecoration(color: Colors.blueAccent[200]),
                ),
                Container(
                  height: (size.height / 2) - 50,
                  width: (size.height / 2) - 50,
                  decoration: BoxDecoration(color: Colors.red[300]),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          height: (size.height / 2) - 180,
                          width: (size.height / 2) - 50,
                          color:
                              widget.check ? Colors.white : Colors.transparent,
                          child: widget.check ? Container() : widget.image,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Align(
                                alignment: Alignment(-1, 0.2),
                                child: Text(
                                  widget.event,
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              child: Align(
                                alignment: Alignment(-1, 1),
                                child: Text(
                                  widget.org,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            widget.check
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                        height: 60,
                        width: 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text(widget.shareKey))))
                : Container(),
            widget.check
                ? InkWell(
                    onTap: () {
                      if (field.text.trim() == "") {
                        print(widget.shareKey);
                      } else {
                        print(widget.shareKey);
                        FlutterClipboard.copy(widget.shareKey)
                            .then((value) => print('copied'));
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(child: Text('COPY')),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
