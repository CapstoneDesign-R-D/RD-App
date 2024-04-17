/* 메인 화면 내 버튼 3가지 중 관리자 페이지 버튼*/
import 'dart:io';
import 'package:flutter/material.dart';
import '../components/textStyles.dart';

class ManagerButton extends StatefulWidget {
  const ManagerButton({ super.key });

  @override
  State<ManagerButton> createState() => _ManagerButtonState();
}

class _ManagerButtonState extends State<ManagerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFFE1B6F0),
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
        onPressed: () {}, // 버튼 클릭 시 해당 페이지로 이동
        child: Stack(
          children: [
            Container(  // 버튼 이름
              padding: const EdgeInsets.fromLTRB(60, 10, 60, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '관리자 페이지',
                      style: buttonTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(  // 관리자페이지 로고
              width: 45,
              height: 45,
              margin: const EdgeInsets.fromLTRB(130, 10, 130, 0),
              child: Image.asset(  
                alignment: Alignment.center, 
                'assets/images/icon3.png', 
                fit: BoxFit.contain, 
              ),
            ),
            Container(  // 버튼 설명 멘트
              width: 500,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '근로학생과 관리자가 이용할 수 있는 페이지입니다.',
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
