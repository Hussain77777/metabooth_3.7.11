import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final _colorNotifier = ValueNotifier<Color>(Colors.green);
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
          /*    if (index == 4) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Settings()));
          }*/
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
            _page == 3 || _page == 4 ? BoxWidget() : ColorWidget(context),
          ],
        )),
      ),
    );
  }

  Widget ColorWidget(BuildContext context) {
    return Container(
      height: SizeConfig.height(context, 0.70),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              SizeConfig.width(context, 0.2),
            ),
            topRight: Radius.circular(
              SizeConfig.width(context, 0.2),
            ),
          ),
        ),
/*      padding: EdgeInsets.only(
          left: SizeConfig.width(context, 0.06),
          top: SizeConfig.height(context, 0.02),
          right: SizeConfig.width(context, 0.04),
        ),*/
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
                  return InkWell(onTap: (){
                    setState(() {
                      tabList.forEach((element) {element.isSelected=false;});
                      tabList[index].isSelected=true;
                    });

                    },
                    child: Container(
                      height: SizeConfig.height(context, 0.07),
                      width: SizeConfig.width(context, 0.28),
                      decoration: BoxDecoration(
                        color: (tabList[index].isSelected)
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(color: Color(0xFF8A8A8A), width: 2),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.width(context, 0.04)),
                      ),
                      child: Center(
                          child: Text(
                        tabList[index].label ?? "",
                        style: TextStyle(color:(tabList[index].isSelected)?GlobalColors.yellowColor: Color(0xFF8A8A8A),),
                      )),
                    ),
                  );
                }),
              ),
            ),
            ColorPicker(
              pickerColor: Color(0xff443a49),
              paletteType: PaletteType.hueWheel,
              onColorChanged: (Color value) {},
            )
          ],
        ),
      ),
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
                    "MetaBooth Dj",
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
