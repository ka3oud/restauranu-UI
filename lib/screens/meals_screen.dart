import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizza_app/providers/cart.dart';
import 'package:pizza_app/screens/cart_screen.dart';
import 'package:pizza_app/screens/drawer_screen.dart';
import 'package:pizza_app/screens/meal_details_screen.dart';
import 'package:pizza_app/sources/categories_model.dart';
import 'package:provider/provider.dart';

class MealsCategories extends StatefulWidget {
  const MealsCategories({Key? key}) : super(key: key);

  @override
  _MealsCategoriesState createState() => _MealsCategoriesState();
}

class _MealsCategoriesState extends State<MealsCategories>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation01;
  late Animation<double> animation02;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200))
          ..repeat(reverse: true);
    animation01 = Tween(begin: Offset(-0.15, -0.15), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    animation02 = Tween(begin: 0.7, end: 1.0).animate(
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
    final cart = (context).read<Cart>().cartList;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Texture.jfif',
            fit: BoxFit.fill,
          ),
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              height: 180,
              child: Image.asset('assets/images/Logo.png')),
          Positioned(
              top: 170,
              right: 0,
              left: 0,
              child: ScaleTransition(
                scale: animation02,
                child: Text(
                  'Choose Your Meal',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      shadows: [Shadow(color: Colors.amber, blurRadius: 50)],
                      fontFamily: 'Keania'),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
            top: 250,
            right: 0,
            left: 0,
            child: Container(
              child: CarouselSlider.builder(
                itemCount: categories.length,
                itemBuilder: (context, index, _) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        PageTransition(
                            child: MealDetails(),
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 1000))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              categories[index].imgUrl,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Container(
                                alignment: Alignment.center,
                                height: 75,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                      Colors.white.withOpacity(0.2),
                                      Colors.black
                                    ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                                child: ScaleTransition(
                                  scale: animation02,
                                  child: FadeTransition(
                                    opacity: animation02,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      child: Text(
                                        '${categories[index].name}',
                                        style: TextStyle(
                                            color: Colors.amber.shade300,
                                            fontFamily: 'Langar',
                                            fontSize: 38,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 50)
                                            ],
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                },
                options: CarouselOptions(
                    height: 400,
                    autoPlayAnimationDuration: Duration(milliseconds: 1700),
                    autoPlayCurve: Curves.elasticOut,
                    enlargeCenterPage: true,
                    viewportFraction: 0.7),
              ),
            ),
          ),
          Positioned(
              top: 25,
              right: 15,
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    if(cart.length!=0)
                    Positioned(
                        left: 0,
                        bottom: 8,
                        child: Text(
                          '${cart.length}',
                          style: TextStyle(
                              color: Colors.red, fontFamily: 'Raleway',fontSize: 16),
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
              )),
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
    );
  }
}
