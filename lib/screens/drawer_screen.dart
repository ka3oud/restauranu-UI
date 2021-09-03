import 'package:flutter/material.dart';
import 'package:pizza_app/providers/cart.dart';
import 'package:pizza_app/sources/meals_model.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    bool switchDrawer = (context).read<Cart>().switchDrawer;
    return Stack(
      children: [
        if (switchDrawer)
          InkWell(
            onTap: () =>
                setState(() => (context).read<Cart>().switchDrawer = false),
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          top: 0,
          left: switchDrawer ? 0 : -deviceSize.width,
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            child: Container(
              height: deviceSize.height - 35,
              width: deviceSize.width / 1.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.95),
                  Colors.black.withOpacity(0.9)
                ], begin: Alignment.centerRight, end: Alignment.centerLeft),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(
                                IconData(0xe908, fontFamily: 'ak_sign'),
                                color: Colors.white70,
                                size: 30,
                              ),
                              onPressed: () => setState(() =>
                                  (context).read<Cart>().switchDrawer = false)),
                        ),
                      ],
                    ),
                    Text(
                      '  Hello, Kaoud!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '     MENU',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 22),
                    ),
                    menuListTile(IconData(0xe911, fontFamily: 'ak_sign'), 'Appetizers'),
                    menuListTile(IconData(0xe912, fontFamily: 'ak_sign'), 'Pasta'),
                    menuListTile(IconData(0xe913, fontFamily: 'ak_sign'), 'Pizza'),
                    menuListTile(IconData(0xe915, fontFamily: 'ak_sign'), 'Wings'),
                    menuListTile(IconData(0xe914, fontFamily: 'ak_sign'), 'Salads'),
                    menuListTile(IconData(0xe916, fontFamily: 'ak_sign'), 'Drinks'),
                    menuText('SETTINGS'),
                    menuText('DELIVERY'),
                    menuText('ABOUT US')
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding menuText(String _text) {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Text(_text,style:
                    TextStyle(color: Colors.white, fontSize: 28, fontFamily: 'Cairo'),),
                  );
  }

  Padding menuListTile(IconData _icon, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListTile(
        leading: Icon(
          _icon,
          size: 30,
          color: Colors.amber[700],
        ),
        title: Text(
          desc,
          style:
              TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Cairo'),
        ),
      ),
    );
  }
}
