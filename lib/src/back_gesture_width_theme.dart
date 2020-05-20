import 'package:flutter/widgets.dart';

/// Calculates width of area where back swipe gesture is accepted
/// in logical pixels
/// (optionally) based on the screen size
typedef BackGestureWidthGetter = double Function(ValueGetter<Size>);

/// [BackGestureWidthGetter] builders
class BackGestureWidth {
  const BackGestureWidth._();

  /// Always returns same value equals to [width]
  static BackGestureWidthGetter fixed(double width) => (_) => width;

  /// Always returns a value equals to [fraction] of screen width
  static BackGestureWidthGetter fraction(double fraction) =>
      (sizeGetter) => sizeGetter().width * fraction;
}

/// Applies a [backGestureWidth] to descendant widgets.
class BackGestureWidthTheme extends InheritedWidget {
  const BackGestureWidthTheme({
    Key key,
    this.backGestureWidth,
    Widget child,
  }) : super(key: key, child: child);

  final BackGestureWidthGetter backGestureWidth;

  static BackGestureWidthTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BackGestureWidthTheme>();

  @override
  bool updateShouldNotify(BackGestureWidthTheme oldWidget) =>
      backGestureWidth != oldWidget.backGestureWidth;
}
