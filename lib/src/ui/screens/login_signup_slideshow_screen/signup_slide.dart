import 'package:flutter/material.dart';
import 'package:music_app/src/bloc/signup_bloc.dart';
import 'package:music_app/src/ui/themes/app_theme.dart';
import 'package:music_app/src/ui/widgets/loading_dialog.dart';

class SignupSlide extends StatelessWidget {
  const SignupSlide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [_SignupHeader(), _TextfieldsAndSignupButton()],
      ),
    );
  }
}

class _SignupHeader extends StatelessWidget {
  const _SignupHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.2,
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Let\'s rock',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 58)),
          Text('Together',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 58)),
        ],
      ),
    );
  }
}

class _TextfieldsAndSignupButton extends StatelessWidget {
  const _TextfieldsAndSignupButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final signupBloc = SignupBloc();

    return Container(
        width: double.infinity,
        height: screenSize.height * 0.55,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StreamBuilder(
                stream: signupBloc.emailStream,
                builder: (context, snapshot) {
                  return TextField(
                      onChanged: (value) => signupBloc.changeEmail(value),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputDecorationThemeLogin.copyWith(
                          labelText: 'Email', errorText: snapshot.error));
                }),
            StreamBuilder(
              stream: signupBloc.usernameStream,
              builder: (context, snapshot) {
                return TextField(
                    onChanged: (value) => signupBloc.changeUsername(value),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: inputDecorationThemeLogin.copyWith(
                        errorText: snapshot.error, labelText: 'Username'));
              },
            ),
            StreamBuilder(
              stream: signupBloc.passwordStream,
              builder: (context, snapshot) {
                return TextField(
                    onChanged: (value) => signupBloc.changePassword(value),
                    obscureText: true,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: inputDecorationThemeLogin.copyWith(
                        errorText: snapshot.error, labelText: 'Password'));
              },
            ),
            StreamBuilder(
              stream: signupBloc.repeatedPasswordStream,
              builder: (context, snapshot) {
                print(snapshot.data);
                return TextField(
                    onChanged: (value) =>
                        signupBloc.changeRepeatedPassword(value),
                    obscureText: true,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    decoration: inputDecorationThemeLogin.copyWith(
                        errorText: snapshot.error,
                        labelText: 'Repeat password'));
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: screenSize.height * 0.09,
              width: double.infinity,
              child: StreamBuilder(
                stream: signupBloc.formValidation,
                builder: (context, snapshot) {
                  return TextButton(
                      onPressed:
                          snapshot.hasData ? () => insertUser(context) : null,
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: snapshot.hasData
                              ? Colors.green[500]
                              : Colors.grey),
                      child: Text('Sign up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)));
                },
              ),
            )
          ],
        ));
  }

  void insertUser(BuildContext context) async {
    SignupBloc signupBloc = SignupBloc();

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => LoadingDialog());

    bool failed = await signupBloc.insertUser();

    Navigator.pop(context);

    if (failed) {
      Scaffold.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          content: Text('Este usuario ya existe',
              style: TextStyle(color: Colors.black))));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          content: Text('Usuario registrado con éxito',
              style: TextStyle(color: Colors.black))));
    }
  }
}
