import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:metabooth/screens/add_device_screen.dart';
import 'package:metabooth/widgets/back_button_widget.dart';
import 'package:metabooth/widgets/button_widget.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/widgets/main_tiitle_widget.dart';
import 'package:metabooth/widgets/register_button_widget.dart';
import 'package:metabooth/widgets/textfield_widget.dart';

import 'all_devices_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  var databaseRef = FirebaseDatabase.instance.ref("Users");

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
          // physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: formkey,
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
                      "assets/metabooth.png",
                      width: SizeConfig.width(context, 0.3),
                    ),
                  ),
                ),
                BackButtonWidget(),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.height(context, 0.06),
                      left: SizeConfig.width(context, 0.1),
                      right: SizeConfig.width(context, 0.15)),
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      //   style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: "Create an  ",
                          style: TextStyle(height: 0.1,
                            fontWeight: FontWeight.w500,letterSpacing: -2.5,
                            fontFamily: "Inter",
                            color: GlobalColors.whiteColor,
                            fontSize: SizeConfig.width(context, 0.11),
                          ),
                        ),
                        TextSpan(
                          text: "Account.",
                          style: TextStyle(letterSpacing: -2.5,
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
                  padding:  EdgeInsets.only(right: SizeConfig.width(context,0.38)),
                  child: SubTitleWidget(
                      subTitleFontWeight: FontWeight.w300,
                      titleFontWeight: FontWeight.w300,
                      title: "Enter your account details below to",
                      subTitle: " register."),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.height(context, 0.015),
                      top: SizeConfig.height(context, 0.04)),
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
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Please enter valid Name";
                      }
                    }),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.height(context, 0.015),
                      top: SizeConfig.height(context, 0.015)),
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
                /*    Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.height(context, 0.08)),
                  child: Center(
                    child: ButtonWidget(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          register();
                        }
                      },
                      title: "Register",
                      borderColor: Color(0xFFC8DE00),
                      innerColor: Color(0xFFC8DE00),
                      textColor: Color(0xFF000000),
                    ),
                  ),
                ),*/
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.height(context, 0.08)),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          register();
                        }
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
                            child: loading == false
                                ? Text(
                                    "Register",
                                    style: TextStyle(fontFamily: "Inter",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
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
                  padding:
                      EdgeInsets.only(top: SizeConfig.height(context, 0.02)),
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
      ),
    );
  }

  void register() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      databaseRef.child(_auth.currentUser?.uid ?? "id not found").set({
        "user_id": _auth.currentUser?.uid ?? "id not found",
        "user_email": _auth.currentUser?.email,
      });
      setState(() {
        //  nameController.clear();
        emailController.clear();
        passwordController.clear();
        //macController.clear();
        loading = false;
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AddDeviceScreen()),
          (route) => false);
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }
}
