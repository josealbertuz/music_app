import 'package:flutter/material.dart';
import 'package:music_app/src/ui/screens/login_signup_slideshow_screen/login_slide.dart';
import 'package:music_app/src/ui/screens/login_signup_slideshow_screen/signup_slide.dart';
import 'package:music_app/src/ui/widgets/slideshow.dart';

class LoginSignupSlideshowScreen extends StatelessWidget {
  const LoginSignupSlideshowScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
    children: [
      _Background(),
      Slideshow(
          bulletColor: Colors.grey,
          bulletColorFilled: Colors.white,
          slides: [LoginSlide(), SignupSlide()])
    ],
        ),
      );
  }
}

class _Background extends StatelessWidget {
  const _Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset('assets/login_image.jpg', fit: BoxFit.cover)
    );
  }
}