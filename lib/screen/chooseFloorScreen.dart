import 'package:flutter/material.dart';
import 'package:flutter_app/widget/bar.dart';

class ChooseFloorScreen extends StatefulWidget {
  const ChooseFloorScreen({ super.key });

  @override
  State<ChooseFloorScreen> createState() => _ChooseFloorScreenState();
}

class _ChooseFloorScreenState extends State<ChooseFloorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,  // 키보드 오버플로우 방지
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), // 좌우 패딩 적용
          child: Column(
            children: [
              Bar(),
            ],
          )
        ),
      ),
    );
  }
}