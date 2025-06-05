import 'package:dio/dio.dart';

class Apiservice {
  final Dio dio = Dio();
  Future<Response> post({
    required String token,
    required String url,
    required String body,
    String? CurrnetType,
  }) async {
    var responsive = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: CurrnetType,
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return responsive;
  }
}
