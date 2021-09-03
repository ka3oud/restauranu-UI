import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizza_app/screens/meals_screen.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> with SingleTickerProviderStateMixin {
  bool _switch = true;
  bool _isLoading = false;
  bool _obscure = false;
  int _duration = 300;
  late AnimationController _controller;
  late Animation<double> animation01;
  late Animation<Offset> animation02;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: _duration));
    animation01 = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    animation02 = Tween(begin: Offset(0.0, -0.15), end: Offset(-0.0, 0.0))
        .animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) =>
          Scaffold(
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
                  top: 45,
                  right: 25,
                  child: Column(
                    children: [
                      IconButton(
                          icon: Icon(
                            !_switch
                                ? IconData(0xe907, fontFamily: 'ak_sign')
                                : IconData(0xe906, fontFamily: 'ak_sign'),
                            size: 35,
                            color: Colors.amber[700]!.withOpacity(0.8),
                          ),
                          onPressed: () {
                            setState(() {
                              if (!_switch) {
                                _switch = !_switch;
                                _controller.reverse();
                              } else {
                                _switch = !_switch;
                                _controller.forward();
                              }
                            });
                          }),
                      Text(
                        _switch ? "Sign Up" : "Sign In",
                        style: TextStyle(
                            color: Colors.amber[700]!.withOpacity(0.7),
                            fontFamily: 'Jose'),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 230,
                  child: Text(
                    'Welcome Back !',
                    style: TextStyle(
                        fontFamily: 'Jose',
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                    left: 50,
                    right: 50,
                    top: 300,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: _duration),
                          height: _switch ? 300 : 600,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            SlideTransition(
                            position: animation02,
                            child: FadeTransition(
                              opacity: animation01,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: _duration),
                                margin: EdgeInsets.only(bottom: _switch
                                    ? 0
                                    : 15),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                height: _switch ? 0 : 60,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black,
                                        Colors.black.withOpacity(0.2),
                                        Colors.black.withOpacity(0.3)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.amber[700],
                                        fontFamily: 'Roboto',
                                        fontSize: 16),
                                    controller: null,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        IconData(0xe900, fontFamily: 'ak_sign'),
                                        color: Colors.amber[700],
                                        size: 28,
                                      ),
                                      hintText: 'Enter Your Nickname',
                                      hintStyle: TextStyle(
                                          color:
                                          Colors.amber[700]!.withOpacity(0.6),
                                          fontFamily: 'Roboto',
                                          fontSize: 16),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              50),
                                          borderSide: BorderSide.none),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.black.withOpacity(0.2),
                                    Colors.black.withOpacity(0.3)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextFormField(
                                controller: null,
                                style: TextStyle(
                                    color: Colors.amber[700],
                                    fontFamily: 'Roboto',
                                    fontSize: 16),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    IconData(0xe901, fontFamily: 'ak_sign'),
                                    color: Colors.amber[700],
                                    size: 28,
                                  ),
                                  hintText: 'Enter Your E-mail',
                                  hintStyle: TextStyle(
                                      color: Colors.amber[700]!.withOpacity(
                                          0.6),
                                      fontFamily: 'Roboto',
                                      fontSize: 16),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none),
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.black.withOpacity(0.2),
                                    Colors.black.withOpacity(0.3)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextFormField(
                              controller: null,
                              obscureText: _obscure,
                              style: TextStyle(
                                  color: Colors.amber[700],
                                  fontFamily: 'Roboto',
                                  fontSize: 16),
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(icon: Icon(
                                      _obscure?Icons.remove_red_eye_outlined:Icons.remove_red_eye,
                                      color: Colors.amber[700]),
                                    onPressed: () =>
                                        setState(() => _obscure = !_obscure),),
                                  prefixIcon: Icon(
                                  IconData(0xe902, fontFamily: 'ak_sign'),
                              color: Colors.amber[700],
                              size: 28,
                            ),
                            hintText: 'Enter Your Password',
                            hintStyle: TextStyle(
                                color: Colors.amber[700]!.withOpacity(0.7),
                                fontFamily: 'Roboto',
                                fontSize: 16),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none),
                          )),
                    ),
                    SlideTransition(
                      position: animation02,
                      child: FadeTransition(
                        opacity: animation01,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: _duration),
                          margin: EdgeInsets.only(bottom: _switch ? 0 : 15),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: _switch ? 0 : 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0.2),
                                  Colors.black.withOpacity(0.3)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                              controller: null,
                              style: TextStyle(
                                  color: Colors.amber[700],
                                  fontFamily: 'Roboto',
                                  fontSize: 16),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  IconData(0xe903, fontFamily: 'ak_sign'),
                                  color: Colors.amber[700],
                                  size: 28,
                                ),
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                    color:
                                    Colors.amber[700]!.withOpacity(0.7),
                                    fontFamily: 'Roboto',
                                    fontSize: 16),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none),
                              )),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: animation02,
                      child: FadeTransition(
                        opacity: animation01,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: _duration),
                          margin: EdgeInsets.only(bottom: _switch ? 0 : 15),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: _switch ? 0 : 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0.2),
                                  Colors.black.withOpacity(0.3)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                              controller: null,
                              style: TextStyle(
                                  color: Colors.amber[700],
                                  fontFamily: 'Roboto',
                                  fontSize: 16),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  IconData(0xe904, fontFamily: 'ak_sign'),
                                  color: Colors.amber[700],
                                  size: 28,
                                ),
                                hintText: '+2 | ',
                                hintStyle: TextStyle(
                                    color:
                                    Colors.amber[700]!.withOpacity(0.7),
                                    fontFamily: 'Roboto',
                                    fontSize: 16),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none),
                              )),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: animation02,
                      child: FadeTransition(
                        opacity: animation01,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: _duration),
                          margin: EdgeInsets.only(bottom: _switch ? 0 : 15),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: _switch ? 0 : 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0.2),
                                  Colors.black.withOpacity(0.3)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                              controller: null,
                              style: TextStyle(
                                  color: Colors.amber[700],
                                  fontFamily: 'Roboto',
                                  fontSize: 16),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  IconData(0xe905, fontFamily: 'ak_sign'),
                                  color: Colors.amber[700],
                                  size: 28,
                                ),
                                hintText: 'Enter Your Location',
                                hintStyle: TextStyle(
                                    color:
                                    Colors.amber[700]!.withOpacity(0.7),
                                    fontFamily: 'Roboto',
                                    fontSize: 16),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none),
                              )),
                        ),
                      ),
                    ),
                    if (!_switch)
                SizedBox(
                  height: 20,
                ),
                if (!_isLoading)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.amber, Colors.red[900]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(55)),
                    child: TextButton(
                      child: Text(
                        _switch ? "Sign in" : "Sign Up",
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            wordSpacing: 2,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        Future.delayed(
                            Duration(seconds: 2),
                                () =>
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: MealsCategories(),
                                        type: PageTransitionType.fade,
                                        duration:
                                        Duration(milliseconds: 1000))));
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.amber,
                          elevation: 25,
                          shadowColor: Colors.amber),
                    ),
                  ),
                if (_isLoading)
                  CircularProgressIndicator(
                    color: Colors.amber[700]!,
                    strokeWidth: 2,
                  ),
                SizedBox(
                  height: _switch ? 0 : 50,
                ),
              ],
            ),
          ),
    ))]
    ,
    )
    ,
    )
    ,
    );
  }
}
