import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/page/login/LoginPage.dart';

import 'Utils.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: colorBackground,
        body: LoginPage(),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BottomNavigationBar(
            backgroundColor: colorGreen3,
            selectedItemColor: colorSelect,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/main.png")),
                label: 'Bosh sahifa',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/check.png")),
                  label: 'Band qilish'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/document.png")),
                  label: 'Menu tanlash'),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/chat_hat.png")),
                label: 'Menu yaratish',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
