import 'package:flutter/material.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';

class MainTitleWidget extends StatelessWidget {
  MainTitleWidget({
    super.key,
    this.title,
    this.subTitle,
    this.subTitleFontWeight,
    this.titleFontWeight,
  });

  final String? title;
  final String? subTitle;
  final FontWeight? subTitleFontWeight;
  final FontWeight? titleFontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.height(context, 0.03),
          left: SizeConfig.width(context, 0.1),
          right: SizeConfig.width(context, 0.06)),
      child: RichText(
        text: TextSpan(
          text: '',
          //   style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: TextStyle(height: 0.1,
                fontWeight: titleFontWeight,letterSpacing: -2.5,
                fontFamily: "Inter",
                color: GlobalColors.whiteColor,
                fontSize: SizeConfig.width(context, 0.11),
              ),
            ),
            TextSpan(
              text: subTitle,
              style: TextStyle(letterSpacing: -2.5,
                color: GlobalColors.yellowColor,
                fontWeight: subTitleFontWeight,
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
    super.key,
    this.title,
    this.subTitle, this.subTitleFontWeight, this.titleFontWeight,
  });

  final String? title;
  final String? subTitle;  final FontWeight? subTitleFontWeight;
  final FontWeight? titleFontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.height(context, 0.01),
          left: SizeConfig.width(context, 0.1),
          right: SizeConfig.width(context, 0.1)),
      child: RichText(
        text: TextSpan(
          text: '',
          //   style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: TextStyle(//letterSpacing: -2.5,
                height: 0.1,
               fontWeight: titleFontWeight,
                fontFamily: "Inter",
                color: GlobalColors.whiteColor,
                fontSize: SizeConfig.width(context, 0.038),
              ),
            ),
            TextSpan(
              text: subTitle,
              style: TextStyle(
                color: GlobalColors.yellowColor,
                 fontWeight: subTitleFontWeight,
                fontFamily: "Inter",
                fontSize: SizeConfig.width(context, 0.038),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
