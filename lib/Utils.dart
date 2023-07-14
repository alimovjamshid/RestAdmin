import 'package:flutter/material.dart';

class Utils {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Key _button = Key("ss");

}

final Color colorGreenLight = Color(0xFF95DBD8);
final Color colorGreen1 = Color(0xFF7EB9B7);
final Color colorGreen2 = Color(0xFF469794);
final Color colorGreen3 = Color(0xFF0B6561);
final Color colorGreen4 = Color(0xFF02302E);
final Color colorPink = Color(0xFFC57B7B);
final Color colorBlue = Color(0xFF7DBDEB);
final Color colorGreen = Color(0xFF8FBB74);
final Color colorAppBarLight = Color(0xFFE3F8F7);
final Color colorSelect = Color(0xFF55FFF8);
final Color colorView = Color(0xFFC0C0C0);
final Color colorText = Color(0xFF817E7E);
final Color colorOnSelect = Color(0xFF62BAEC);

final months = ["Yanvar","Fevral","Mart","Aprel","May","Iyun","Iyul","Avgust","Sentabr","Oktabr","Noyabr","Dekabr"];

final List<bool> partDay = [false,true,false];
final List<bool> partMonth = [false,false,false,false,false,false,false,false,false,false,false,false];
