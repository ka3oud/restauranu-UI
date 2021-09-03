import 'package:flutter/material.dart';
import 'package:pizza_app/sources/meals_model.dart';

class Order {
  final String id;
  final String name;
  int qty;
  final MealSize mealSize;
  final double value;
  final String imgUrl;
  final String time;

  Order(
      {required this.id,
      required this.name,
      required this.qty,
      required this.mealSize,
      required this.value,
      required this.imgUrl,
      required this.time});
}

class Cart with ChangeNotifier {
  List<Order> cartList = [];
  bool switchCart = false;
  bool switchDrawer = false;



  void addToCart(
    String proId,
    String proName,
    int qty,
    String size,
    double totalVal,
    String image,
  ) {
    cartList.insert(
        0,
        Order(
            id: proId,
            name: proName,
            qty: qty,
            mealSize: size == 'S'
                ? MealSize.Small
                : size == 'M'
                    ? MealSize.Medium
                    : MealSize.Large,
            value: totalVal,
            imgUrl: image,
            time: DateTime.now().toString()));
  }

  void removeItem(String id,String time) {
    cartList.removeWhere((meal) => meal.id == id&&meal.time==time);
  }
}
