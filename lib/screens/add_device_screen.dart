import 'package:flutter/material.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/screens/scanning_devices.dart';

class AddDeviceScreen extends StatefulWidget {
  const AddDeviceScreen({super.key});

  @override
  State<AddDeviceScreen> createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
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
                GlobalColors.back_image,
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
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScanningDevice()));
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.height(context, 0.3),
                  bottom: SizeConfig.height(context, 0.04),
                ),
                height: SizeConfig.height(context, 0.1),
                width: SizeConfig.width(context, 0.22),
                decoration: BoxDecoration(
                    //    color: Colors.red,
                    border: Border.all(color: Color(0xFF494949), width: 5),
                    borderRadius:
                        BorderRadius.circular(SizeConfig.width(context, 0.6))),
                child: Icon(
                  Icons.add,
                  color: GlobalColors.yellowColor,
                  size: SizeConfig.width(context, 0.1),
                ),
              ),
            ),
            Text(
              "Add Your devices",
              style: TextStyle(
                  color: GlobalColors.whiteColor,
                  fontSize: SizeConfig.width(context, 0.07),
                  fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}
