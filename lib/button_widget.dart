import 'package:flutter/material.dart';
import 'package:metabooth/constants/size_config.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Color borderColor;
  final Color innerColor;
  final Color textColor;
  final String title;
   const ButtonWidget({
     required this.onPressed,
    super.key, required this.borderColor, required this.innerColor, required this.textColor, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPressed,
      child: Container(
        height: SizeConfig.height(context, 0.075),
        width: SizeConfig.width(context, 0.8),
        margin: EdgeInsets.symmetric(
          // horizontal: SizeConfig.width(context, 0.05),
        //  vertical: SizeConfig.height(context, 0.1),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color:innerColor,
          borderRadius: BorderRadius.circular(
            SizeConfig.width(context, 0.1),
          ),
        ),
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color:textColor,fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.width(context, 0.05)),
            )),
      ),
    );
  }
}
