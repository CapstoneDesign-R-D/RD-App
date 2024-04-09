import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ super.key });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0), // 좌우 패딩 적용
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
                height: 80
              ),
              const Spacer(),
              Text(
                '안녕하세요, 동국대학교 도서관 서비스 로봇\n“라이브러리봇”입니다 :)',
                style: TextStyle(
                  fontSize: 15, 
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}