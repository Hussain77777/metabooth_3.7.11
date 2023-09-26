import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:metabooth/constants/colors.dart';
import 'package:metabooth/constants/size_config.dart';
import 'package:metabooth/screens/settings.dart';

class ColorPickerScreen extends StatefulWidget {
  const ColorPickerScreen({super.key});

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  int _page = 2;
  List<int> colorList = [];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  //final _colorNotifier =
  late ValueNotifier<Color> colornotifier;
  List<Tabs> tabList = [
    Tabs(
      label: "Color Picker",
      isSelected: true,
    ),
    Tabs(
      label: "White Balance",
      isSelected: false,
    ),
    Tabs(
      label: "favorites",
      isSelected: false,
    ),
  ];

  bool isSwitched = true;

  String? colorValue;
  Color? color1=Color(0xFFFFFFFF);

  bool isSelectedColor = false;

  double rating = 10.0;
  double setting = 10.0;

  int? colorint;

  void initState() {
    colornotifier = ValueNotifier<Color>(Colors.green);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 75.0,
        items: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.height(context, 0.02)),
            child: Image.asset("assets/home.png",
                width: SizeConfig.width(context, 0.08)),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.height(context, 0.02)),
            child: _page == 1
                ? Image.asset("assets/yellow_bulb.png",
                    width: SizeConfig.width(context, 0.08))
                : Image.asset("assets/bulb.png",
                    width: SizeConfig.width(context, 0.08)),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.height(context, 0.02)),
            child: Image.asset("assets/small_logo.png",
                width: SizeConfig.width(context, 0.08)),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.height(context, 0.02)),
            child: _page == 3
                ? Image.asset("assets/yellow_star.png",
                    width: SizeConfig.width(context, 0.08))
                : Image.asset("assets/star.png",
                    width: SizeConfig.width(context, 0.08)),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.height(context, 0.02)),
            child: _page == 4
                ? Image.asset("assets/yellow_song.png",
                    width: SizeConfig.width(context, 0.08))
                : Image.asset("assets/song.png",
                    width: SizeConfig.width(context, 0.08)),
          ),
        ],
        color: Color(0xFF161616),
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          print("indexxx $index");
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
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
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.width(context, 0.06),
                    top: SizeConfig.height(context, 0.02),
                    right: SizeConfig.width(context, 0.04),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: SizeConfig.width(context, 0.05),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.width(context, 0.03)),
                              child: Text(
                                "Back",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.width(context, 0.035)),
                              ),
                            )
                          ],
                        ),
                      ),
                      IconsWidget(context)
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.height(context, 0.03),
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
                _page == 3 || _page == 4 ? BoxWidget() : ColorWidget(context),
              ],
            )),
      ),
    );
  }

  Widget ColorWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.height(context, 0.02),
            //    bottom: SizeConfig.height(context, 0.01)
          ),
          child: RichText(
            text: TextSpan(
              text: '',
              //   style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: "MetaBooth",
                  style: TextStyle(
                    height: 0.1,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -2.5,
                    fontFamily: "Inter",
                    color: GlobalColors.whiteColor,
                    fontSize: SizeConfig.width(context, 0.1),
                  ),
                ),
                TextSpan(
                  text: " DJ",
                  style: TextStyle(
                    letterSpacing: -2.5,
                    color: GlobalColors.yellowColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    fontSize: SizeConfig.width(context, 0.1),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: SizeConfig.height(context, 0.05),
          width: SizeConfig.width(context, 0.55),
          //     color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Online",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 0.1,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                  color: GlobalColors.yellowColor,
                  fontSize: SizeConfig.width(context, 0.03),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: SizeConfig.height(context, 0.002),
                width: SizeConfig.width(context, 0.25),
                color: Colors.white,
              ),
              FlutterSwitch(
                  height: 18,
                  width: SizeConfig.width(context, 0.12),
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
            ],
          ),
        ),
        Container(
          height: SizeConfig.height(context, 0.70),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  SizeConfig.width(context, 0.1),
                ),
                topRight: Radius.circular(
                  SizeConfig.width(context, 0.1),
                ),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.width(
                        context,
                        0.05,
                      ),
                      right: SizeConfig.width(
                        context,
                        0.05,
                      ),
                      top: SizeConfig.height(context, 0.05)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) {
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
                          height: SizeConfig.height(context, 0.07),
                          width: SizeConfig.width(context, 0.28),
                          decoration: BoxDecoration(
                            color: (tabList[index].isSelected)
                                ? Color(0xFF0E0E0E)
                                : Colors.white,
                            border: Border.all(
                                color: (tabList[index].isSelected)
                                    ? Color(0xFFC8DE00)
                                    : Color(0xFF8A8A8A),
                                width: 2),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.width(context, 0.04)),
                          ),
                          child: Center(
                              child: Text(
                            tabList[index].label ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter",
                              color: (tabList[index].isSelected)
                                  ? Color(0xFFC8DE00)
                                  : Color(0xFF8A8A8A),
                            ),
                          )),
                        ),
                      );
                    }),
                  ),
                ),
                tabList.last.isSelected
                    ? Container(
                        //color: Colors.red,
                        height: SizeConfig.height(context, 0.40),
                        margin: EdgeInsets.only(
                          left: SizeConfig.width(
                            context,
                            0.05,
                          ),
                          right: SizeConfig.width(
                            context,
                            0.05,
                          ),
                          //    top: SizeConfig.height(context, 0.05)
                        ),
                        child: colorList.isEmpty
                            ? Container()
                            : GridView.builder(
                                itemCount: colorList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing:
                                      SizeConfig.width(context, 0.02),
                                  mainAxisSpacing:
                                      SizeConfig.height(context, 0.02),
                                  crossAxisCount: 5,
                                  childAspectRatio: 1.0,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(colorList[index]),
                                      border: Border.all(
                                          color: Color(
                                            0xFFECECEC,
                                          ),
                                          width: 4),
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.width(context, 0.1)),
                                    ),
                                  );
                                }),
                      )
                    :ColorPicker(
                  onHsvColorChanged: (color) {
                    print("colorValue2222 ${color.toColor()}");
                    //    setState(() {});
                  },
                  // displayThumbColor: false,
                  enableAlpha: false,
                  showLabel: true,
                  //progress: 0.97,
                  pickerColor: Color(0xff443a49),
                  paletteType: PaletteType.hueWheel,
                  progressslider: 0.95,
                  onColorChanged: (Color value) {
/*
                          var colorValue1 = value.toString().split("(");
                          print("colorValue1  ${colorValue1[1]}");
                          var colorValue2 =
                              colorValue1[1].toString().split(")");
                         */
                    color1 = value;
                    //  setState(() {
                    colornotifier.value=value;
                    color1 = value;
                    colorint = value.value;
                    // });
                    print("colorValue2 ${color1}");
                  },
                ),

                tabList.last.isSelected
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.width(
                            context,
                            0.05,
                          ),
                          right: SizeConfig.width(
                            context,
                            0.05,
                          ),
                          //    top: SizeConfig.height(context, 0.05)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ValueListenableBuilder(
                                valueListenable: colornotifier,
                                builder: (context, value, child) => Text(
                                  color1.toString() ?? "",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: SizeConfig.width(context, 0.03),
                                    fontWeight: isSelectedColor
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSelectedColor
                                        ? Color(0xFF5F3CFF)
                                        : Colors.red,
                                  ),
                                ))
                            ,
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    colorList.add(colorint ?? 0);
                                    isSelectedColor = !isSelectedColor;
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: isSelectedColor
                                      ? Color(0xFF5F3CFF)
                                      : Colors.red,
                                )),
                          ],
                        ),
                      ),
                
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.width(
                      context,
                      0.05,
                    ),
                    right: SizeConfig.width(
                      context,
                      0.05,
                    ),
                    //    top: SizeConfig.height(context, 0.05)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/bright.png",
                        width: SizeConfig.width(context, 0.08),
                      ),
                      Slider.adaptive(
                          min: 10,
                          max: 100,
                          inactiveColor: Color(0xFFE3E3E3),
                          activeColor: Colors.black,
                          thumbColor: Colors.black,
                          value: rating,
                          onChanged: (newrating) {
                            print("newratin ${newrating}");
                            setState(() {
                              rating = newrating;
                            });
                          }),
                      Text(
                        "${rating.toStringAsFixed(0) ?? ""}%",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.width(context, 0.04),
                            fontFamily: "Inter"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.width(
                      context,
                      0.05,
                    ),
                    right: SizeConfig.width(
                      context,
                      0.05,
                    ),
                    //    top: SizeConfig.height(context, 0.05)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/img_3.png",
                        width: SizeConfig.width(context, 0.08),
                      ),
                      Slider.adaptive(
                          inactiveColor: Color(0xFFE3E3E3),
                          min: 10,
                          max: 100,
                          activeColor: Colors.black,
                          thumbColor: Colors.black,
                          value: setting,
                          onChanged: (newrating) {
                            print("newratin ${newrating}");
                            setState(() {
                              setting = newrating;
                            });
                          }),
                      Text(
                        "${setting.toStringAsFixed(0) ?? ""}%",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.width(context, 0.04),
                            fontFamily: "Inter"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding IconsWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.width(context, 0.00)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: SizeConfig.width(context, 0.03)),
            height: SizeConfig.height(context, 0.04),
            width: SizeConfig.width(context, 0.08),
            decoration: BoxDecoration(

                //color: Colors.red,
                ),
            child: Icon(
              Icons.list,
              color: GlobalColors.yellowColor,
              size: SizeConfig.width(context, 0.08),
            ),
          ),
        ],
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height(context, 0.7),
      margin: EdgeInsets.only(
        left: SizeConfig.width(context, 0.06),
        top: SizeConfig.height(context, 0.02),
        right: SizeConfig.width(context, 0.04),
      ),
      //    color: Colors.red,
      child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: SizeConfig.height(context, 0.03),
              crossAxisSpacing: SizeConfig.width(context, 0.03)),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/box.png"),
                ),
              ),
              child: Center(
                child: ListTile(
                  title: Text(
                    "MetaBooth DJ",
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: GlobalColors.whiteColor,
                        fontSize: SizeConfig.width(context, 0.028),
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "Online",
                    style: TextStyle(
                        fontFamily: "Inter",
                        color: GlobalColors.yellowColor,
                        fontSize: SizeConfig.width(context, 0.025),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Tabs {
  final String? label;
  bool isSelected = false;

  Tabs({this.label, required this.isSelected});
}
