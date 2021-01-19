import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsAbove;
  final Color bulletColor;
  final Color bulletColorFilled;
  final double bulletSize;
  final double bulletSizeFilled;

  Slideshow(
      {@required this.slides,
      this.dotsAbove = false,
      this.bulletColor = Colors.grey,
      this.bulletColorFilled = Colors.blue,
      this.bulletSize = 12,
      this.bulletSizeFilled = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _SlideshowModel(),
        child: Center(
          child: Builder(builder: (context) {
            Provider.of<_SlideshowModel>(context)
              .._bulletColor = bulletColor
              .._bulletColorFilled = bulletColorFilled
              .._bulletSize = bulletSize
              .._bulletSizeFilled = bulletSizeFilled;

            return Column(
              children: [
                if (dotsAbove) _Dots(slides.length),
                Expanded(child: _Slides(slides)),
                if (!dotsAbove) _Dots(slides.length)
              ],
            );
          }),
        ));
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  PageController pageController;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageController.page;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      controller: pageController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    ));
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        child: slide);
  }
}

class _Dots extends StatelessWidget {
  final int numDots;

  _Dots(this.numDots);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<_Dot>.generate(numDots, (index) => _Dot(index))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);

    final bool isNextPage = slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage <= index + 0.5;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: isNextPage
          ? slideshowModel.bulletSizeFilled
          : slideshowModel.bulletSize,
      height: isNextPage
          ? slideshowModel.bulletSizeFilled
          : slideshowModel.bulletSize,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: isNextPage
              ? slideshowModel.bulletColorFilled
              : slideshowModel.bulletColor,
          shape: BoxShape.circle),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0.0;
  Color _bulletColor;
  Color _bulletColorFilled;
  double _bulletSize;
  double _bulletSizeFilled;

  double get currentPage => _currentPage;

  set currentPage(double value) {
    this._currentPage = value;
    notifyListeners();
  }

  Color get bulletColor => _bulletColor;

  set bulletColor(Color value) {
    _bulletColor = value;
  }

  Color get bulletColorFilled => _bulletColorFilled;

  set bulletColorFilled(Color value) {
    _bulletColorFilled = value;
  }

  double get bulletSize => _bulletSize;

  set bulletSize(double value) {
    _bulletSize = value;
  }

  double get bulletSizeFilled => _bulletSizeFilled;

  set bulletSizeFilled(double value) {
    _bulletSizeFilled = value;
  }
}
