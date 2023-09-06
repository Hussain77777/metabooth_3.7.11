import 'package:flutter/material.dart';
import 'package:metabooth/button_widget.dart';
import 'package:metabooth/constants/size_config.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: SizeConfig.height(context, 0.08)),
        height: SizeConfig.height(context, 1),
        width: SizeConfig.width(context, 1),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/background_image_color.png",
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context, 0.08),
                    vertical: SizeConfig.height(context, 0.03)),
                child: Image.asset("assets/welcome.png"),
              ),   SizedBox(
                height: SizeConfig.height(context, 0.33),
              ),
              ButtonWidget(onPressed: () {},
                  title: "Enter",
                  borderColor: Color(0xFFC8DE00),
                  innerColor: Color(0xFF000000),
                  textColor: Color(0xFFC8DE00), )
            ],
          ),
        ),
      ),
    );
  }
}
