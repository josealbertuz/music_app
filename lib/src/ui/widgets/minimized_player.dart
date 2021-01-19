import 'package:flutter/material.dart';

class MinimizedPlayer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('player'),
      child: Container(
          width: screenSize.width,
          height: screenSize.height * 0.09,
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black)),
              color: Colors.white),
          child: Row(
            children: [
              Image(image: AssetImage('assets/thereforeiam.png')),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Therefore I am',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Billie Eilish', style: TextStyle(fontSize: 14))
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                  icon: Icon(Icons.favorite_border, size: 30),
                  onPressed: () => null),
              SizedBox(width: 10),
              IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 35,
                  ),
                  onPressed: () => null),
              SizedBox(width: 10)
            ],
          )),
    );
  }
}
