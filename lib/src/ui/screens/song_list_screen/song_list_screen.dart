import 'package:flutter/material.dart';
import 'package:music_app/src/ui/widgets/minimized_player.dart';
import 'package:music_app/src/utils/constants.dart';

class SongListPage extends StatelessWidget {
  const SongListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _SongListHeader(),
                  _SongListBody(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09)
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: MinimizedPlayer())
          ],
        ),
      ),
    );
  }
}

class _SongListBody extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: immunity.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(immunity[index]['title']),
          subtitle: Text(immunity[index]['artist']),
        );
      },
    );
  }
}

class _SongListHeader extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    
    return Container(
      height: screenSize.height * 0.52,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Image(
                width: 170,
                height: 170,
                image: AssetImage('assets/immunity.jpg')),
          ),
          Text('Immunity',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: null,
              child: Text('Save', style: TextStyle(fontSize: 16))),
          Text('Album by Clairo . 2019'),
          SizedBox(height: 10),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.fromLTRB(65, 15, 65, 15),
              ),
              onPressed: null,
              child: Text('Shuffle play',
                  style: TextStyle(fontSize: 16, color: Colors.white)))
        ],
      ),
    );
  }
}