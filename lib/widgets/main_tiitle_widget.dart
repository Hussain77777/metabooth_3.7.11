import 'package:flutter/material.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';

class MainTitleWidget extends StatelessWidget {
   MainTitleWidget({
    super.key, this.title, this.subTitle,
  });
final String?title;
final String?subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.height(context, 0.03),
          left: SizeConfig.width(context, 0.06),
          right: SizeConfig.width(context, 0.06)),
      child: RichText(
        text: TextSpan(
          text: '',
          //   style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                color: GlobalColors.whiteColor,
                fontSize: SizeConfig.width(context, 0.11),
              ),
            ),
            TextSpan(
              text: subTitle,
              style: TextStyle(
                color: GlobalColors.yellowColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                fontSize: SizeConfig.width(context, 0.11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SubTitleWidget extends StatelessWidget {
  SubTitleWidget({
    super.key, this.title, this.subTitle,
  });
  final String?title;
  final String?subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.height(context, 0.01),
          left: SizeConfig.width(context, 0.06),
          right: SizeConfig.width(context, 0.06)),
      child: RichText(
        text: TextSpan(
          text: '',
          //   style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: TextStyle(
               // fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                color: GlobalColors.whiteColor,
                fontSize: SizeConfig.width(context, 0.035),
              ),
            ),
            TextSpan(
              text: subTitle,
              style: TextStyle(
                color: GlobalColors.yellowColor,
             //   fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                fontSize: SizeConfig.width(context, 0.035),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
