import 'package:flutter/material.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';

class ScanningDevice extends StatefulWidget {
  const ScanningDevice({super.key});

  @override
  State<ScanningDevice> createState() => _ScanningDeviceState();
}

class _ScanningDeviceState extends State<ScanningDevice> {
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
            child: Column(
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
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.height(context, 0.1)),
              child: CircularProgressIndicator(
                color: GlobalColors.whiteColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.height(context, 0.02)),
              child: Text(
                "Scanning...",
                style: TextStyle(
                    color: GlobalColors.whiteColor,
                    fontWeight: FontWeight.bold,
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
                style: TextStyle(
                  color: GlobalColors.whiteColor,
                  fontSize: SizeConfig.width(context, 0.03),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
