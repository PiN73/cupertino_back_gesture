import 'package:flutter/material.dart';

import 'cupertino_page_route.dart';

/// This is a copy of Flutter's material [CupertinoPageTransitionsBuilder]
/// with modified version of [CupertinoPageRoute]
class CupertinoPageTransitionsBuilderCustomBackGestureWidth
    extends PageTransitionsBuilder {
  const CupertinoPageTransitionsBuilderCustomBackGestureWidth();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return CupertinoRouteTransitionMixin.buildPageTransitions<T>(
        route, context, animation, secondaryAnimation, child);
  }
}
