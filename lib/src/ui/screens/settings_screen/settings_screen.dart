import 'package:flutter/material.dart';
import 'package:music_app/src/ui/widgets/title.dart' as title;
import 'package:music_app/src/utils/constants.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: title.Title(title: 'Settings')),
              _settingsList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsList() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: settingsOptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(settingsOptions[index]['title']),
            subtitle: Text(settingsOptions[index]['subtitle']),
            onTap: () => null,
          );
        });
  }
}