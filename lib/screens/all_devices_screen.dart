import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/screens/add_group.dart';
import 'package:metabooth/screens/color_picker_screen.dart';

class AllDevicesScreen extends StatefulWidget {
  const AllDevicesScreen({super.key});

  @override
  State<AllDevicesScreen> createState() => _AllDevicesScreenState();
}

class _AllDevicesScreenState extends State<AllDevicesScreen> {
  List<Tabs> tabList = [
    Tabs(label: "Devices", isSelected: true),
    Tabs(label: "Groups", isSelected: false),
  ];
  List<String> groupImageList = [
    "assets/img.png",
  ];
  List<String> imageList = [
    "assets/small_square_metabooth.png",
    "assets/small_square_metacube.png",
    "assets/small_square_metaTube.png"
  ];
  List<String> nameList = [
    "metaBooth",
    "metaCube",
    "metaTube",
  ];
  List<String> statusList = [
    "Online",
    "Offline",
    "Online",
  ];
  List<String> statusImageList = [
    "assets/on_button.png",
    "assets/off_button.png",
    "assets/on_button.png",
  ];

  bool isAddDevices = false;

  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: SizeConfig.height(context, 0.04),
        ),
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
          child: Stack(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TabsWidget(context),
                      IconsWidget(context),
                    ],
                  ),
                  tabList.first.isSelected ?? false
                      ? devicesWidget(context)
                      : groupsWidget(context)
                ],
              ),
              (isAddDevices)
                  ? Positioned(
                      left: SizeConfig.width(context, 0.2),
                      // top: SizeConfig.height(context, 0.6),
                      bottom: 0,
                      child: Container(
                        height: SizeConfig.height(context, 0.12),
                        decoration: BoxDecoration(
                          //            color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage("assets/add_new_device.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: SizeConfig.height(context, 0.08),
                              //   color: Colors.yellow,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: SizeConfig.height(context, 0.08),
                                    width: SizeConfig.width(context, 0.3),
                                    //  color: Colors.blue,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: SizeConfig.height(
                                                  context, 0.01)),
                                          child: Image.asset(
                                            "assets/add_icon.png",
                                            width:
                                                SizeConfig.width(context, 0.07),
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: '',
                                            //   style: DefaultTextStyle.of(context).style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: "Add",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Inter",
                                                  color:
                                                      GlobalColors.whiteColor,
                                                  fontSize: SizeConfig.width(
                                                      context, 0.035),
                                                ),
                                              ),
                                              TextSpan(
                                                text: " Device",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Inter",
                                                  color:
                                                      GlobalColors.yellowColor,
                                                  //   fontWeight: FontWeight.bold,

                                                  fontSize: SizeConfig.width(
                                                      context, 0.035),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddGroup()));
                                    },
                                    child: Container(
                                      height: SizeConfig.height(context, 0.08),
                                      width: SizeConfig.width(context, 0.3),
                                      //  color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: SizeConfig.height(
                                                    context, 0.01)),
                                            child: Image.asset(
                                              "assets/add_group.png",
                                              width: SizeConfig.width(
                                                  context, 0.07),
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: '',
                                              //   style: DefaultTextStyle.of(context).style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: "New",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "Inter",
                                                    color:
                                                        GlobalColors.whiteColor,
                                                    fontSize: SizeConfig.width(
                                                        context, 0.035),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " Group",
                                                  style: TextStyle(
                                                    color: GlobalColors
                                                        .yellowColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "Inter",
                                                    fontSize: SizeConfig.width(
                                                        context, 0.035),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Text(
                                "x",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.width(context, 0.05)),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Container devicesWidget(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(
        left: SizeConfig.width(context, 0.06),
        right: SizeConfig.width(context, 0.06),
      ),
      height: SizeConfig.height(context, 0.7), //  color: Colors.red,
      child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          primary: true,
          /*       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              crossAxisSpacing: SizeConfig.width(context, 0.05),
              mainAxisSpacing: SizeConfig.height(context, 0.03)),*/
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ColorPickerScreen()));
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
                      image: AssetImage("assets/img_1.png"), fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      trailing: Container(
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
                            inactiveColor: Colors.blueGrey,
                            value: isSwitched,
                            onToggle: (value) async {
                              print(value);

                              setState(() {
                                isSwitched = value;
                                //   print("prefs.getBool('s')  ${prefs.getBool('s')}");
                              });
                            }),
                      ),
                      title: Text(
                        "Metabooth",
                        style: TextStyle(
                            color: GlobalColors.whiteColor,
                            fontSize: SizeConfig.width(context, 0.035),
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Online",
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: GlobalColors.yellowColor,
                            fontSize: SizeConfig.width(context, 0.03),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Container groupsWidget(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(
        left: SizeConfig.width(context, 0.06),
        right: SizeConfig.width(context, 0.06),
      ),
      height: SizeConfig.height(context, 0.7), //  color: Colors.red,
      child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          primary: true,
          /*       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              crossAxisSpacing: SizeConfig.width(context, 0.05),
              mainAxisSpacing: SizeConfig.height(context, 0.03)),*/
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ColorPickerScreen()));
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
                      image: AssetImage("assets/img.png"), fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      trailing: Container(
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
                            inactiveColor: Colors.blueGrey,
                            value: isSwitched,
                            onToggle: (value) async {
                              print(value);

                              setState(() {
                                isSwitched = value;
                                //   print("prefs.getBool('s')  ${prefs.getBool('s')}");
                              });
                            }),
                      ),
                      title: Text(
                        "Events Lights",
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: GlobalColors.whiteColor,
                            fontSize: SizeConfig.width(context, 0.03),
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        "Online",
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: GlobalColors.yellowColor,
                            fontSize: SizeConfig.width(context, 0.03),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Padding IconsWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.width(context, 0.06)),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isAddDevices = !isAddDevices;
              });
            },
            child: Container(
              height: SizeConfig.height(context, 0.04),
              width: SizeConfig.width(context, 0.08),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.width(context, 0.1)),
                border: Border.all(
                    color:
                        !isAddDevices ? Colors.grey : GlobalColors.yellowColor),
                //color: Colors.red,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: SizeConfig.width(context, 0.05),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: SizeConfig.width(context, 0.03)),
            height: SizeConfig.height(context, 0.04),
            width: SizeConfig.width(context, 0.08),
            decoration: BoxDecoration(

                //color: Colors.red,
                ),
            child: Icon(
              Icons.list,
              color: Colors.white,
              size: SizeConfig.width(context, 0.08),
            ),
          ),
        ],
      ),
    );
  }

  Row TabsWidget(BuildContext context) {
    return Row(
      children: List.generate(tabList.length, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              tabList.forEach((element) {
                element.isSelected = false;
              });
              tabList[index].isSelected = true;
            });
          },
          child: Container(
            margin: EdgeInsets.only(
              top: SizeConfig.height(context, 0.03),
              left: SizeConfig.width(context, 0.06),
              right: SizeConfig.width(context, 0.01),
            ),
            padding: EdgeInsets.only(
              bottom: SizeConfig.height(context, 0.01),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: tabList[index].isSelected ?? false
                    ? BorderSide(color: GlobalColors.yellowColor)
                    : BorderSide(
                        color: Colors.transparent,
                      ),
              ),
            ),
            child: Text(
              tabList[index].label,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: SizeConfig.width(context, 0.04),
                color: Colors.white70,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class Tabs {
  String label;
  bool? isSelected;

  Tabs({
    required this.label,
    required this.isSelected,
  });
}
