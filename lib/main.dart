import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screen/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'LibraryBot',
      theme: const CupertinoThemeData(
        scaffoldBackgroundColor: Colors.white,  // 기본 배경색 지정
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle( // 기본 폰트
            fontFamily: 'Inter',
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
