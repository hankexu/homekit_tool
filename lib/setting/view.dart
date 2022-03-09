import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设备设置')),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('屏幕亮度'),
        Slider(
          value: 5,
          max: 100,
          onChanged: (value) {},
        )
      ]),
    );
  }
}
