import 'package:dio/dio.dart';

class Apiservice {
  final Dio dio = Dio();
  Future<Response> post({
    required String token,
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? header,
    String? ContentType,
  }) async {
    var responsive = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: header ?? {'Authorization': 'Bearer $token'},
      ),
    );
    return responsive;
  }
}
