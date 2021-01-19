import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/src/ui/widgets/divider_with_text.dart';

class LoginSlide extends StatelessWidget {
  const LoginSlide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _LoginHeader(),
          _FacebookGoogleButtons(),
          DividerWithText(
              text: 'or', height: 10, thickness: 2, color: Colors.white),
          _TextFieldsAndLoginButton()
        ],
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.2,
      margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Let\'s',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 58)),
          Text('Rock',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 58)),
        ],
      ),
    );
  }
}

class _FacebookGoogleButtons extends StatelessWidget {
  const _FacebookGoogleButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: double.infinity,
      height: _screenSize.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: _screenSize.height * 0.07,
            child: TextButton(
                onPressed: () => Navigator.pushNamed(context, 'main'),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    backgroundColor: Color(0xFF3b5998)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.facebookSquare,
                      color: Colors.white,
                    ),
                    Text('Continue with Facebook',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))
                  ],
                )),
          ),
          SizedBox(
            height: _screenSize.height * 0.07,
            child: TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    backgroundColor: Colors.red),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    Text('Continue with Google',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class _TextFieldsAndLoginButton extends StatelessWidget {
  const _TextFieldsAndLoginButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: _screenSize.height * 0.35,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            TextField(
              obscureText: true,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Password',
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            TextButton(
                onPressed: null,
                child: Text('Have you forgotten your password?',
                    style: TextStyle(color: Colors.white, fontSize: 17))),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: _screenSize.height * 0.09,
              width: double.infinity,
              child: TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.green[500]),
                  child: Text('Log in',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
            )
          ],
        ));
  }
}
