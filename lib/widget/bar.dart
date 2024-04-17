/*뒤로 가기 버튼 + 동국대 로고*/
import 'package:flutter/material.dart';

class Bar extends StatefulWidget {
  const Bar({ super.key });

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MaterialButton( // 뒤로 가기 버튼
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          minWidth: 25,
          onPressed: () { // 버튼 클릭 시 뒤로 이동
            Navigator.pop(context);
          }, 
          child: Icon(
            Icons.arrow_back,
            color: Color(0xFFE85610),
            size: 25.0,
          ),
        ),
        SizedBox(
          width: 58,
        ),
        Image.asset(  // 동국대 로고
          alignment: Alignment.topCenter, 
          'assets/images/dongguk_logo.png', 
          height: 80
        ),
      ],
    );
  }
}