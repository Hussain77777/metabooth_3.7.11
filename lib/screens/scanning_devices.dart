import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/screens/all_devices_screen.dart';

class ScanningDevice extends StatefulWidget {
  ScanningDevice({super.key});

  @override
  State<ScanningDevice> createState() => _ScanningDeviceState();
}

class _ScanningDeviceState extends State<ScanningDevice> {
  bool isSwitched=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: SizeConfig.height(context, 0.04)),
        height: SizeConfig.height(context, 1),
        width: SizeConfig.width(context, 1),
        decoration: BoxDecoration(color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage(
                GlobalColors.back_image,
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
            child: Column(
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
                      top: SizeConfig.height(context, 0.1)),
                  child: CircularProgressIndicator(
                    color: GlobalColors.whiteColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.height(context, 0.02)),
                  child: Text(
                    "Scanning...",
                    style: TextStyle(fontFamily: "Inter",
                        color: GlobalColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.width(context, 0.05)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.height(context, 0.02),
                    left: SizeConfig.width(context, 0.1),
                    right: SizeConfig.width(context, 0.1),
                  ),
                  child: Text(
                    "Make sure the device is plugged in and near your phone or on the same network as your phone.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "Inter",
                      color: GlobalColors.whiteColor,
                      fontWeight: FontWeight.normal,
                      fontSize: SizeConfig.width(context, 0.03),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => AllDevicesScreen()));
                },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.height(context, 0.02),
                      // left: SizeConfig.width(context, 0.1),
                      // right: SizeConfig.width(context, 0.1),
                    ),
                    height: SizeConfig.height(context, 0.15),
                    width: SizeConfig.width(context, 0.8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img_1.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          trailing:      Container(
                            margin: EdgeInsets.only(
                              right: SizeConfig.width(context, 0.03),
                              bottom: SizeConfig.height(context, 0.01),
                            ),
                            height: SizeConfig.height(context, 0.040),
                            width: SizeConfig.width(context, 0.1),
                            child: FlutterSwitch(
                                height: 20,
                                width: SizeConfig.width(context, 0.15),
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
                                }),
                          ),
                          title: Text(
                            "Metabooth DJ",
                            style: TextStyle(
                                color: GlobalColors.whiteColor,fontFamily: "Inter",
                                fontSize: SizeConfig.width(context, 0.035),
                                fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(
                            "Online",
                            style: TextStyle(fontFamily: "Inter",

                                color: GlobalColors.yellowColor,
                                fontSize: SizeConfig.width(context, 0.025),
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
