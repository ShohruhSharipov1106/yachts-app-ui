import 'package:flutter/material.dart';
import 'package:yachts_app_ui/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yacht App Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
