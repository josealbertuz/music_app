import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class GradientBackgroundFromImage extends StatefulWidget {
  final String image;

  const GradientBackgroundFromImage({Key key, this.image}) : super(key: key);
  

  @override
  _GradientBackgroundFromImageState createState() =>
      _GradientBackgroundFromImageState();
}

class _GradientBackgroundFromImageState
    extends State<GradientBackgroundFromImage> {
  Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(decoration: _gradient());
  }

  @override
  void initState() {
    if (_color == null) _generateBackground();
    super.initState();
  }

  void _generateBackground() async {
    final colorGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(widget.image));
    _color = colorGenerator.dominantColor.color;
    setState(() {});
  }

  Decoration _gradient() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_color ?? Colors.white, Color.fromRGBO(10, 10, 10, 1)]));
  }
}
