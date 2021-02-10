import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.black38,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/logo.jpeg"),
            fit: BoxFit.fill,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Center(
            child: new SpinKitFadingCircle(
              color: Colors.cyan[600],
              size: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}
