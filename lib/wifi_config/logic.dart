import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:get/get.dart';

Uint8List encode(String s) {
  var encodedString = utf8.encode(s);
  var encodedLength = encodedString.length;
  var data = ByteData(encodedLength + 4);
  data.setUint32(0, encodedLength, Endian.big);
  var bytes = data.buffer.asUint8List();
  bytes.setRange(4, encodedLength + 4, encodedString);
  return bytes;
}

class WifiConfigLogic extends GetxController {
  final ssidController = TextEditingController();
  final passwordController = TextEditingController();
  late ScanResult _result;

  void connect(ScanResult result) async {
    _result = result;
    await _result.device.connect();
    await write();
  }

  Future<void> write() async {
    List<BluetoothService> services = await _result.device.discoverServices();

    for (BluetoothService value in services) {
      printInfo(info: '$value');
    }
  }

  void disconnect() {
    _result.device.disconnect();
  }

  @override
  void onClose() {
    super.onClose();
    disconnect();
  }
}
