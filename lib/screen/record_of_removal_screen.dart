/*로봇 맵 띄울 화면*/
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/bar.dart';

class RecordOfRemovalScreen extends StatefulWidget {
  const RecordOfRemovalScreen({ super.key });

  @override
  State<RecordOfRemovalScreen> createState() => _RecordOfRemovalScreenState();
}

class _RecordOfRemovalScreenState extends State<RecordOfRemovalScreen> {
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
              
            ],
          )
        ),
      ),
    );
  }
}
