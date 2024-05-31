/*로봇 맵 띄울 화면*/
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/bar.dart';

class RobotMapScreen extends StatefulWidget {
  const RobotMapScreen({super.key});

  @override
  State<RobotMapScreen> createState() => _RobotMapScreenState();
}

class _RobotMapScreenState extends State<RobotMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드 오버플로우 방지
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), // 좌우 패딩 적용
          child: Column(
            children: [
              Bar(), // 상단 제어 바
              Image.asset(
                // 안내문구 이미지
                alignment: Alignment.centerLeft,
                'assets/images/comment_of_3fMap.png',
                fit: BoxFit.contain,
                height: 80
              ),
              SizedBox(height: 10),
              Image.asset(
                // 도서관 맵 이미지
                alignment: Alignment.centerLeft,
                'assets/images/map_of_library.png',
                fit: BoxFit.contain,
                height: 570
              ),
            ],
          )
        ),
      ),
    );
  }
}
