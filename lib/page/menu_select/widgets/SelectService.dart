import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils.dart';

class SelectService extends StatelessWidget {
  const SelectService({
    super.key, required this.label, required this.moneyLabel, required this.ischecket, required this.onChanged,
  });

  final String label;
  final String moneyLabel;
  final bool ischecket;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Stack(
        children: [
          Align(
            child: Text(label,style: TextStyle(fontSize: 16)),
            alignment: Alignment(-0.85,0),
          ),
          Align(
            alignment: Alignment(-0.1, 0),
            child: Container(width: 1,color: colorGreen2),
          ),
          Align(
            alignment: Alignment(0.15, 0),
            child: Text(moneyLabel,style: TextStyle(fontSize: 16),textAlign: TextAlign.start),
          ),
          Align(
            alignment: Alignment(0.8, 0),
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: ischecket,
                onChanged: onChanged,
                side: BorderSide(color: colorGreen3,width: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                activeColor: colorGreen3,
                autofocus: true,
                checkColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

