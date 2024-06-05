import 'dart:convert'; 
import 'package:dio/dio.dart';
import '../model/object_check.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<ObjectCheck>> fetchObjectCheckList() async {
    try {
      Response response = await _dio.get(
        'http://3.34.109.184:8080/api/object/check',
        options: Options(
          method: 'GET',
          responseType: ResponseType.plain,
        )
      );

      if (response.statusCode == 200) { // success
        var decodedData = jsonDecode(response.data);
        
        if (decodedData is List) {
          List<ObjectCheck> objectCheckList = decodedData.map<ObjectCheck>((item) {
            if (item is Map<String, dynamic>) {
              return ObjectCheck.fromJson(item);
            } else {
              throw Exception('객체 인식 정보 리스트를 불러오는 데 실패하였습니다.');
            }
          }).toList();
          return objectCheckList;
        } else {
          throw Exception('Not a list.');
        }
      } else {
        throw Exception('객체 인식 정보 리스트를 불러오는 데 실패하였습니다.');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('객체 인식 정보 리스트를 불러오는 데 실패하였습니다.');
    }
  }

  Future<void> updateObjectCheck(ObjectCheck objectCheck) async {
    try {
      // JSON 데이터 변환
      final jsonData = jsonEncode(objectCheck.toJson());
      print('Sending JSON data: $jsonData');

      // POST 요청
      final response = await _dio.post(
        'http://3.34.109.184:8080/api/object/${objectCheck.objId}/detectioncheck/update',
        options: Options(
          method: 'POST',
          headers: {'Content-Type': 'application/json'},
          responseType: ResponseType.plain,
        ),
        data: jsonData,
      );

      // 상태 코드 확인
      if (response.statusCode != 200) {
        print('Failed to update object check. Status code: ${response.statusCode}, Response: ${response.data}');
        throw Exception('객체 인식 정보 업데이트에 실패하였습니다.');
      } else {
        print('Object check updated successfully. Response: ${response.data}');
      }
    } catch (e) {
      // DioError인지 확인 및 에러 처리
      if (e is DioError) {
        if (e.response != null) {
          print('DioError response data: ${e.response?.data}');
          print('Status code: ${e.response?.statusCode}');
          print('Headers: ${e.response?.headers}');
        } else {
          print('Error sending request: ${e.message}');
        }
      } else {
        print('Unknown error: $e');
      }
      throw Exception('객체 인식 정보 업데이트에 실패하였습니다.');
    }
  }
}
