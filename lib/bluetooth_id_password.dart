import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:metabooth/widgets/textfield_widget.dart';

class BluetoothIdPassword extends StatefulWidget {
  const BluetoothIdPassword({super.key, required this.device});

  final BluetoothDevice device;

  @override
  State<BluetoothIdPassword> createState() => _BluetoothIdPasswordState();
}

class _BluetoothIdPasswordState extends State<BluetoothIdPassword> {
  var ssidController=TextEditingController();
  var passwordController=TextEditingController();
  List<BluetoothService>? services;
  BluetoothCharacteristic? targetCharacterstic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [          SizedBox(height: 200,),
            NewTextFieldWidget(
                controller: ssidController,
                isPassword: false,
                validator: (input) {
                  if (input!.isEmpty ) {
                    return "Please enter valid input";
                  }
                }),
            SizedBox(height: 100,),
            NewTextFieldWidget(
                controller: passwordController,
                isPassword: false,
                validator: (input) {
                  if (input!.isEmpty ) {
                    return "Please enter valid password";
                  }
                }), SizedBox(height: 100,),
            ElevatedButton(
                onPressed: () async {
                  services = await widget.device.discoverServices();

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
                  List<int> bytes = utf8.encode("S:${ssidController.text};P:${passwordController.text}");
                  await targetCharacterstic?.write(bytes);
                },
                child: Text("connect")),
          ],
        ),
      ),
    );
  }
}
