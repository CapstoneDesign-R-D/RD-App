/* 메인 화면 내 버튼 3가지 */
import 'dart:ui';
import 'package:/flutter/cupertino.dart';
import '../components/textStyles.dart';

class MainButton extends StatefulWidget {
  const MainButton({ super.key });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 320,
      height: 150,
      child: CupertinoButton(
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
              child: const Icon(
                CupertinoIcons.photo_on_rectangle,
                size: 28,
                color: Color(0xFF9A9526),
              )
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
