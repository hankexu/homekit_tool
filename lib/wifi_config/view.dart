import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:get/get.dart';

import 'logic.dart';

class WifiConfigPage extends StatelessWidget {
  final logic = Get.put(WifiConfigLogic());

  WifiConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScanResult result = Get.arguments;
    logic.connect(result);
    return GetBuilder<WifiConfigLogic>(
      assignId: true,
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('设备配网'),
          ),
          body: Container(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 8),
            child: Column(
              children: [
                Center(
                    child: Text(
                  '连接到设备: ${result.device.name}',
                )),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'SSID'),
                  controller: logic.ssidController,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'PASSWORD'),
                  controller: logic.passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
