import 'package:flutter/material.dart';
import 'package:flutter_app/components/text_style.dart';
import 'package:flutter_app/screen/robot_map_screen.dart';

class FloorButton extends StatelessWidget {
  final String buttonText;  // 버튼 내 텍스트 
  final Color buttonColor;  // 버튼 색깔

  const FloorButton({ super.key, required this.buttonColor, required this.buttonText });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        color: buttonColor, // 매개변수로 입력 받은 색상 값이 버튼의 색상 값으로 입력됨.
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: const Offset(0,5),
          )
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RobotMapScreen())
          );
        },
        child: Stack(
          children: [
            Text(
              buttonText, // 매개변수로 입력 받은 문자열이 버튼 내 텍스트로 입력됨.
              style: buttonTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        )
      )
    );
  }
}