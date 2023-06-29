import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.amberAccent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6),
              bottomLeft: Radius.circular(6)
          )
      ),
      child: ListView(
        children: [
          Container(
            height: 60,
            decoration: ShapeDecoration(
                color: Color(0xFF0B6561),
              shape: RoundedRectangleBorder(
              )
            ),
            child: Center(
              child: Text(
                "logo-RestAdmin",
                textAlign: TextAlign.center,
                style: TextStyle(
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
              textAlign: TextAlign.center,
              "Sozlamalar",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text("Qo'shimcha xizmatlar"),
            onTap: (){
            },
            leading: Image.asset("assets/app.png"),
          ),
          ListTile(
            title: Text("Statistika"),
            onTap: (){
            },
            leading: Image.asset("assets/statistic.png"),
          ),
          ListTile(
            title: Text("Qilingan harajatlar"),
            onTap: (){
            },
            leading: Image.asset("assets/money.png"),
          ),
          ListTile(
            title: Text("Qarzdorlik"),
            onTap: (){
            },
            leading: Image.asset("assets/hands.png"),
          ),
          ListTile(
            title: Text("Chiqish"),
            onTap: (){
            },
            leading: Image.asset("assets/running.png"),
          )
        ],
      ),
    );
  }
}