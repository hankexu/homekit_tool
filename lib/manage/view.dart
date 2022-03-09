import 'package:flutter/material.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('文件管理')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: '用户名'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: '密码'),
          ),
          MaterialButton(
            onPressed: () {},
            child: const Text('连接'),
          )
        ],
      ),
    );
  }
}
