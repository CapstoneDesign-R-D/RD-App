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
    return SizedBox(
      width: 320,
      height: 150,
      child: MaterialButton(
        onPressed: () {},
        child: Stack(
          children: [
            Container(
              width: 320,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xD0F5BE),
                borderRadius: BorderRadius.circular(15),
              )
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(72, 63, 73, 0),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '로봇 / 반입 금지 물품\n실시간 위치 확인',
                  style: buttonTextStyle,
                ),
              ),
            ),
            const SizedBox(width: 26),
            Container(
              margin: const EdgeInsets.fromLTRB(140, 11, 140, 0),
              child: Image.asset(  // 로봇 로고
                alignment: Alignment.centerLeft, 
                'assets/images/icon1.png', 
                fit: BoxFit.contain, 
                height: 90
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(72, 63, 73, 0),
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
