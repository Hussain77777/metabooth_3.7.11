import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metabooth/screens/add_device_screen.dart';
import 'package:metabooth/widgets/back_button_widget.dart';
import 'package:metabooth/widgets/button_widget.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/widgets/main_tiitle_widget.dart';
import 'package:metabooth/widgets/register_button_widget.dart';
import 'package:metabooth/widgets/textfield_widget.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) async {
      setState(() {
        loading = false;
      });
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AddDeviceScreen()), (route) => false);

    }).onError((error, stackTrace) {
      print("error ${error.toString()}");
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }

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
        //  physics: NeverScrollableScrollPhysics(),
          child: Form(key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Container(
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
                ),
                BackButtonWidget(),
                MainTitleWidget(
                    title: "Experience the Evolution of", subTitle: " light."),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.height(context, 0.015),
                      top: SizeConfig.height(context, 0.06)),
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
                    validator: (input) {
                      if (input!.isEmpty || !(EmailValidator.validate(input))) {
                        return "Please enter valid Email";
                      }
                    }),
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
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Please enter valid Password";
                      }

                      if (input!.length < 8) {
                        return "Password should be greater than 8";
                      }
                    }),
                /* Padding(
                  padding: EdgeInsets.only(top: SizeConfig.height(context, 0.2)),
                  child: Center(
                    child: ButtonWidget(
                      onPressed: () {
                        login();
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDeviceScreen()));
                      },
                      title: "Login",
                      borderColor: Color(0xFFC8DE00),
                      innerColor: Color(0xFFC8DE00),
                      textColor: Color(0xFF000000),
                    ),
                  ),
                ), */
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.height(context, 0.2)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if(formkey.currentState!.validate()){
                        login();}
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDeviceScreen()));
                      },
                      child: Container(
                        height: SizeConfig.height(context, 0.075),
                        width: SizeConfig.width(context, 0.8),
                        margin: EdgeInsets.symmetric(
                            // horizontal: SizeConfig.width(context, 0.05),
                            //  vertical: SizeConfig.height(context, 0.1),
                            ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFC8DE00)),
                          color: Color(0xFFC8DE00),
                          borderRadius: BorderRadius.circular(
                            SizeConfig.width(context, 0.1),
                          ),
                        ),
                        child: Center(
                            child: loading ==false
                                ? Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.width(context, 0.05)),
                                  )
                                : CircularProgressIndicator(
                                    color: GlobalColors.whiteColor,
                                  )),
                      ),
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
                      title: "Forgot Password?",
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
      ),
    );
  }
}
