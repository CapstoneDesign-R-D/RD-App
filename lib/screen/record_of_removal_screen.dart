/*로봇 맵 띄울 화면*/
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/bar.dart';
import 'package:flutter_app/service/api_service.dart';
import 'package:flutter_app/model/object_check.dart';

class RecordOfRemovalScreen extends StatefulWidget {
  const RecordOfRemovalScreen({ super.key });

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

  Future<void> _fetchObjectCheckList() async {
    try {
      List<ObjectCheck> objectCheckList = await _apiService.fetchObjectCheckList();
      setState(() {
        _objectCheckList = objectCheckList;
      });
    } catch (e) {
      print('객체 인식에 실패하였습니다. : $e');
    }
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
              Bar(), // 상단 제어 바
              Expanded(
                child: ListView.builder(
                  itemCount: _objectCheckList.length,
                  itemBuilder: (context, index) {
                    return _buildObjectCheckItem(_objectCheckList[index]);
                  },
                )
              )
            ],
          )
        ),
      ),
    );
  }

  Widget _buildObjectCheckItem(ObjectCheck objectCheck) {
    return ListTile(
      title: Text(objectCheck.location ?? '인식하지 못 한 위치'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Class: ${objectCheck.detectedClass ?? '인식하지 못 한 클래스'}'),
          Text('Date: ${objectCheck.detectedDate ?? '인식하지 못 한 날짜'}'),
          Text('Time: ${objectCheck.detectedTime?.hour}:${objectCheck.detectedTime?.minute}:${objectCheck.detectedTime?.second}'),
          Text('Check: ${objectCheck.detectionCheck == true ? 'Yes' : 'No'}'),
        ],
      ),
    );
  }
}
