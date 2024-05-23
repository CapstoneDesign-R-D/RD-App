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
      print(profileInfo.toString());

      setState(() {
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
        width: 240,
        height: 36,
        child: Image.asset('assets/images/kakao_login_large_wide.png'),
      )
    );
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
