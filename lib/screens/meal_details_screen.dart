import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/providers/cart.dart';
import 'package:pizza_app/screens/cart_screen.dart';
import 'package:pizza_app/screens/drawer_screen.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/sources/meals_model.dart';

String size = 'SML';

class MealDetails extends StatefulWidget {
  const MealDetails({Key? key}) : super(key: key);

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails>
    with TickerProviderStateMixin {
  int ind = 0;
  int qty = 1;
  bool slide = true;
  bool switchCart = false;

  String standardSize = 'S';
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> animation01;
  late Animation<Offset> animation02;
  late Animation<Offset> animation03;
  late Animation<Offset> animation04;
  late Animation<double> animation05;

  onchange(int index, CarouselPageChangedReason reason) {
    _controller.reverse().then((value) {
      setState(() {
        ind = index;
      });
      return _controller.forward();
    });
  }

  _onDragUp(DragUpdateDetails detail) {
    if (detail.primaryDelta! >= 7)
      setState(() {
        slide = true;
        _controller.forward();
      });
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    animation01 = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    animation02 = Tween(begin: Offset(-0.1, -0.2), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    animation03 = Tween(begin: Offset(0.3, 0.3), end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    animation04 = Tween(begin: Offset(-2, -2), end: Offset(0.0, 0.0)).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    animation05 = Tween(begin: 1.0, end: 1.5).animate(
        CurvedAnimation(parent: _controller2, curve: Curves.bounceOut));

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviseHeight = MediaQuery.of(context).size.height;
    final cart = (context).read<Cart>().cartList;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/Texture.jfif',
                fit: BoxFit.fill,
              ),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  left: 0,
                  right: 0,
                  top: !slide ? 220 : deviseHeight,
                  height: deviseHeight - 220,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onDragUp,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom: -260,
                          left: 25,
                          right: 25,
                          child: Container(
                            height: 400,
                            child: Image.asset(
                              meals[ind].imgUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          meals[ind].name,
                          style: TextStyle(
                              color: Colors.white,
                              shadows: [
                                Shadow(color: Colors.amber, blurRadius: 50)
                              ],
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              fontFamily: 'Keania'),
                          textAlign: TextAlign.center,
                        ),
                        Positioned(
                            top: 75,
                            left: 65,
                            right: 65,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(
                                  size.length,
                                  (index) => Container(
                                    alignment: Alignment.center,
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Colors.black.withOpacity(0.3),
                                          Colors.black.withOpacity(0.3),
                                          Colors.black
                                        ])),
                                    child: InkWell(
                                      onTap: () => setState(() {
                                        standardSize = size[index];
                                      }),
                                      child: Text(
                                        '${size[index]}',
                                        style: TextStyle(
                                            color: standardSize == size[index]
                                                ? Colors.amber
                                                : Colors.white,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.amber,
                                                  blurRadius: 50)
                                            ],
                                            fontFamily: 'Langar',
                                            fontSize: 36),
                                      ),
                                    ),
                                  ),
                                ))),
                        Positioned(
                            top: 170,
                            left: 10,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () => setState(() {
                                                if (qty > 1) qty--;
                                              }),
                                          icon: Icon(
                                            IconData(0xe909,
                                                fontFamily: 'ak_sign'),
                                            color: Colors.white70,
                                          )),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '$qty',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Roboto',
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        height: 50,
                                        width: 85,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            gradient: LinearGradient(colors: [
                                              Colors.black.withOpacity(0.3),
                                              Colors.black.withOpacity(0.3),
                                              Colors.black
                                            ])),
                                      ),
                                      IconButton(
                                          onPressed: () =>
                                              setState(() => qty++),
                                          icon: Icon(
                                            IconData(0xe910,
                                                fontFamily: 'ak_sign'),
                                            color: Colors.white70,
                                          ))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '\$ ${(qty * (standardSize == 'S' ? meals[ind].price : standardSize == 'M' ? meals[ind].price + 10 : meals[ind].price + 20) * 100).floorToDouble() / 100}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.amber[700],
                                      fontSize: 28,
                                      fontFamily: 'Raleway',
                                      shadows: [
                                        Shadow(
                                            color: Colors.amber, blurRadius: 50)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Positioned(
                            top: 260,
                            right: 100,
                            left: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.amber, blurRadius: 35)
                                  ],
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.amber,
                                        Colors.deepOrange[600]!
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                              child: TextButton(
                                child: Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Jose',
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  (context).read<Cart>().addToCart(
                                      meals[ind].id,
                                      meals[ind].name,
                                      qty,
                                      standardSize,
                                      (qty *
                                                  (standardSize == 'S'
                                                      ? meals[ind].price
                                                      : standardSize == 'M'
                                                          ? meals[ind].price +
                                                              10
                                                          : meals[ind].price +
                                                              20) *
                                                  100)
                                              .floorToDouble() /
                                          100,
                                      meals[ind].imgUrl);
                                  _controller2
                                      .forward()
                                      .then((value) => _controller2.reverse())
                                      .then((value) {
                                    setState(() {
                                      slide = true;
                                    });
                                    _controller.forward();
                                  });
                                },
                              ),
                            ))
                      ],
                    ),
                  )),
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  height: 180,
                  child: Image.asset('assets/images/Logo.png')),
              Positioned(
                  top: 200,
                  right: 0,
                  left: 0,
                  child: FadeTransition(
                    opacity: animation01,
                    child: SlideTransition(
                      position: slide ? animation02 : animation04,
                      child: Text(
                        meals[ind].name,
                        style: TextStyle(
                            color: Colors.white,
                            shadows: [
                              Shadow(color: Colors.amber, blurRadius: 50)
                            ],
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                            fontFamily: 'Keania'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
              Positioned(
                  top: 260,
                  right: 30,
                  child: SlideTransition(
                    position: slide ? animation03 : animation04,
                    child: FadeTransition(
                      opacity: animation01,
                      child: Text(
                        '\$ ${meals[ind].price}',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(color: Colors.white, blurRadius: 50)
                            ],
                            fontSize: 33,
                            fontFamily: 'Raleway'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                right: 0,
                top: slide ? 200 : deviseHeight,
                bottom: slide ? 0 : deviseHeight * 2,
                left: 0,
                child: Container(
                    child: CarouselSlider(
                  items: List.generate(
                    meals.length,
                    (index) => Opacity(
                      opacity: ind == index ? 1.0 : 0.5,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            slide = false;
                            standardSize = 'S';
                            qty = 1;
                            _controller.reverse();
                          });
                        },
                        child: Image.asset(
                          meals[index].imgUrl,
                        ),
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                      autoPlayAnimationDuration: Duration(milliseconds: 1700),
                      autoPlayCurve: Curves.elasticOut,
                      onPageChanged: onchange,
                      enlargeCenterPage: true,
                      aspectRatio: 1.50,
                      autoPlayInterval: Duration(seconds: 6),
                      viewportFraction: 0.65),
                )),
              ),
              Positioned(
                  bottom: 35,
                  right: 25,
                  left: 25,
                  child: FadeTransition(
                    opacity: animation01,
                    child: SlideTransition(
                      position: slide ? animation03 : animation04,
                      child: Text(
                        meals[ind].description,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: Colors.amber[200],
                            fontSize: 16,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            fontFamily: 'Langar'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
              Positioned(
                top: 150,
                right: 0,
                left: 0,
                child: TextButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      IconData(0xe900, fontFamily: 'ak_arrow_back'),
                      color: Colors.white70,
                    ),
                    label: Text(
                      '  Back to Menu',
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Langar',
                          fontSize: 18),
                    )),
              ),
              Positioned(
                top: 25,
                right: 15,
                child: AnimatedBuilder(
                  animation: _controller2,
                  builder: (context, _) => Material(
                    color: Colors.transparent,
                    child: ScaleTransition(
                      scale: animation05,
                      child: Stack(
                        children: [
                          if (cart.length != 0)
                            Positioned(
                                left: 0,
                                bottom: 8,
                                child: Text(
                                  '${cart.length}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Raleway',
                                      fontSize: 16),
                                )),
                          IconButton(
                              icon: Icon(
                                IconData(0xe900,
                                    fontFamily: 'ak_shopping_cart'),
                                color: cart.length > 0
                                    ? Colors.amber
                                    : Colors.white70,
                                size: 30,
                              ),
                              onPressed: () => setState(() =>
                                  (context).read<Cart>().switchCart = true)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 25,
                  left: 15,
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        IconData(
                          0xe908,
                          fontFamily: 'ak_sign',
                        ),
                        color: Colors.white70,
                        size: 30,
                      ),
                      onPressed: () => setState(() =>
                      (context).read<Cart>().switchDrawer = true),
                    ),
                  )),
              CartScreen(),
              DrawerScreen()
            ],
          ),
        ),
      ),
    );
  }
}
