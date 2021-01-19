import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:music_app/src/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildListDelegate([_HeaderProfile()])),
        SliverStickyHeader(
          header: _NumberOfPlaylistFollowersFollowing(),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            _RecentlyPlayedArtist(),
            _RecentPlaylist(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.09)
          ])),
        ),
      ],
    ));
  }


}

class _NumberOfPlaylistFollowersFollowing extends StatelessWidget {
  const _NumberOfPlaylistFollowersFollowing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: profileSocialData
                .map((e) => Column(
                      children: [
                        Text(e['number'], style: TextStyle(fontSize: 16)),
                        SizedBox(height: 5),
                        Text(e['title'], style: TextStyle(fontSize: 16))
                      ],
                    ))
                .toList()));
  }
}

class _HeaderProfile extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
              radius: 60, backgroundImage: AssetImage('assets/me.jpg')),
          Text('josealbertuz',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                profileDescription,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              )),
          OutlinedButton(
              onPressed: () => null,
              child: Text('Edit profile', style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}

class _RecentlyPlayedArtist extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        width: double.infinity,
        child: Column(
          children: [
            Text('Recently played artist',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recentlyPlayedArtist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage(recentlyPlayedArtist[index]['photo']),
                    ),
                    title: Text(recentlyPlayedArtist[index]['name']),
                    subtitle: Text(recentlyPlayedArtist[index]['followers']),
                  );
                }),
          ],
        ));
  }
}

class _RecentPlaylist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        width: double.infinity,
        child: Column(
          children: [
            Text('Your recent playlist',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: yourRecentPlaylist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      margin: EdgeInsets.only(left: 15),
                      width: 50,
                      height: 50,
                      child: Image(image: AssetImage(yourRecentPlaylist[index]['photo']), fit: BoxFit.cover,),
                    ),
                    title: Text(yourRecentPlaylist[index]['name']),
                    subtitle: Text(yourRecentPlaylist[index]['followers']),
                  );
                }),
          ],
        ));
  }
}