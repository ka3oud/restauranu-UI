import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../sources/meals_model.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
int cur = 0;

  @override
  Widget build(BuildContext context) {
    final deviseSize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          height: deviseSize.height,
          width: deviseSize.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  child: Transform.scale(
                scale: 6.5,
                child: Transform.translate(
                  offset: Offset(0.0, -65.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(blurRadius: 100, color: Colors.black26)
                        ]),
                  ),
                ),
              )),
              Positioned(
                  top: 35,
                  left: 15,
                  child: IconButton(
                    icon: Icon(IconData(0xe900, fontFamily: 'ak_arrow_back')),
                    onPressed: () {},
                  )),
              Positioned(
                  top: 35,
                  right: 15,
                  child: IconButton(
                    icon:
                        Icon(IconData(0xe900, fontFamily: 'ak_shopping_cart')),
                    onPressed: () {},
                  )),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                    alignment: Alignment.topCenter,
                    height: deviseSize.height * 0.6,
                    width: deviseSize.width,
                    child: CarouselSlider.builder(
                      itemCount: meals.length,
                      itemBuilder: (context,index,_){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              height: cur == index ? 100 : 0,
                            ),
                            Container(
                              child: Image.asset(
                                meals[index].imgUrl,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        onPageChanged: (val,_){
                          setState(() {
                            cur=val;
                          });
                        },
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        viewportFraction: 0.65,
                        aspectRatio: 1.0
                      ),
                    )
                ),
              )
            ],
          ),
        ));
  }
}
