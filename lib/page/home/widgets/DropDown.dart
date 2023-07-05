import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    String? dropdownValue = '2023';

    List <String> spinnerItems = [
      '2023',
      '2024',
      '2025',
      '2026',
      '2027'
    ] ;
    return Center(
      child :
      Column(children: <Widget>[
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down,color: Color(0xFF519592)),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Color(0xFF0B6561), fontSize: 18),
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          onChanged: (data) {
            setState(() {
              dropdownValue = data;
            });
          },
          items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),

      ]),
    );
  }
}
