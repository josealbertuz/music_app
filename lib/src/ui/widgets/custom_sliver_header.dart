import 'package:flutter/material.dart';

class CustomSliverHeader extends SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final Widget widget;

  CustomSliverHeader(
      {@required this.minExtent, @required this.maxExtent, @required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    
    return SizedBox.expand(child: widget);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    
    return true;
  }
}