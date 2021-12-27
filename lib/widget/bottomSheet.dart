import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  final String title;
  final VoidCallback onClickClose, onClickConferm;
  Color color1 = Colors.white, color2 = Colors.white, color3 = Colors.white;
  String ans = "";
  BottomSheetWidget(
      {required this.title,
      required this.onClickConferm,
      required this.onClickClose});

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildOption(
                  answer: 'answer1',
                  onchoose: () {
                    setState(() {
                      widget.color1 = Colors.red;
                      widget.color2 = Colors.white;
                      widget.color3 = Colors.white;
                      widget.ans = "answer1";
                    });
                  },
                  color: widget.color1,
                ),
                buildOption(
                  answer: 'answer2',
                  onchoose: () {
                    setState(() {
                      widget.color1 = Colors.white;
                      widget.color2 = Colors.red;
                      widget.color3 = Colors.white;
                      widget.ans = "ans2";
                    });
                  },
                  color: widget.color2,
                ),
                buildOption(
                  answer: 'answer3',
                  onchoose: () {
                    setState(() {
                      widget.color1 = Colors.white;
                      widget.color2 = Colors.white;
                      widget.color3 = Colors.red;
                      widget.ans = "ans3";
                    });
                  },
                  color: widget.color3,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: widget.onClickClose,
                  child: Text(
                    'Close',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  color: Colors.white,
                  height: 45,
                ),
                MaterialButton(
                  onPressed: widget.onClickConferm,
                  child: Text(
                    'Conferm',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  color: Colors.red,
                  height: 45,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildOption(
        {required String answer,
        required VoidCallback onchoose,
        required Color color}) =>
    MaterialButton(
      onPressed: onchoose,
      color: color,
      splashColor: Colors.red,
      focusColor: Colors.red,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
              width: 2.0, color: Colors.red, style: BorderStyle.solid)),
      child: Text(
        answer,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
