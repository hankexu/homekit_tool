import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homekit/blue_tooth/view.dart';
import 'package:homekit/home/view.dart';
import 'package:homekit/manage/view.dart';
import 'package:homekit/setting/view.dart';
import 'package:homekit/weather/view.dart';
import 'package:homekit/wifi_config/view.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(name: '/home', page: () => HomePage()),
      GetPage(
        name: '/blue',
        page: () => BlueToothPage(),
      ),
      GetPage(
          name: '/wifi',
          page: () => WifiConfigPage(),
          transition: Transition.leftToRightWithFade),
      GetPage(name: '/weather', page: () => WeatherPage()),
      GetPage(name: '/file', page: () => ManagePage()),
      GetPage(name: '/setting', page: () => SettingPage())
    ],
  ));
}
