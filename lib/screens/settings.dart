import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/widgets/back_button_widget.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: SizeConfig.height(context, 0.04)),
        height: SizeConfig.height(context, 1),
        width: SizeConfig.width(context, 1),
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(
              GlobalColors.back_image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: SizeConfig.height(context, 0.1),
              ),
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: SizeConfig.width(context, 0.02)),
                      child: Text(
                        "AUTO CONNECT",
                        style: TextStyle(
                            color: Colors.white, fontSize: SizeConfig.width(context, 0.068)),
                      ),
                    ),
                    FlutterSwitch(
                        height: 25,
                        width: SizeConfig.width(context, 0.12),
                        activeText: "Avalaible",
                        inactiveText: "Away",
                        activeTextColor: Colors.black,
                        inactiveTextColor: Colors.black,
                        activeColor: GlobalColors.yellowColor,
                        inactiveColor:
                       Colors.blueGrey,
                        value: isSwitched,
                        onToggle: (value) async {
                          print(value);


                          setState(() {
                            isSwitched=value;
                            //   print("prefs.getBool('s')  ${prefs.getBool('s')}");

                          });
                        })
                  ],
                ),
              ),

              DividerWidget(context),
              titleWidget(context, "MANUAL"),
              DividerWidget(context),
              titleWidget(context, "TUTORIALS"),
              DividerWidget(context),
              titleWidget(context, "FAQ & HELPS"),
              DividerWidget(context),
              titleWidget(context, "ABOUT"),
              DividerWidget(context),
              titleWidget(context, "WEBSITE"),
              DividerWidget(context),
              Padding(
                padding:  EdgeInsets.only(top: SizeConfig.height(context,0.03)),
                child: Center(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Registered trademarks of ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: SizeConfig.width(context, 0.035),
                      ),
                    ),
                    TextSpan(
                      text: "Metabooth ",
                      style: TextStyle(
                        color: GlobalColors.yellowColor,
                        fontSize: SizeConfig.width(context, 0.035),
                      ),
                    ),
                    TextSpan(
                      text: "| 2023 ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: SizeConfig.width(context, 0.035),
                      ),
                    ),
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Center titleWidget(BuildContext context, String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: SizeConfig.width(context, 0.068)),
      ),
    );
  }

  Padding DividerWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.height(context, 0.01),
          horizontal: SizeConfig.width(context, 0.06)),
      child: Divider(
        color: Colors.grey,
        thickness: 2,
      ),
    );
  }
}
