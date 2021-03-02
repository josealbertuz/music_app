import 'package:flutter/material.dart';
import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/bloc/player_bloc.dart';
import 'package:music_app/src/models/song_model.dart';
import 'package:music_app/src/providers/song_provider.dart';

class SongSearch extends SearchDelegate {
  final SongProvider _songProvider = SongProvider(MainBloc().user.apiKey);

  @override
  String get searchFieldLabel => 'Introduzca el título de una canción';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
            future: _songProvider.searchSongByName(query),
            builder:
                (BuildContext context, AsyncSnapshot<List<Song>> snapshot) {
              return snapshot.hasData
                  ? snapshot.data.isEmpty
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                              'No hay resultados para la canción $query',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)))
                      : ListView.builder(
                          itemExtent: 100.0,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                PlayerBloc().addSong(snapshot.data[index]);
                                Navigator.pushReplacementNamed(
                                    context, 'player');
                              },
                              child: ListTile(
                                leading:
                                    Image.network(snapshot.data[index].cover),
                                title: Text(snapshot.data[index].name),
                                subtitle:
                                    Text('${snapshot.data[index].artist}'),
                              ),
                            );
                          })
                  : Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
                      child: CircularProgressIndicator());
            });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}
