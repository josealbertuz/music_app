import 'package:flutter/material.dart';

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

    return Container(
        width: double.infinity,
        height: screenSize.height * 0.45,
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
            TextField(
              obscureText: true,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Repeat password',
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: screenSize.height * 0.09,
              width: double.infinity,
              child: TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.green[500]),
                  child: Text('Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
            )
          ],
        ));
  }
}
