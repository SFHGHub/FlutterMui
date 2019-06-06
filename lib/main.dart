import 'package:flutter/material.dart';

import 'index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_mui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: IndexPage(),
    );
  }
}
