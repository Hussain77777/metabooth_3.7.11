import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: _page == 0 ? Colors.black : Colors.white,
          ),
          Icon(Icons.message,
              size: 30, color: _page == 1 ? Colors.black : Colors.white),
          Icon(Icons.compare_arrows,
              size: 30, color: _page == 2 ? Colors.black : Colors.white),
          Icon(Icons.person,
              size: 30, color: _page == 3 ? Colors.black : Colors.white),
          Icon(Icons.settings,
              size: 30, color: _page == 4 ? Colors.black : Colors.white),
        ],
        color: Color(0xFF161616),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          print("indexxx $index");
          setState(() {
            _page = index;
          });
          if(index==4){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Settings()));
          }
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
                "assets/metabooth.png",width: SizeConfig.width(context, 0.3),
              ),
            ),

            _page == 3 ? BoxWidget() : ColorWidget(context),
          ],
        )),
      ),
    );
  }

  Padding ColorWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.width(context, 0.06),
        top: SizeConfig.height(context, 0.02),
        right: SizeConfig.width(context, 0.04),
      ),
      child: ValueListenableBuilder<Color>(
        valueListenable: _colorNotifier,
        builder: (_, color, __) {
          return ColorPicker(
            initialPicker: Picker.paletteSaturation,
            pickerOrientation: PickerOrientation.inherit,
            color: color,
            onChanged: (value) => color = value,
          );
        },
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
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,childAspectRatio: 1.1,
              mainAxisSpacing: SizeConfig.height(context, 0.03),
              crossAxisSpacing: SizeConfig.width(context, 0.03)),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/box.png"),
                ),

              ),child: ListTile(

              title: Text(
                "MetaBooth Dj",
                style: TextStyle(
                    color: GlobalColors.whiteColor,
                    fontSize: SizeConfig.width(context, 0.028),
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Online",
                style: TextStyle(
                    color: GlobalColors.yellowColor,
                    fontSize: SizeConfig.width(context, 0.025),
                    fontWeight: FontWeight.bold),
              ),
            ),
            );
          }),
    );
  }
}
