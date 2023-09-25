import 'package:flutter/material.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/screens/login_screen.dart';
import 'package:metabooth/screens/register_screen.dart';
import 'package:metabooth/widgets/back_button_widget.dart';
import 'package:metabooth/widgets/button_widget.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/widgets/main_tiitle_widget.dart';
import 'package:metabooth/widgets/register_button_widget.dart';
import 'package:metabooth/widgets/textfield_widget.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                padding:  EdgeInsets.only(top: SizeConfig.width(context, 0.06)),
                child: MainTitleWidget(titleFontWeight: FontWeight.w500,subTitleFontWeight: FontWeight.w700,
                    title: "Experience the evolution of", subTitle: " light."),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.height(context, 0.47)),
                child: Center(
                  child: ButtonWidget(tiltFontWeight: FontWeight.w600,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    title: "Login",
                    borderColor: Color(0xFFC8DE00),
                    innerColor: Color(0xFFC8DE00),
                    textColor: Color(0xFF000000),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.height(context, 0.02)),
                child: Center(
                  child: RegisterButtonWidget(
                    subtitle: "Register",
                    subtitleColor: Color(0xFFC8DE00),
                    onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                    },
                    title: "Don't have an account?",
                    borderColor: Color(0xFFC8DE00),
                    innerColor: Color(0xFF000000),
                    textColor: Color(0xFF9C9C9C),
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
