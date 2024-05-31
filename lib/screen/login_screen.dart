/*카카오 로그인 페이지*/
// 수정 필요
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/components/decorations.dart';
import 'package:flutter_app/components/textStyles.dart';
import 'package:flutter_app/widget/kakao_login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ super.key });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String inputEmail = "";
  String inputPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 동국대 로고
            Image.asset(
              alignment: Alignment.topCenter,
              'assets/images/dongguk_logo.png',
              height: 80
            ),
            const SizedBox(height: 25),
            // 로봇 로고
            Image.asset(
              alignment: Alignment.centerLeft,
              'assets/images/robot_main_logo.png',
              fit: BoxFit.contain,
              height: 120
            ),
            const SizedBox(height: 25),
            // 로그인 안내 문구
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: '동국대학교 도서관 서비스 로봇 ', 
                    style: headerTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: '"라이브러리봇"',
                    style: headerTextStyle.copyWith(
                      color: Colors.orange,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: '입니다.', 
                    style: headerTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: '\n서비스를 이용하기 위해 로그인해주세요.',
                    style: headerTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Dongguk University library service robot “Library Bot” :)\nPlease log in to use the service.',
              style: tinyTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 아이디
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          "이메일",
                          style: headerTextStyle.copyWith(
                            fontSize: 16,
                          )
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  CupertinoTextField(
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
                    style: const TextStyle(color: CupertinoColors.black),
                    placeholder: "dongguk@naver.com",
                    placeholderStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    onChanged: (text) {
                      setState(() {
                        inputEmail = text;
                      });
                    },
                    decoration: textFieldDecoration(),
                  ),
                  const SizedBox(height: 20),
                  // 비밀번호
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          "비밀번호",
                          style: headerTextStyle.copyWith(
                            fontSize: 16,
                          )
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  CupertinoTextField(
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
                    style: const TextStyle(color: CupertinoColors.black),
                    placeholder: "********",
                    placeholderStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    onChanged: (text) {
                      setState(() {
                        inputPassword = text;
                      });
                    },
                    decoration: textFieldDecoration(),
                  ),
                  const SizedBox(height: 20),
                  // 비밀번호 찾기 | 회원가입
                  const Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Text(
                      "비밀번호 찾기 | 회원가입",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // 카카오 로그인 버튼
                  const KakaoLogin()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
