import 'dart:async';
import 'dart:convert' show utf8;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:metabooth/bluetooth_id_password.dart';

class BlueUI extends StatefulWidget {
  const BlueUI({super.key});

  @override
  State<BlueUI> createState() => _BlueUIState();
}

class _BlueUIState extends State<BlueUI> {
  BluetoothDevice? device;
  StreamSubscription<List<ScanResult>>? subscription;
  final StreamController<List<ScanResult>> controller =
      StreamController<List<ScanResult>>();
  List<ScanResult> result = [];

  bool isLoading=false;

  Future scanB() async {
    setState(() {
      isLoading=true;
    });
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 20))
        .then((value) => null);
    Set<DeviceIdentifier> seen = {};
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }

    subscription = FlutterBluePlus.scanResults.listen(
      (results) {
        print("hasssssssssssssssssssssssssssss ${results.length}");
        results.forEach((data) {
          if (data.device.name.contains("ESP")) {
            if (result.isEmpty) {
              result.add(data);
            } else {
              result.forEach((element) {
                if (element.device.name != data.device.name) {
                  result.add(data);
                }
              });
            }
          }
        });
      },
      // onError(e) => print(e);
    );
    Future.delayed(Duration(seconds: 3), () {
      print("after 3 Seconds ");
      setState(() {});
      subscription?.cancel();
      isLoading=false;
      setState(() {});
    });
  }

  List<BluetoothService>? services;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  BluetoothCharacteristic? targetCharacterstic;

  Stream<List<ScanResult>> get counterStream => controller.stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("conneeee"), actions: [
        TextButton(
            onPressed: () {
              scanB();
            },
            child: Text(
              "Scan",
              style: TextStyle(color: Colors.black),
            ))
      ]),
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

                  if (service.uuid.toString() ==
                      "4fafc201-1fb5-459e-8fcc-c5c9c331914b") {
                    service.characteristics.forEach((characteristics) {
                      if (characteristics.uuid.toString() ==
                          "930a6b92-43f9-11ee-be56-0242ac120002") {
                        targetCharacterstic = characteristics;
                        setState(() {});
                      }
                    });
                  }
                });
                List<int> bytes = utf8.encode("S:Virus;P:12345678");
                await targetCharacterstic?.write(bytes);
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
          ElevatedButton(onPressed: () async {}, child: Text("disconnect")),
          (isLoading)?CircularProgressIndicator(): Container(
            height: 500,
            color: Colors.red,
            width: double.infinity,
            child: ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    color: Colors.grey,
                    child: ListTile(
                      subtitle: ElevatedButton(
                        onPressed: () async {
                          print("indexxxxxxxxxxx $index");
                          await result[index].device?.connect();
                          result[index]
                              .device
                              .connectionState
                              .listen((BluetoothConnectionState state) async {
                            if (state ==
                                BluetoothConnectionState.disconnected) {}
                            if (state == BluetoothConnectionState.connected) {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>BluetoothIdPassword(device: result[index].device,)));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("device connected Successfully"),
                                ),
                              );
                              print("device connected Successfully");
                            }
                          });

// Connect to the device
                        },
                        child: Text("connect"),
                      ),
                      title: Text(
                        '${result[index].device.platformName}',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
