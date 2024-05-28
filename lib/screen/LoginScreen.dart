/*카카오 로그인 페이지*/
// 수정 필요
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/components/decorations.dart';
import 'package:flutter_app/widget/kakaoLoginWidget.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MaterialButton(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 27,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 83),
                const Text(
                  "로그인",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 31),
              ],
            ),
            const SizedBox(height: 44),
            Image.asset(
              // 로봇 로고
              alignment: Alignment.centerLeft,
              'assets/images/robot_main_logo.png',
              fit: BoxFit.contain,
              height: 90
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.0),
                        child: Text( "이메일",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  CupertinoTextField(
                    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
                    style: const TextStyle(color: CupertinoColors.black),
                    placeholder: "example@naver.com",
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
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          "비밀번호",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
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
                  // 비밀번호 찾기 / 회원가입
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
                  // 소셜 로그인
                  const SizedBox(height: 15),
                  const Text(
                    "간편 로그인",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
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
