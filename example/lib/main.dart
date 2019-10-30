import 'package:flutter/material.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // wrap widgets tree with [BackGestureWidthTheme]
    // to apply it to all descendants
    return BackGestureWidthTheme(

      // specify desired width as fixed logical pixels value
      // backGestureWidth: BackGestureWidth.fixed(200),

      // or as a fraction of the screen width
      backGestureWidth: BackGestureWidth.fraction(1 / 2),

      child: MaterialApp(

        theme: ThemeData(

          // force iOS behaviour on Android (for testing)
          // (or toggle platform via Flutter Inspector)
          // platform: TargetPlatform.iOS,

          // specify page transitions for each platform
          pageTransitionsTheme: PageTransitionsTheme(

            builders: {
              // for Android - default page transition
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),

              // for iOS - one which considers ancestor BackGestureWidthTheme
              TargetPlatform.iOS: CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
            },
          ),
        ),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino back gesture'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Push other page'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return OtherPage();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other page'),
      ),
      body: Center(
        child: Text('Try to swipe back'),
      ),
    );
  }
}
