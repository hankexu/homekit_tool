import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? validator(value) {
  if (value == null || value.isEmpty) {
    return '不能为空';
  }
  return null;
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('天气配置'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: '城市'),
            validator: validator,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'APP Key'),
            validator: validator,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'APP Secret'),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
