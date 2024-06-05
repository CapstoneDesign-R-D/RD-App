import 'package:flutter/material.dart';
import 'package:flutter_app/components/text_style.dart';
import 'package:flutter_app/notification.dart';
import 'package:flutter_app/widget/bar.dart';
import 'package:flutter_app/service/api_service.dart';
import 'package:flutter_app/model/object_check.dart';

class RecordOfRemovalScreen extends StatefulWidget {
  final int originLength = 0;
  const RecordOfRemovalScreen({Key? key}) : super(key: key);

  @override
  State<RecordOfRemovalScreen> createState() => _RecordOfRemovalScreenState();
}

class _RecordOfRemovalScreenState extends State<RecordOfRemovalScreen> {
  final ApiService _apiService = ApiService();
  List<ObjectCheck> _objectCheckList = [];  // 객체 인식 정보 리스트 

  @override
  void initState() {
    super.initState();
    _fetchObjectCheckList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드 오버플로우 방지
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), // 좌우 패딩 적용
          child: Column(
            children: [
              // 상단 제어 바
              Bar(), 
              // 반입 금지 물품 리스트
              Expanded(
                child: ListView.builder(
                  itemCount: _objectCheckList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                        'assets/images/robot_main_logo.png',
                        fit: BoxFit.contain,
                        height: 120
                      ),
                      title: Text(
                        _objectCheckList[index].detectedClass ?? 'Unknown Class',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      subtitle: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${_objectCheckList[index].detectedDate ?? 'Unknown Date'} ${_objectCheckList[index].detectedTime?.hour ?? 'Unknown Hour'}:${_objectCheckList[index].detectedTime?.minute ?? 'Unknown minute'}:${_objectCheckList[index].detectedTime?.second ?? 'Unknown second'}\n', 
                              style: defaultTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: '📍',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: '위치 : ${_objectCheckList[index].location}\t\t',
                              style: headerTextStyle.copyWith(
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: '🥤',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: '제거 : ${_objectCheckList[index].detectionCheck == false? 'X' : 'O'}',
                              style: headerTextStyle.copyWith(
                                fontSize: 15,
                                color: _objectCheckList[index].detectionCheck == false ? Colors.red : Colors.blue
                              )
                            ),
                          ]
                        )
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () { // 제거 여부에 따라 활성화 여부 결정
                        _objectCheckList[index].detectionCheck == false ? _showConfirmationDialog(index) : null;
                      } 
                    );
                  },
                )
              )
            ],
          )
        ),
      ),
    );
  }

  Future<void> _fetchObjectCheckList() async {
    try {
      List<ObjectCheck> objectCheckList = await _apiService.fetchObjectCheckList();
      
      // 이전 데이터와 새로 받아온 데이터의 개수가 다른 경우에만 푸시 알림 표시
      if (_objectCheckList.length != objectCheckList.length) {
        FlutterLocalNotification.showNotification();
      }
      
      setState(() {
        _objectCheckList = objectCheckList;
      });
      
      // 새로 받아온 데이터가 기존 리스트에 없는 경우에만 푸시 알림 표시
      for (var objectCheck in objectCheckList) {
        if (!_objectCheckList.contains(objectCheck)) {
          FlutterLocalNotification.showNotification();
          break; // 푸시 알림을 하나만 표시하기 위해 반복문 중지
        }
      }
    } catch (e) {
      print('객체 인식에 실패하였습니다. : $e');
    }
  }

  void _showConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xffF5C701),
          title: Text(
            '🥤',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 50),
          ),
          content: Text(
            '이 반입 금지 물품을 제거하셨나요?',
            style: headerTextStyle.copyWith(
              fontSize: 17
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                '예',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)
              ),
              onPressed: () async {
                setState(() {
                  _objectCheckList[index].detectionCheck = true;
                });
                // post 요청 
                // await _updateObjectCheck(index);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                '아니오',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildObjectCheckItem(ObjectCheck objectCheck) {
    return ListTile(
      title: Text(objectCheck.location ?? 'Unknown Location'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Class: ${objectCheck.detectedClass ?? 'Unknown Class'}'),
          Text('Date: ${objectCheck.detectedDate ?? 'Unknown Date'}'),
          Text('Time: ${objectCheck.detectedTime?.hour.toString()}:${objectCheck.detectedTime?.minute.toString()}:${objectCheck.detectedTime?.second.toString()}'),
          Text('Check: ${objectCheck.detectionCheck == true ? 'Yes' : 'No'}'),
        ],
      ),
    );
  }
}
