import 'package:flutter/material.dart';

class TitleWithIcon extends StatelessWidget {

  final String title;
  final IconData icon;
  final String route;

  TitleWithIcon({@required this.title, @required this.icon, @required this.route});

 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        IconButton(
            icon: Icon(icon, size: 38, color: Colors.black),
            onPressed: () =>
                Navigator.pushNamed(context, route))
      ],
    ));
  }
}
