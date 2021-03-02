import 'package:flutter/material.dart';
import 'package:music_app/src/bloc/settings_bloc.dart';
import 'package:music_app/src/ui/widgets/delete_account_dialog.dart';
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
              _settingsList(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsList(BuildContext context) {
    return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          ...List.generate(
              settingsOptions.length,
              (index) => ListTile(
                    title: Text(settingsOptions[index]['title']),
                    subtitle: Text(settingsOptions[index]['subtitle']),
                    onTap: () => null,
                  )),
          ListTile(
            title: Text('Log out'),
            subtitle: Text('Exit from the app and back to log in'),
            onTap: () => SettingsBloc().closeSession().then((value) {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false);
            }),
          ),
          _DeleteAccount()
        ]);
  }
}

class _DeleteAccount extends StatelessWidget {
  const _DeleteAccount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Desactivate account',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
      subtitle: Text('Allow desactivate your account',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
      trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 40),
            primary: Colors.red,
            elevation: 2.0,
          ),
          onPressed: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => DeleteAccountDialog(),
              ).then((value) {
                if (value) {
                  SettingsBloc().deleteUser().then((success) {
                    if (success) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'login', (route) => false);
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          behavior: SnackBarBehavior.floating,
                          content: Text('Ocurrió un error, intentelo más tarde',
                              style: TextStyle(color: Colors.black))));
                    }
                  });
                }
              }),
          child: Text('Desactivate',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
    );
  }
}
