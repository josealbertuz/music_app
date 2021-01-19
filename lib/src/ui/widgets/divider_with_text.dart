import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  final double height;
  final double thickness;
  final Color color;

  DividerWithText({@required this.text, @required this.height, @required this.thickness, @required this.color});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: screenSize.height * 0.08,
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Row(
          children: [
            Expanded(
                child: Divider(
              height: height,
              color: color,
              thickness: thickness,
            )),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(text,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Expanded(
                child: Divider(
              height: height,
              color: color,
              thickness: thickness,
            ))
          ],
        ));
  }
}