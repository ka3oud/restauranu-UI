import 'package:flutter/material.dart';
import 'package:pizza_app/providers/cart.dart';
import 'package:pizza_app/sources/meals_model.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final cartList = (context).read<Cart>().cartList;
    bool switchCart = (context).read<Cart>().switchCart;
    double total = 0;
    if (cartList.length != 0)
      for (int a = 0; a < cartList.length; a++) {
        total += cartList[a].value;
      }
    return Stack(
      children: [
        if (switchCart)
          InkWell(
            onTap: () =>
                setState(() => (context).read<Cart>().switchCart = false),
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          top: 0,
          right: switchCart ? 0 : -deviceSize.width,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
            child: Container(
              height: deviceSize.height - 35,
              width: deviceSize.width / 1.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.95),
                  Colors.black.withOpacity(0.9)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            icon: Icon(
                              IconData(0xe900, fontFamily: 'ak_shopping_cart'),
                              color: Colors.white70,
                              size: 30,
                            ),
                            onPressed: () => setState(() =>
                                (context).read<Cart>().switchCart = false)),
                      ),
                      if ((context).read<Cart>().switchCart)
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Your Cart',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                    ],
                  ),
                  Expanded(
                      child: cartList.length == 0
                          ? Center(
                              child: Text(
                              'No items',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Cairo',
                                  fontSize: 22),
                            ))
                          : ListView.builder(
                              itemCount: cartList.length,
                              itemBuilder: (context, index) => Card(
                                  margin: EdgeInsets.all(12),
                                  elevation: 3,
                                  child: Container(
                                    color: Colors.black,
                                    height: 120,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          left: 0,
                                          bottom: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cartList[index].name,
                                                  style: TextStyle(
                                                      color: Colors.amber,
                                                      fontFamily: 'Raleway',
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Val : \$ ${cartList[index].value}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Raleway',
                                                    fontSize: 22,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '    Qty : ${cartList[index].qty}',
                                                  style: TextStyle(
                                                    color: Colors.red[900],
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            right: -65,
                                            bottom: -140,
                                            top: 45,
                                            child: Image.asset(
                                                cartList[index].imgUrl)),
                                        Positioned(
                                            bottom: 25,
                                            right: 60,
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  gradient:
                                                      LinearGradient(colors: [
                                                    Colors.amber
                                                        .withOpacity(0.8),
                                                    Colors.red.withOpacity(0.7)
                                                  ])),
                                              child: Text(
                                                cartList[index].mealSize ==
                                                        MealSize.Large
                                                    ? 'L'
                                                    : cartList[index]
                                                                .mealSize ==
                                                            MealSize.Medium
                                                        ? 'M'
                                                        : 'S',
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                    fontFamily: 'Langar'),
                                              ),
                                            )),
                                        Positioned(
                                          top: 0,
                                          right: 10,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                            ),
                                            onPressed: () => setState(() =>
                                                (context)
                                                    .read<Cart>()
                                                    .removeItem(
                                                        cartList[index].id,
                                                        cartList[index].time)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            )),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 65,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Roboto'),
                              ),
                              Text(
                                '  \$ ${(total * 100).floorToDouble() / 100}',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 24,
                                    fontFamily: 'Roboto'),
                              )
                            ],
                          ),
                        ),
                        if (cartList.length != 0)
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.amber, blurRadius: 10)
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
                                  'ORDER',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Jose',
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
