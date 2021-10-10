import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  String org, event, shareKey;
  bool check;
  var image;
  Template(
      {Key? key,
      required this.org,
      required this.event,
      required this.shareKey,
      required this.check,
      this.image,
      })
      : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Stack(
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
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 30,
                        width: double.infinity,
                        color: widget.check ? Colors.green : Colors.transparent,
                        child: widget.check
                            ? Container()
                            : Image(image: widget.image),
                      ),
                      Align(
                        alignment: Alignment(-1, 0.2),
                        child: Text(
                          widget.event,
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-1, 1),
                        child: Text(
                          widget.org,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
