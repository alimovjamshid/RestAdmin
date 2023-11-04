import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';

class Dropdown extends StatelessWidget {
  Dropdown({super.key, required this.selectValue, required this.list, required this.onPressed});

  final String selectValue;
  final List<String> list;
  final Function(String?) onPressed;



  @override
  Widget build(BuildContext context) {

    return Container(
      color: colorAppBarLight,
      child: Center(
        child :
        Column(children: <Widget>[
          DropdownButton<String>(
            value: selectValue,
            icon: Icon(Icons.arrow_drop_down,color: colorGreen2),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: colorGreen3, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            onChanged: onPressed,
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

        ]),
      ),
    );
  }
}
