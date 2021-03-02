import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:music_app/src/search/song_search.dart';
import 'package:music_app/src/ui/widgets/custom_sliver_header.dart';
import 'package:music_app/src/ui/widgets/title.dart' as title;
import 'package:music_app/src/utils/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              title.Title(title: 'Search'),
            ]),
          ),
          SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: CustomSliverHeader(
                  maxExtent: 70,
                  minExtent: 70,
                  widget: Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        onTap: () => showSearch(context: context, delegate: SongSearch()),
                        child: Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey, width: 3.0)),
                            width: double.infinity,
                            child: Icon(Icons.search)),
                      )))),
          SliverList(
            delegate: SliverChildListDelegate([title.Title(title: 'Generes')]),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: gridBoxGeneres
                .map((e) => _gridBox(e['genere'], e['color']))
                .toList(),
          ),
          //Este sizedbox actúa como relleno para que el reproductor no tape el resto de la lista
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: MediaQuery.of(context).size.height * 0.09)
          ]))
        ],
      ),
    );
  }

  Widget _gridBox(String genere, Color color) {
    return Container(
        width: 100,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Stack(
          children: [
            Positioned(
                top: 15,
                right: -5,
                child: Transform.rotate(
                  angle: 15.0,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Image(
                      image: AssetImage('assets/immunity.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Positioned(
              top: 10,
              left: 10,
              child: Text(genere,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        ));
  }
}
