import 'package:flutter/material.dart';
import 'package:metabooth/widgets/back_button_widget.dart';
import 'package:metabooth/widgets/button_widget.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/widgets/main_tiitle_widget.dart';
import 'package:metabooth/widgets/register_button_widget.dart';
import 'package:metabooth/widgets/textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: SizeConfig.height(context, 0.07),
                //    color: Colors.red,
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(context, 0.2),
                  //     vertical: SizeConfig.height(context, 0.035)
                ),
                child: Image.asset(
                  "assets/metabooth.png",
                ),
              ),
              BackButtonWidget(),
              MainTitleWidget(
                  title: "Experience the Evolution of", subTitle: " light."),
              SubTitleWidget(
                  title: "Enter your Account details below to", subTitle: " register."),
              Padding(
                padding: EdgeInsets.only(
                    bottom: SizeConfig.height(context, 0.015),
                    top: SizeConfig.height(context, 0.04)
                ),
                child: Center(
                  child: Text(
                    "Username",
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              TextFieldWidget(
                  controller: usernameController,
                  isPassword: false,
                  validator: (input) {}),
              Padding(
                padding: EdgeInsets.only(
                    bottom: SizeConfig.height(context, 0.015),
               top: SizeConfig.height(context, 0.015)
                ),
                child: Center(
                  child: Text(
                    "Email",
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              TextFieldWidget(
                  controller: emailController,
                  isPassword: false,
                  validator: (input) {}),
              Padding(
                padding: EdgeInsets.only(
                    bottom: SizeConfig.height(context, 0.015),
                    top: SizeConfig.height(context, 0.015)),
                child: Center(
                  child: Text(
                    "Password",
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              TextFieldWidget(
                  controller: passwordController,
                  isPassword: true,
                  validator: (input) {}),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.height(context, 0.08)),
                child: Center(
                  child: ButtonWidget(
                    onPressed: () {},
                    title: "Register",
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
                    subtitle: "Click Here",
                    subtitleColor: Color(0xFFC8DE00),
                    onPressed: () {},
                    title: "Terms and Conditions",
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