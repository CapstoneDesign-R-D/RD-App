/*층 선택 화면*/
import 'package:flutter/material.dart';
import 'package:flutter_app/components/text_style.dart';
import 'package:flutter_app/widget/bar.dart';
import 'package:flutter_app/widget/floor_button.dart';

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
              Bar(),  // 상단 제어 바
              Image.asset(  // 로봇 로고
                alignment: Alignment.centerLeft, 
                'assets/images/robot_main_logo.png', 
                fit: BoxFit.contain, 
                height: 90
              ),
              const SizedBox(height: 18), // 여백
              Container(  // 멘트
                height: 20,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '원하시는 층을 선택해주세요 :)',
                    style: headerTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 45), // 여백
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloorButton(
                    buttonText: 'B2F', 
                    buttonColor: Color(0xFFFFECA9)
                  ),
                  FloorButton(
                    buttonText: 'B1F', 
                    buttonColor: Color(0xFFFFCC201)
                  ),
                ],
              ),
              const SizedBox(height: 25), // 여백
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloorButton(
                    buttonText: '1F', 
                    buttonColor: Color(0xFFFFE073)
                  ),
                  FloorButton(
                    buttonText: '2F', 
                    buttonColor: Color(0xFFFFD951)
                  ),
                ],
              ),
              const SizedBox(height: 25), // 여백
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloorButton(
                    buttonText: '3F', 
                    buttonColor: Color(0xFFE95614)
                  ),
                  FloorButton(
                    buttonText: '4F', 
                    buttonColor: Color(0xFFF49305)
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}