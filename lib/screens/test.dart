import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WindmillIcon extends StatefulWidget {
  final double size;

  WindmillIcon({Key? key, required this.size}) : super(key: key);

  @override
  _WindmillIconState createState() => _WindmillIconState();
}

class _WindmillIconState extends State<WindmillIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(top: 5),
          height: 100,
          child: Image(image: AssetImage("assets/img/footWindmill.png"))),
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: 
              FaIcon(FontAwesomeIcons.fan, size: 70, color: Colors.white,)
              // Container(
              //   width: 70,
              //   height: 70,
              //   child: Image(image: AssetImage("assets/img/windmill.png"),)),
            );
          },
        ),
      ],
    );
  }
}