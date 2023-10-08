import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

//import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:get/get.dart';
import 'package:metabooth/bluetooth.dart';
import 'package:metabooth/screens/add_device_screen.dart';
import 'package:metabooth/screens/color.dart';
import 'package:metabooth/screens/color_picker_screen.dart';
import 'package:metabooth/screens/splash_screen.dart';
import 'package:metabooth/screens/welocme_screen.dart';
import 'package:metabooth/screens/login_or_register_screen.dart';
import 'package:metabooth/screens/login_screen.dart';
import 'package:metabooth/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';

import 'screens/settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlueUI(),
    );
  }
}

class ScanBle extends StatefulWidget {
  const ScanBle({super.key});

  @override
  State<ScanBle> createState() => _ScanBleState();
}

class _ScanBleState extends State<ScanBle> {
  // final flutterReactiveBle = FlutterReactiveBle();
  //StreamSubscription<DiscoveredDevice>? _scanStream;

  //StreamController<DiscoveredDevice>? _dataStreamController1;

  Future scanB() async {
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 20))
        .then((value) => null);
    Set<DeviceIdentifier> seen = {};

    var subscription = FlutterBluePlus.scanResults.listen(
      (results) {
        print("hasssssssssssssssssssssssssssss ${results.length}");
        for (ScanResult r in results) {
          if (seen.contains(r.device.remoteId) == false) {
            print("name ${r.device.name}");
            print("name ${r.device.connectionState}");
            print("name ${r.device.servicesList}");
            print("name ${r.advertisementData}");
            print(
                '${r.device.remoteId}: "${r.advertisementData.localName}" found! rssi: ${r.rssi}');
            seen.add(r.device.remoteId);
          }
        }
      },
      // onError(e) => print(e);
    );

    /*var status = await Permission.bluetooth.status;

      print("aaaaaaaaaaaaaaaaaaa11 ");

      print("aaaaaaaaaaaaaaaaaaa 11");
      Future.delayed(Duration(seconds: 5), () {
        _scanStream = flutterReactiveBle.scanForDevices(
            withServices: [], scanMode: ScanMode.lowLatency).listen(
          (device) {
            print("device.name ${device.name}");
            print("device.serviceUuids ${device.serviceUuids}");
            print("device.manufacturerData ${device.manufacturerData}");
            print("device.id ${device.id}");
            print("device.connectable.name ${device.connectable.name}");

            disc.add(device);
            print("_dataStream?.length ${disc.length}");
            //code for handling results
          },
        );
      });*/

    print("after 2 Seconds ");
  }

  // List<DiscoveredDevice> disc = [];
  // StreamController<DiscoveredDevice>? _dataStreamController;
  // Stream<DiscoveredDevice>? _dataStream;

  @override
  void initState() {
    scanB();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                /*      flutterReactiveBle.connectToDevice(
              id: "7C:9E:BD:F8:6B:4E",
              servicesWithCharacteristicsToDiscover: {},
              connectionTimeout: const Duration(seconds: 2),
            ).listen((connectionState) {
              print("connectionState ${connectionState.deviceId}");
              print("connectionState ${connectionState.failure}");
              print("connectionState ${connectionState.connectionState}");
              // Handle connection state updates
            }, onError: (Object error) {
              // Handle a possible error
            });*/
              },
              child: Text("connect")),
          /*   Container(
            height: 500,
            color: Colors.red,
            child: ListView.builder(
                itemCount: disc.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${disc[index].name}"),
                    subtitle: Text("${disc[index].id}"),
                  );
                }),
          ),*/
        ],
      ),
    );
  }
}
