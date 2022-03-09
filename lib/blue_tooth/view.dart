import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class BlueToothPage extends StatelessWidget {
  BlueToothLogic logic = Get.put(BlueToothLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('扫描设备'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                logic.scanDevice();
              },
            )
          ],
        ),
        body: Obx(() => ListView.separated(
              itemCount: logic.results.length,
              itemBuilder: (BuildContext context, int index) {
                var device = logic.results[index].device;
                return ListTile(
                  trailing: GestureDetector(
                    child: const Icon(Icons.bluetooth),
                    onTap: () {
                      Get.toNamed('/wifi', arguments: logic.results[index]);
                    },
                  ),
                  title: Text(
                      '设备名称: ${device.name.isEmpty ? '未知设备' : device.name}'),
                  subtitle: Text('设备地址: ${device.id}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )));
  }
}
