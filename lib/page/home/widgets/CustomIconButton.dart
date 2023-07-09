import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restadmin/Utils.dart';

class CustomIconButton extends StatelessWidget {
  final double? borderRadius;
  final double? height;
  final double? width;
  final String? imageIcon;
  final VoidCallback onPressed;
  const CustomIconButton({
    super.key, this.height, this.width, this.imageIcon, required this.onPressed, this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: colorGreen2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: ImageIcon(AssetImage(imageIcon!),color: Colors.white,),
      ),
    );
  }
}