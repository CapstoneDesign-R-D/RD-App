/*로그인 버튼 위젯*/
// 수정 필요
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/mainScreen.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

enum LoginPlatform {
  kakao, // 로그인
  none, // 로그아웃
}

class KakaoLogin extends StatefulWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  State<KakaoLogin> createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  LoginPlatform _loginPlatform = LoginPlatform.none;

  void signInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = json.decode(response.body);

      // 사용자 정보 추출
      String email = profileInfo['kakao_account']['email'];
      String name = profileInfo['properties']['nickname'];

      print(profileInfo.toString());

      // 사용자 정보를 백엔드 서버로 전송
      await sendUserInfoToServer(email, name);

      setState(() {
        // 로그인의 경우
        _loginPlatform = LoginPlatform.kakao;
        // 메인 화면으로 이동
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const MainScreen(),
        ));
      });
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  Future<void> sendUserInfoToServer(String email, String name) async {
    // API 엔드포인트 URL
    const String apiUrl = 'http://3.34.109.184:8080/api/member/login';

    // HTTP 요청 헤더
    final headers = {
      'Content-Type': 'application/json',
    };

    // HTTP 요청 바디
    final body = jsonEncode({
      'userEmail': email,
      'userPW': '1234', // 기본 비밀번호 설정
    });

    // HTTP POST 요청
    final response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) { // 성공일 경우
      print('User info successfully sent to server');
    } else {
      print('Failed to send user info to server: ${response.body}');
    }
  }

  // 로그아웃 사용 시 사용할 것
  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.kakao:
        await UserApi.instance.logout();
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _loginButton(
          signInWithKakao,
        )
      ],
    );
  }

  Widget _loginButton(VoidCallback onTap) {
    return CupertinoButton(
        onPressed: onTap,
        child: Container(
          width: 260,
          height: 40,
          child: Image.asset('assets/images/kakao_login_large_wide.png'),
        ));
  }

  // 로그아웃 사용 시 사용할 것
  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff0165E1),
        ),
      ),
      child: const Text('로그아웃'),
    );
  }
}
