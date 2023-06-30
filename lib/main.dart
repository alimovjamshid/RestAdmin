import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/bron/BronPage.dart';
import 'package:restadmin/page/home/HomePage.dart';
import 'package:restadmin/page/menu_create/MenuCreatePage.dart';
import 'package:restadmin/page/menu_select/MenuSelectPage.dart';

import 'AppDrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _list = List<Widget>.unmodifiable([
    const HomePage(),
    const BronPage(),
    const MenuSelectPage(),
    const MenuCreatePage(),
  ]);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawerEnableOpenDragGesture: false,
        endDrawer: const AppDrawer(),
        key: utils.scaffoldKey,
        backgroundColor: const Color(0xFFEBE8E8),
        body: _list[_selectedIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFF0B6561),
            selectedItemColor: const Color(0xFF55FFF8),
            unselectedItemColor: const Color(0xFFFFFFFF),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/main.png")),
                  label: 'Bosh sahifa',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/check.png")),
                  label: 'Band qilish'
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/document.png")),
                  label: 'Menu tanlash'
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/chat_hat.png")),
                  label: 'Menu yaratish',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (value) => _onItemTapped(value),
          ),
        ),
      ),
    );
  }
}
