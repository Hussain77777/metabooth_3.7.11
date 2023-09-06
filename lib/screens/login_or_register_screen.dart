import 'package:flutter/material.dart';
import 'package:metabooth/button_widget.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/register_button_widget.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
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
                "assets/background_image_color.png",
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context, 0.08),
                    vertical: SizeConfig.height(context, 0.03)),
                child: Image.asset("assets/login_or_register.png"),
              ),
              SizedBox(
                height: SizeConfig.height(context, 0.33),
              ),
              ButtonWidget(
                onPressed: () {},
                title: "Login",
                borderColor: Color(0xFFC8DE00),
                innerColor: Color(0xFFC8DE00),
                textColor: Color(0xFF000000),
              ),
              Padding(
                padding:  EdgeInsets.only(top: SizeConfig.height(context, 0.04)),
                child: RegisterButtonWidget(subtitle: "Login",subtitleColor: Color(0xFFC8DE00),
                  onPressed: () {},
                  title: "Don't have an account?",
                  borderColor: Color(0xFFC8DE00),
                  innerColor: Color(0xFF000000),
                  textColor: Color(0xFF9C9C9C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
