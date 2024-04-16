import 'package:flutter/material.dart';
import 'package:flutter_app/screen/chooseFloorScreen.dart';
import 'package:flutter_app/screen/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LibraryBot',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,  // 기본 배경색 지정
      ),
      home: const MainScreen(),
    );
  }
}
