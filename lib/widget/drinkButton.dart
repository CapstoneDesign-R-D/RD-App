/* 메인 화면 내 버튼 3가지 중 음료 버튼*/
import 'dart:io';
import 'package:flutter/material.dart';
import '../components/textStyles.dart';

class DrinkButton extends StatefulWidget {
  const DrinkButton({ super.key });

  @override
  State<DrinkButton> createState() => _DrinkButtonState();
}

class _DrinkButtonState extends State<DrinkButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFFC0E6F2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: () {}, // 버튼 클릭 시 해당 페이지로 이동
        child: Stack(
          children: [
            Container(  // 버튼 이름
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '반입 금지 물품 제거 기록',
                      style: buttonTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(  // 음료 로고
              width: 45,
              height: 45,
              margin: const EdgeInsets.fromLTRB(130, 10, 130, 0),
              child: Image.asset(  
                alignment: Alignment.center, 
                'assets/images/icon2.png', 
                fit: BoxFit.contain, 
              ),
            ),
            Container(  // 버튼 설명 멘트
              width: 500,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  ': 반입 금지 물품에 대한 알림/해제 기록을 확인해요.',
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
