import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  final IconData _icon = FontAwesomeIcons.heart;
  final String _urlImage;
  final String _songName;
  final String _artistName;

  CustomCard(this._urlImage, this._artistName, this._songName);

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.48,
      padding: EdgeInsets.only(right: 10),
      child: Card(
        elevation: 0.5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image(
                  image: AssetImage(_urlImage),
                  fit: BoxFit.cover,
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        _icon,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_songName,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(_artistName,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white))
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}