import 'package:flutter/material.dart';
import 'package:flutter_app/notification.dart';
import 'package:flutter_app/components/text_style.dart';
import '../widget/robot_button.dart';
import '../widget/drink_button.dart';
import '../widget/manager_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ super.key });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void initState() {
    // 초기화
    FlutterLocalNotification.init();

    // 3초 후 권한 요청
    Future.delayed(
      const Duration(seconds: 3), 
      FlutterLocalNotification.requestNotificationPermission()
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,  // 키보드 오버플로우 방지
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
      padding: const EdgeInsets.fromLTRB(21, 0, 21, 0), // 좌우 패딩 적용
      child: Column(
        children: [
          // 임시로 로고 클릭 시 푸시 알림이 오게 설정.
          TextButton(
            onPressed: () => FlutterLocalNotification.showNotification(),
            child: Image.asset(  // 동국대 로고
              alignment: Alignment.topCenter, 
              'assets/images/dongguk_logo.png', 
              height: 80
            ),
          ),
          SizedBox( // 여백
            height: 5,
          ),
          Row(
            children: [
              Image.asset(  // 로봇 로고
                alignment: Alignment.centerLeft, 
                'assets/images/robot_main_logo.png', 
                fit: BoxFit.contain, 
                height: 90
              ),
              const SizedBox(width: 5), // 여백
              Column( // 앱 기본 멘트
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '안녕하세요, 동국대학교 도서관 서비스 로봇\n“라이브러리봇”입니다 :)',
                    style: headerTextStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '아래에서 원하는 서비스를 선택해보세요!',
                    style: defaultTextStyle,
                  ),
                ],
              ),
            ],
          ),
          SizedBox( // 여백
            height: 35,
          ),
          Column( // 버튼 3개
            children: [
              const RobotButton(),
              const SizedBox(height: 25), // 여백
              const DrinkButton(),
              const SizedBox(height: 25), // 여백
              const ManagerButton()
            ],
          ),
        ],
      )
    );
  }
}
