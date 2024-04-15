/* 메인 화면 내 버튼 3가지 */
import 'dart:io';
import 'package:flutter/material.dart';
import '../components/textStyles.dart';

class MainButton extends StatefulWidget {
  const MainButton({ super.key });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFFD0F5BE),
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: () {}, // 버튼 클릭 시 해당 페이지로 이동
        child: Stack(
          children: [
            Container(  // 버튼 이름
              padding: const EdgeInsets.fromLTRB(72, 20, 73, 0),
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
              margin: const EdgeInsets.fromLTRB(140, 10, 140, 0),
              child: Image.asset(  
                alignment: Alignment.center, 
                'assets/images/icon1.png', 
                fit: BoxFit.contain, 
              ),
            ),
            Container(  // 버튼 설명 멘트
              width: 500,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  ': 현재 로봇과 반입 금지 물품의 위치를 확인해요.',
                  style: defaultTextStyle,
                ),
              ),
            ),
          ]
        ), 
      ),
    );
  }
}
