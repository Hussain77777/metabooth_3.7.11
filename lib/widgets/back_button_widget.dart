import 'package:flutter/material.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.width(context, 0.06)),
      child: GestureDetector(onTap: (){
        Navigator.pop(context);
      },
        child: CircleAvatar(
          backgroundColor: GlobalColors.yellowColor,
          radius: SizeConfig.width(context, 0.05),
          child: Icon(Icons.arrow_back,
              color: Colors.black,
              size: SizeConfig.width(context, 0.07)),
        ),
      ),
    );
  }
}