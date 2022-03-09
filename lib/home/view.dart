import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Menu {
  String title;
  String path;

  Menu(this.title, this.path);
}

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final menus = [
    Menu('设备配网', '/blue'),
    Menu('天气管理', '/weather'),
    Menu('文件管理', '/file'),
    Menu('设备管理', '/setting')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                Menu menu = menus[index];
                return GestureDetector(
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Center(
                        child: Text(
                      menu.title,
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    )),
                    color: Colors.lightBlueAccent,
                  ),
                  onTap: () {
                    Get.toNamed(menu.path);
                  },
                );
              },
              separatorBuilder: (_, __) => Divider(),
              itemCount: menus.length)),
    );
  }
}
