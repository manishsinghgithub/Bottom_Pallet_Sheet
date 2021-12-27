import 'package:button_pallet/widget/bottomSheet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> Question = [
    "How are you feelig now?",
    "Where Do you live?",
    "What's you mood now",
    "Who is your best singer."
  ];

  int indexNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
            child: MaterialButton(
          onPressed: () {
            setState(() {
              indexNum = 0;
            });
          },
          child: Text(
            "Open Sheet",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          height: 50,
          minWidth: 200,
        )),
      ),
      bottomSheet: indexNum != -1
          ? BottomSheetWidget(
              title: Question[indexNum],
              onClickConferm: () {
                setState(() {
                  indexNum = indexNum + 1;
                  if (indexNum > 3) {
                    indexNum = -1;
                  }
                  print(indexNum);
                });
              },
              onClickClose: () {
                setState(() {
                  indexNum = -1;
                });
              },
            )
          : null,
    );
  }
}
