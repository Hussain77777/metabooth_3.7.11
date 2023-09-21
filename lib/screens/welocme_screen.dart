import 'package:dooz_color_picker/dooz_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/screens/login_or_register_screen.dart';
import 'package:metabooth/widgets/back_button_widget.dart';
import 'package:metabooth/widgets/button_widget.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/widgets/main_tiitle_widget.dart';
import 'package:metabooth/widgets/register_button_widget.dart';
import 'package:metabooth/widgets/textfield_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Color? pickerColor;

  //
  Color? kelvinColor;
  int? kelvinValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: SizeConfig.height(context, 0.04)),
        height: SizeConfig.height(context, 1),
        width: SizeConfig.width(context, 1),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                GlobalColors.back_image_color,
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: SizeConfig.height(context, 0.05),
               // color: Colors.red,
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(context, 0.2),
                  //     vertical: SizeConfig.height(context, 0.035)
                ),
                child: Image.asset(
                  "assets/metabooth.png",width: SizeConfig.width(context, 0.3),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.height(context, 0.09),
                    left: SizeConfig.width(context, 0.06),
                    right: SizeConfig.width(context, 0.06)),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '',
                    //   style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: "Welcome to ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          color: GlobalColors.whiteColor,
                          fontSize: SizeConfig.width(context, 0.11),
                        ),
                      ),
                      TextSpan(
                        text: "Metabooth.",
                        style: TextStyle(
                          color: GlobalColors.yellowColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Inter",
                          fontSize: SizeConfig.width(context, 0.11),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding:
                    EdgeInsets.only(top: SizeConfig.height(context, 0.475)),
                child: Center(
                  child: ButtonWidget(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginOrRegisterScreen()));
                    },
                    title: "Enter",tiltFontWeight: FontWeight.w600,
                    borderColor: Color(0xFFC8DE00),
                    innerColor: Color(0xFF000000),
                    textColor:Color(0xFFC8DE00),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
