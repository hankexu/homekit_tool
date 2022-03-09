import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class BlueToothLogic extends GetxController {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  RxList<ScanResult> results = List<ScanResult>.from([]).obs;

  void scanDevice() async {
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    results.clear();
    var subscription = flutterBlue.scanResults.listen((_results) {
      for (ScanResult r in _results) {
        if (!results.contains(r)) {
          results.add(r);
        }
      }
      printInfo(info: 'length: ${results.length}');
    });
// Stop scanning
    flutterBlue.stopScan();
  }
}
