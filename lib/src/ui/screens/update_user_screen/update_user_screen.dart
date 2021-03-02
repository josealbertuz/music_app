import 'package:flutter/material.dart';
import 'package:music_app/src/bloc/main_bloc.dart';
import 'package:music_app/src/bloc/update_profile_bloc.dart';
import 'package:music_app/src/models/user_model.dart';
import 'package:music_app/src/ui/widgets/loading_dialog.dart';

class UpdateUserSreen extends StatelessWidget {
  final updateBloc = UpdateProfileBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: updateAppbar(context),
      body: StreamBuilder<User>(
          stream: MainBloc().userStream,
          builder: (BuildContext context, AsyncSnapshot<User> user) {
            return user.hasData
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Avatar(),
                        StreamBuilder<String>(
                            stream: updateBloc.usernameStream,
                            builder: (context, snapshot) {
                              return UpdateFormField(
                                errorText: snapshot.error,
                                helperText: 'Username',
                                initialValue: user.data.username,
                                onChange: (value) {
                                  updateBloc.changeUsername(value);
                                },
                              );
                            }),
                        StreamBuilder<String>(
                            stream: updateBloc.passwordStream,
                            builder: (context, snapshot) {
                              return UpdateFormField(
                                errorText: snapshot.error,
                                obscureText: true,
                                helperText: 'Password',
                                initialValue: user.data.password,
                                onChange: (value) {
                                  updateBloc.changePassword(value);
                                },
                              );
                            }),
                        UpdateFormField(
                          helperText: 'Description',
                          initialValue: user.data.description == null
                              ? ''
                              : user.data.description,
                          onChange: (value) {
                            updateBloc.changeDescription(value);
                          },
                        ),
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          }),
    );
  }

  AppBar updateAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.black, size: 40),
          onPressed: () => Navigator.pop(context)),
      title: Text('Edit profile', style: TextStyle(color: Colors.black)),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 5),
            child: StreamBuilder<bool>(
                stream: updateBloc.validateForm,
                builder: (context, snapshot) {
                  return IconButton(
                      icon: Icon(Icons.done, size: 40, color: Colors.black),
                      onPressed:
                          snapshot.hasData ? () => updateUser(context) : null);
                }))
      ],
    );
  }

  void updateUser(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => LoadingDialog());

    updateBloc.updateUser().then((success) {
      Navigator.pop(context);

      if (success) {
        Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            content: Text('Usuario actualizado con éxito',
                style: TextStyle(color: Colors.white))));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black,
            behavior: SnackBarBehavior.floating,
            content: Text('Ha ocurrido un error al realizar la actualización',
                style: TextStyle(color: Colors.white))));
      }
    });
  }
}

class UpdateFormField extends StatelessWidget {
  final String initialValue;
  final String helperText;
  final Function(String) onChange;
  final bool obscureText;
  final String errorText;

  UpdateFormField(
      {@required this.initialValue,
      @required this.helperText,
      @required this.onChange,
      this.errorText,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: TextFormField(
        obscureText: obscureText,
        cursorColor: Colors.black,
        initialValue: initialValue,
        decoration: InputDecoration(
            filled: false,
            enabledBorder: UnderlineInputBorder(),
            helperText: helperText,
            errorText: errorText),
        onChanged: onChange,
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/me.jpg'),
          ),
          Text('Change photo', style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
