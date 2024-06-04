import 'dart:convert'; // for json decoding
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
          responseType: ResponseType.plain,  // 응답을 문자열로 받기
        )
      );

      if (response.statusCode == 200) { // success
        // JSON 문자열을 디코딩하여 리스트로 변환
        var decodedData = jsonDecode(response.data);
        
        if (decodedData is List) {
          List<ObjectCheck> objectCheckList = decodedData.map<ObjectCheck>((item) {
            if (item is Map<String, dynamic>) {
              return ObjectCheck.fromJson(item);
            } else {
              print('Unexpected item type: ${item.runtimeType}');
              throw Exception('Expected a Map<String, dynamic> but got ${item.runtimeType}');
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
}
