import 'package:flutter/material.dart';
import 'package:metabooth/button_widget.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/register_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context, 0.08),
                    vertical: SizeConfig.height(context, 0.03)),
                child: Image.asset("assets/login_or_register.png"),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: SizeConfig.height(context, 0.015)),
                child: Text(
                  "Email",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
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
                child: Text(
                  "Password",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              TextFieldWidget(
                  controller: passwordController,
                  isPassword: true,
                  validator: (input) {}),
              ButtonWidget(
                onPressed: () {},
                title: "Login",
                borderColor: Color(0xFFC8DE00),
                innerColor: Color(0xFFC8DE00),
                textColor: Color(0xFF000000),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.height(context, 0.04)),
                child: RegisterButtonWidget(
                  subtitle: "Login",
                  subtitleColor: Color(0xFFC8DE00),
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

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.isPassword,
    this.validator,
  });

  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context, 0.1),
      ),
      child: TextFormField(
        style: TextStyle(color: Color(0xFFC8DE00)),
        validator: widget.validator,
        controller: widget.controller,
        obscureText: secureText,
        decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon( secureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,),
                    color: Color(0xFFC8DE00),
                    onPressed: () {
                      setState(() {
                        secureText = !secureText;
                      });
                    },
                  )
                : Container(),
            contentPadding:
                EdgeInsets.only(left: SizeConfig.width(context, 0.05)),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius:
                  BorderRadius.circular(SizeConfig.width(context, 0.1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius:
                  BorderRadius.circular(SizeConfig.width(context, 0.1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFC8DE00)),
              borderRadius:
                  BorderRadius.circular(SizeConfig.width(context, 0.1)),
            ),
            border: InputBorder.none,
            fillColor: Colors.white),
      ),
    );
  }
}
