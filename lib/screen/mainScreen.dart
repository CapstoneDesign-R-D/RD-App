import 'package:flutter/material.dart';
import '../components/textStyles.dart';
import '../widget/mainButton.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ super.key });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ChooseMenu()
      ),
    );
  }
}

class ChooseMenu extends StatelessWidget {
  const ChooseMenu({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0), // 좌우 패딩 적용
      child: Column(
        children: [
          Image.asset(  // 동국대 로고
            alignment: Alignment.topCenter, 
            'assets/images/dongguk_logo.png', 
            height: 80
          ),
          Row(
            children: [
              Image.asset(  // 로봇 로고
                alignment: Alignment.centerLeft, 
                'assets/images/robot_main_logo.png', 
                fit: BoxFit.contain, 
                height: 90
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '안녕하세요, 동국대학교 도서관 서비스 로봇\n“라이브러리봇”입니다 :)',
                    style: headerTextStyle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '아래에서 원하는 서비스를 선택해보세요!',
                    style: defaultTextStyle,
                  ),
                ],
              ),
            ],
          ),
          // 버튼 3개
          Column(
            children: [
              const MainButton(),
              const MainButton(),
              const MainButton()
            ],
          ),
        ],
      )
    );
  }
}
