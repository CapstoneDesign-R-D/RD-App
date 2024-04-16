/* 메인 화면 내 버튼 3가지 중 로봇 버튼*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/chooseFloorScreen.dart';
import '../components/textStyles.dart';

class RobotButton extends StatefulWidget {
  const RobotButton({ super.key });

  @override
  State<RobotButton> createState() => _RobotButtonState();
}

class _RobotButtonState extends State<RobotButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFFD0F5BE),
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: () { // 버튼 클릭 시 층 선택 페이지로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChooseFloorScreen())
          );
        }, 
        child: Stack(
          children: [
            Container(  // 버튼 이름
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '로봇 / 반입 금지 물품',
                      style: buttonTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '실시간 위치 확인',
                      style: buttonTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(  // 로봇 로고
              width: 45,
              height: 45,
              margin: const EdgeInsets.fromLTRB(130, 10, 130, 0),
              child: Image.asset(  
                alignment: Alignment.center, 
                'assets/images/icon1.png', 
                fit: BoxFit.contain, 
              ),
            ),
            Container(  // 버튼 설명 멘트
              width: 500,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 13),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  ': 현재 로봇과 반입 금지 물품의 위치를 확인해요.',
                  style: greyTextStyle,
                ),
              ),
            ),
          ]
        ), 
      ),
    );
  }
}
