import 'package:flutter/material.dart';
import 'package:pizza_app/screens/meals_screen.dart';
import 'package:pizza_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider.value(value: Cart())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  ));
}
