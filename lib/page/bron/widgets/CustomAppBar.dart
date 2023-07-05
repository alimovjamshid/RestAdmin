import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Stack(
        children: [
          Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
                right: 10,
                top: 10
            ),
            child: Image.asset("assets/pick.png"),
          )
        ],
      ),
    );
  }
}

