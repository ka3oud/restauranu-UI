import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizza_app/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation01;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700))
          ..repeat(reverse: true);
    animation01 = Tween(begin: 0.3, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/Texture.jfif',
              fit: BoxFit.fill,
            ),
            Positioned(
                top: -25,
                right: 0,
                left: 0,
                height: 300,
                child: Image.asset('assets/images/Logo.png')),
            Positioned(
              left: 0,
              right: 0,
              top: 230,
              child: Text(
                'Welcome',
                style: TextStyle(
                    fontFamily: 'Jose',
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 285,
              child: Text(
                'To Koaud\'s Shop !',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 340,
              child: Text(
                'Best delivery service in the city',
                style: TextStyle(
                    fontFamily: 'Raleway', fontSize: 22, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              bottom: -30,
              right: -40,
              left: 200,
              height: 400,
              child: Image.asset(
                'assets/images/Pizzaria.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 400,
                left: 120,
                right: 120,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.amber,
                          Colors.amber,
                          Colors.red,
                          Colors.red[900]!
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(55)),
                  child: TextButton(
                    child: FadeTransition(
                      opacity: animation01,
                      child: Text(
                        "LET'S START",
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            wordSpacing: 2,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () => Navigator.push(context, PageTransition(
                        child: Auth(),
                        type: PageTransitionType.leftToRightWithFade,
                        duration: Duration(milliseconds: 1000)),),
                    style: TextButton.styleFrom(
                        primary: Colors.amber,
                        elevation: 25,
                        shadowColor: Colors.amber),
                  ),
                )),
            Positioned(
                bottom: -220,
                left: -150,
                height: 520,
                child: Opacity(
                    opacity: 0.8, child: Image.asset('assets/images/Potato.png')))
          ],
        ),
      ),
    );
  }
}
