import 'package:dio/dio.dart';
import '../model/object_check.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<ObjectCheck> fetchObjectCheck() async {
    try {
      Response response = await _dio.get('http://3.34.109.184:8080/api/object/check');

      if (response.statusCode == 200) { // success
        return ObjectCheck.fromJson(response.data);
      } else {
        throw Exception('객체 인식 정보를 불러오는 데 실패하였습니다.');
      }
    } catch (e) {
      print(e);
      throw Exception('객체 인식 정보를 불러오는 데 실패하였습니다.');
    }
  }
}
