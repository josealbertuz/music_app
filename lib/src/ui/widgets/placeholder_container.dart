import 'package:flutter/material.dart';

class PlaceholderContainerAnimation extends StatefulWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;

  PlaceholderContainerAnimation(
      {this.width = double.infinity,
      this.height = double.infinity,
      this.margin});

  @override
  _PlaceholderContainerAnimationState createState() =>
      _PlaceholderContainerAnimationState();
}

class _PlaceholderContainerAnimationState
    extends State<PlaceholderContainerAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> colorStop;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    colorStop = Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.forward();

    controller.addListener(() {
      if (controller.isCompleted) controller.forward(from: 0.0);
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: colorStop,
        builder: (context, child) => Container(
              margin: widget.margin,
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [colorStop.value, 1.0],
                      colors: [Color(0xff999999), Color(0xffEEEEEE)])),
            ));
  }
}
