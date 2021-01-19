import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/src/ui/screens/home_screen/home_screen.dart';
import 'package:music_app/src/ui/screens/library_screen/library_screen.dart';
import 'package:music_app/src/ui/screens/profile_screen/profile_screen.dart';
import 'package:music_app/src/ui/screens/search_screen/search_screen.dart';
import 'package:music_app/src/ui/widgets/custom_card.dart';
import 'package:music_app/src/ui/widgets/playlist_item.dart';

final bottomAppBarOptions = <Widget>[
  HomeScreen(),
  SearchScreen(),
  LibraryScreen(),
  ProfileScreen()
];

final gridBoxGeneres = <Map<String, dynamic>>[
  {'genere': 'Rock', 'color': Colors.red},
  {'genere': 'Pop', 'color': Colors.lightGreen},
  {'genere': 'Indie', 'color': Colors.purple},
  {'genere': 'Hip Hop', 'color': Colors.lime},
  {'genere': 'Latin', 'color': Colors.orange},
  {'genere': 'Flamenco', 'color': Colors.cyan},
  {'genere': 'Dance/\nElectronic', 'color': Colors.blue},
  {'genere': 'RnB', 'color': Colors.pink},
  {'genere': 'Folk &\nAcoustic', 'color': Colors.lightGreen},
  {'genere': 'rock', 'color': Colors.red},
  {'genere': 'Flamenco', 'color': Colors.cyan},
  {'genere': 'Dance/\nElectronic', 'color': Colors.blue},
  {'genere': 'RnB', 'color': Colors.pink},
  {'genere': 'Folk &\nAcoustic', 'color': Colors.lightGreen},
  {'genere': 'rock', 'color': Colors.red}
];

final gridBoxLibrary = <Map<String, dynamic>>[
  {'title': 'Songs', 'icon': FontAwesomeIcons.music},
  {'title': 'Albums', 'icon': FontAwesomeIcons.recordVinyl},
  {'title': 'Playlist', 'icon': FontAwesomeIcons.list},
  {'title': 'Liked', 'icon': FontAwesomeIcons.heart},
];

final playlistItems = <PlaylistItem>[
  PlaylistItem(imageUrl: 'assets/immunity.jpg', songName: 'Sofia', artistName: 'Clairo'),
  PlaylistItem(imageUrl: 'assets/immunity.jpg', songName: 'Bags', artistName: 'Clairo'),
  PlaylistItem(imageUrl: 'assets/immunity.jpg', songName: 'Alecwife', artistName: 'Clairo'),
  PlaylistItem(imageUrl: 'assets/immunity.jpg', songName: 'North', artistName: 'Clairo'),
];

final newReleasesList = <CustomCard>[
  CustomCard('assets/billie.jpg', 'Billie Eilish', 'Therefore I am'),
  CustomCard('assets/billie.jpg', 'Billie Eilish', 'Therefore I am'),
  CustomCard('assets/billie.jpg', 'Billie Eilish', 'Therefore I am'),
  CustomCard('assets/billie.jpg', 'Billie Eilish', 'Therefore I am')
];

final profileDescription =
    'Rock, indie and other alternative stuff. Please check my playlist to be up to date of new releases';

final profileSocialData = <Map<String, String>>[
  {'number': '20', 'title': 'Playlist'},
  {
    'number': '14',
    'title': 'Followers',
  },
  {'number': '7', 'title': 'Following'}
];

final recentlyPlayedArtist = <Map<String, dynamic>>[
  {'photo': 'assets/clairo.jpg', 'name': 'Clairo', 'followers': '1.876.271'},
  {
    'photo': 'assets/james_blake.jpg',
    'name': 'James Blake',
    'followers': '1.101.747'
  },
  {
    'photo': 'assets/frank_ocean.jpg',
    'name': 'Frank Ocean',
    'followers': '1.713.340'
  },
  {'photo': 'assets/clairo.jpg', 'name': 'Clairo', 'followers': '1.876.271'},
];

final yourRecentPlaylist = <Map<String, dynamic>>[
  {
    'photo': 'assets/playlist_image.jpg',
    'name': 'Nueva normalidad',
    'followers': '23'
  },
  {
    'photo': 'assets/playlist_image.jpg',
    'name': 'Indie rock',
    'followers': '13'
  },
  {'photo': 'assets/playlist_image.jpg', 'name': 'Classics', 'followers': '10'},
  {
    'photo': 'assets/playlist_image.jpg',
    'name': 'Bubblegum pop',
    'followers': '30'
  },
  {'photo': 'assets/playlist_image.jpg', 'name': 'To dance', 'followers': '35'},
];

final myPlaylist = <Map<String, dynamic>>[
  {
    'photo': 'assets/playlist_image.jpg',
    'name': 'Nueva normalidad',
    'by': 'Gabriel Albertuz'
  },
  {
    'photo': 'assets/playlist_image.jpg',
    'name': 'Indie rock',
    'by': 'Josean Albertuz'
  },
  {
    'photo': 'assets/playlist_image.jpg',
    'name': 'Classics',
    'by': 'Maria De Lao'
  },
  {
    'photo': 'assets/playlist_image.jpg',
    'name': 'Bubblegum pop',
    'by': 'Fran Lena'
  },
  {
    'photo': 'assets/playlist_image.jpg',
    'name': 'To dance',
    'by': 'Paco Merte'
  },
  {'photo': 'assets/playlist_image.jpg', 'name': 'Hits', 'by': 'Ana Pérez'},
  {'photo': 'assets/playlist_image.jpg', 'name': 'Hits', 'by': 'Ana Pérez'},
  {'photo': 'assets/playlist_image.jpg', 'name': 'Hits', 'by': 'Ana Pérez'},
  {'photo': 'assets/playlist_image.jpg', 'name': 'Hits', 'by': 'Ana Pérez'},
];

final myArtist = <Map<String, dynamic>>[
  {'photo': 'assets/clairo.jpg', 'name': 'Clairo', 'songs': '18'},
  {'photo': 'assets/james_blake.jpg', 'name': 'James Blake', 'songs': '11'},
  {'photo': 'assets/frank_ocean.jpg', 'name': 'Frank Ocean', 'songs': '13'},
  {'photo': 'assets/clairo.jpg', 'name': 'Clairo', 'songs': '13'},
  {'photo': 'assets/clairo.jpg', 'name': 'Clairo', 'songs': '13'},
  {'photo': 'assets/james_blake.jpg', 'name': 'James Blake', 'songs': '13'},
  {'photo': 'assets/frank_ocean.jpg', 'name': 'Frank Ocean', 'songs': '13'},
  {'photo': 'assets/clairo.jpg', 'name': 'Clairo', 'songs': '13'},
];

final myAlbums = <Map<String, String>>[
  {
    'photo': 'assets/and_justice_for_all.jpg',
    'title': '...And Justice For All',
    'artist': 'Metallica'
  },
  {'photo': 'assets/balanceo.jpg', 'title': 'Balanceo', 'artist': 'Cala Vento'},
  {
    'photo': 'assets/channel_orange.jpg',
    'title': 'Channel Orange',
    'artist': 'Frank Ocean'
  },
  {
    'photo': 'assets/currents.jpg',
    'title': 'Currents',
    'artist': 'Tame Impala'
  },
  {
    'photo': 'assets/favorite_worst_nightmare.jpg',
    'title': 'Favorite Worst Nightmare',
    'artist': 'Arctic Monkeys'
  },
  {
    'photo': 'assets/hatful_hollow.jpg',
    'title': 'Hatful Of Hollow',
    'artist': 'The Smiths'
  },
  {
    'photo': 'assets/iv.jpg',
    'title': 'Led Zeppelin IV',
    'artist': 'Led Zeppelin'
  },
  {'photo': 'assets/kid_a.jpg', 'title': 'Kid A', 'artist': 'Radiohead'},
  {
    'photo': 'assets/ratm.jpg',
    'title': 'Rage Against The Machine',
    'artist': 'Rage Against The Machine'
  },
  {
    'photo': 'assets/to_pimp_a_butterfly.jpg',
    'title': 'To Pimp a Butterfly',
    'artist': 'Kendrick Lamar'
  }
];

final immunity = <Map<String, String>>[
  {'title': 'Alecwife', 'artist': 'Clairo'},
  {'title': 'Impossible', 'artist': 'Clairo'},
  {'title': 'Closer To You', 'artist': 'Clairo'},
  {'title': 'North', 'artist': 'Clairo'},
  {'title': 'Bags', 'artist': 'Clairo'},
  {'title': 'Softly', 'artist': 'Clairo'},
  {'title': 'Sofia', 'artist': 'Clairo'},
  {'title': 'White Flag', 'artist': 'Clairo'},
  {'title': 'Feel Something', 'artist': 'Clairo'},
  {'title': 'Sinking', 'artist': 'Clairo'},
  {'title': 'I Wouldn\'t Ask You', 'artist': 'Clairo'}
];

final settingsOptions = <Map<String, String>>[
  {'title': 'Version', 'subtitle': '1.0 beta'},
  {'title': 'Third-party software', 'subtitle': 'Sweet software that help us'},
  {
    'title': 'Terms and Conditions',
    'subtitle': 'All the stuff you need to know'
  },
  {'title': 'Privacy Policy', 'subtitle': 'Important for both of us'},
  {'title': 'Support', 'subtitle': 'Get help from us and the community'},
  {'title': 'Log Out', 'subtitle': 'Exit from the app and back to log in'},
];