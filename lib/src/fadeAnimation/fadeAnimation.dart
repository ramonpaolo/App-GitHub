import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatefulWidget {
  FadeAnimation({Key key, this.colorInit, this.colorEnd}) : super(key: key);
  final colorInit;
  final colorEnd;

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> {
  var tween;

  @override
  void initState() {
    tween = MultiTween()
      ..add("color", ColorTween(begin: widget.colorInit, end: widget.colorEnd))
      ..add("size", Tween(begin: -200.0, end: 0.0));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomAnimation(
        duration: Duration(milliseconds: 500),
        builder: (context, child, value) {
          return Transform.translate(
              offset: Offset(0.0, value.get("size")),
              child: Container(
                width: size.width,
                height: size.height * 0.23,
                decoration: BoxDecoration(
                    color: value.get("color"),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              ));
        },
        tween: tween);
  }
}

class FadeAnimationUser extends StatefulWidget {
  FadeAnimationUser({
    Key key,
    this.image,
  }) : super(key: key);
  final image;

  @override
  _FadeAnimationUserState createState() => _FadeAnimationUserState();
}

class _FadeAnimationUserState extends State<FadeAnimationUser> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomAnimation(
        duration: Duration(milliseconds: 500),
        builder: (context, child, value) {
          return Transform.translate(
              offset: Offset(0.0, value),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(400),
                  child: Container(
                      width: size.width * 0.41,
                      height: size.height * 0.2,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ))));
        },
        tween: Tween(begin: size.height * 0.1, end: -size.height * 0.13));
  }
}

class FadeAnimationName extends StatefulWidget {
  FadeAnimationName({
    key,
    this.child,
  }) : super(key: key);
  final child;
  @override
  _FadeAnimationNameState createState() => _FadeAnimationNameState();
}

class _FadeAnimationNameState extends State<FadeAnimationName> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CustomAnimation(
        child: widget.child,
        duration: Duration(milliseconds: 500),
        builder: (context, child, value) {
          return Transform.translate(
            offset: Offset(0, value),
            child: child,
          );
        },
        tween: Tween(begin: -size.height * 0.3, end: -size.height * 0.14));
  }
}

class FadeAnimationBody extends StatelessWidget {
  FadeAnimationBody(this.child);
  final child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomAnimation(
        duration: Duration(milliseconds: 500),
        child: child,
        builder: (context, child, value) {
          return Transform.translate(
              offset: Offset(value, -size.height * 0.13),
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                      width: size.width,
                      height: size.height * 0.57,
                      padding: EdgeInsets.all(22),
                      child: child,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(40)))));
        },
        tween: Tween(begin: size.width, end: 0.0));
  }
}
