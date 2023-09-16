import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/LoginApp.dart';
import 'package:restadmin/Utils.dart';
import 'package:restadmin/page/bron/BronPage.dart';
import 'package:restadmin/page/home/HomePage.dart';
import 'package:restadmin/page/menu_create/MenuCreatePage.dart';
import 'package:restadmin/page/menu_select/MenuSelectPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppDrawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  final prefs = await SharedPreferences.getInstance();
  var tok = prefs.getString(token);
  var log = prefs.getString(login);
  var pass = prefs.getString(password);
  if (log != null) {
    final response = await dio.post(
        "https://wedding-halls-production.up.railway.app/auth",
        data: {'email': log, 'password': pass});
    if (response.statusCode == 201) {
      prefs.setString(token, response.data['token']);
    }
  }
  initializeDateFormatting().then((_) => runApp(tok == null ?const LoginApp():const MyApp()));
  dateSelect();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  final List<Widget> _list = List<Widget>.unmodifiable([
    HomePage(),
    BronPage(),
    MenuSelectPage(),
    MenuCreatePage(),
  ]);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    main();
    super.initState();
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
        backgroundColor: colorBackground,
        body: _list[_selectedIndex],
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
            currentIndex: _selectedIndex,
            onTap: (value) => _onItemTapped(value),
          ),
        ),
      ),
    );
  }
}
