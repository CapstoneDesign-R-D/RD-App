import 'package:flutter/material.dart';
import 'package:flutter_app/screen/login_screen.dart';
import 'package:flutter_app/screen/main_screen.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() async {
  KakaoSdk.init(nativeAppKey: 'e5f5907b2ec3520d326b7beaec6d7e89');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LibraryBot',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white, // 기본 배경색 지정
      ),
      home: const MainScreen(),
    );
  }
}
