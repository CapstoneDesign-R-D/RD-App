/* 메인 화면 내 버튼 3가지 중 로봇 버튼*/
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/choose_floor_screen.dart';
import 'package:flutter_app/components/text_style.dart';

class RobotButton extends StatelessWidget {
  const RobotButton({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFFD0F5BE),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: const Offset(0,5),
          )
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChooseFloorScreen())
          );
        }, 
        child: Stack(
          children: [
            Container(  // 버튼 이름
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
              child: const Column(
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
                  '현재 로봇과 반입 금지 물품의 위치를 확인해요.',
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
