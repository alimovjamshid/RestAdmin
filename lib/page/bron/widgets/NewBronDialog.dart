import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void NewBronDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Align(
                      heightFactor: 3,
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 100,
                        child: Column(
                          children: [
                            Text("Tongi marosim"),
                            SizedBox(height: 2,),
                            Container(height: 1,color: Color(0xFF469794),)
                          ],
                        ),
                      ),
                    ),
                    Center(
                      heightFactor: 2,
                        child: Text(
                          "2-May",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                          ),
                        )
                    ),
                    Align(
                      heightFactor: 1,
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: (){},
                          padding: EdgeInsets.zero,
                          icon: ImageIcon(AssetImage("assets/cancel.png"),size: 40,color: Color(0xFF469794),)
                      ),
                    )
                  ],
                ),
                TextField(
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Sveto muzika",
                      hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                          BorderSide(width: 5, color: Colors.black))),
                ),
                TextField(
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Sveto muzika",
                      hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                          BorderSide(width: 5, color: Colors.black))),
                ),
                TextField(
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Sveto muzika",
                      hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                          BorderSide(width: 5, color: Color(0xFF469794)))),
                ),
              ],
            ),
          ),
        );
      },
  );
}