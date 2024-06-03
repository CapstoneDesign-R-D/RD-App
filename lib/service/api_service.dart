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
          responseType: ResponseType.plain,  // json으로 응답 받기
        )
      );

      if (response.statusCode == 200) { // success
        print('Response data: ${response.data}');
        List<ObjectCheck> objectCheckList = List<ObjectCheck>.from(jsonDecode(response.data).map((x) => ObjectCheck.fromJson(x)));
        return objectCheckList;
      } else {
        throw Exception('객체 인식 정보 리스트1을 불러오는 데 실패하였습니다.');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('객체 인식 정보 리스트2를 불러오는 데 실패하였습니다.');
    }
  }
}
