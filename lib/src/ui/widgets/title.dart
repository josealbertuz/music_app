import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  final String title;

  Title({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    );
  }
}
