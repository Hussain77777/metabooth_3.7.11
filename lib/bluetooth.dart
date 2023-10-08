import 'dart:async';
import 'dart:convert'show utf8;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  //FlutterBluePlus flutterBluePlus = FlutterBluePlus();

  Future scanDevice() async {
    // Setup Listener for scan results.
// device not found? see "Common Problems" in the README
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 20))
        .then((value) => null);
    Set<DeviceIdentifier> seen = {};

    var subscription = FlutterBluePlus.scanResults.listen(
      (results) {
        print("hasssssssssssssssssssssssssssss ${results.length}");
        for (ScanResult r in results) {
          if (seen.contains(r.device.remoteId) == false) {
            print(
                '${r.device.remoteId}: "${r.advertisementData.localName}" found! rssi: ${r.rssi}');
            seen.add(r.device.remoteId);
          }
        }
      },
      // onError(e) => print(e);
    );

// Start scanning

// Stop scanning
    await FlutterBluePlus.stopScan();

    /*   FlutterBluePlus.startScan(timeout: Duration(seconds: 5));
    print("flutter blue result ${FlutterBluePlus.scanResults.length}");
    FlutterBluePlus.stopScan();*/
  }

  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;
}

class BlueUI extends StatefulWidget {
  const BlueUI({super.key});

  @override
  State<BlueUI> createState() => _BlueUIState();
}

class _BlueUIState extends State<BlueUI> {
  BluetoothDevice? device;
  StreamSubscription<List<ScanResult>>? subscription;

  Future scanB() async {
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 20))
        .then((value) => null);
    Set<DeviceIdentifier> seen = {};
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }

    subscription = FlutterBluePlus.scanResults.listen(
      (results) {
        print("hasssssssssssssssssssssssssssss ${results.length}");

        for (ScanResult r in results) {
          if (seen.contains(r.device.remoteId) == false) {
            if (r.device.name == "ESP32-PROJECT-LED") {
              device = r.device;
              setState(() {});
              print("inside condition");
            }

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

    print("after 2 Seconds ");
  }

  List<BluetoothService>? services;

  @override
  void initState() {
    scanB();
    // TODO: implement initState
    super.initState();
  }

  BluetoothCharacteristic? targetCharacterstic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("data  ${device?.name}"),
          ElevatedButton(
              onPressed: () async {
                device?.connectionState
                    .listen((BluetoothConnectionState state) async {
                  if (state == BluetoothConnectionState.disconnected) {
                    // 1. typically, start a periodic timer that tries to
                    //    periodically reconnect, or just call connect() again right now
                    // 2. you must always re-discover services after disconnection!
                    // 3. you should cancel subscriptions to all characteristics you listened to
                  }
                  if (state == BluetoothConnectionState.connected) {
                    print("device connected Successfully");
                  }
                });

// Connect to the device
                await device?.connect();

              },
              child: Text("connect")),

          ElevatedButton(
              onPressed: () async {
                services = await device?.discoverServices();

                services?.forEach((service) async {
                  print("service ${service.characteristics}");

                  if (service.uuid.toString() == "4fafc201-1fb5-459e-8fcc-c5c9c331914b") {
                    service.characteristics.forEach((characteristics) {
                      if (characteristics.uuid.toString() == "930a6b92-43f9-11ee-be56-0242ac120002") {
                        targetCharacterstic = characteristics;
                        setState(() {});
                      }
                    });
                  }

                });
                List<int>bytes=utf8.encode("SSID:Virus;PASSWORD:12345678");
               await targetCharacterstic
                    ?.write(bytes);
              },
              child: Text("send data")),
          ElevatedButton(
              onPressed: () async {
                device?.connectionState
                    .listen((BluetoothConnectionState state) async {
                  if (state == BluetoothConnectionState.disconnected) {
                    print("device disconnected Successfully");
                    // 1. typically, start a periodic timer that tries to
                    //    periodically reconnect, or just call connect() again right now
                    // 2. you must always re-discover services after disconnection!
                    // 3. you should cancel subscriptions to all characteristics you listened to
                  }
                  if (state == BluetoothConnectionState.connected) {
                    print("device connected Successfully");
                  }
                });

// Connect to the device
                await device?.disconnect();
              },
              child: Text("disconnect")),
          ElevatedButton(
              onPressed: () async {
// Reads all characteristics
                /*   var characteristics = service.characteristics;
                for(BluetoothCharacteristic c in characteristics) {
                  List<int> value = await c.read();
                  print(value);
                }*/

// Writes to a characteristic
              },
              child: Text("disconnect")),
        ],
      ),
    );
  }
}
