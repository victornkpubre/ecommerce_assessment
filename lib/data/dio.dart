
import 'package:dio/dio.dart';
import 'package:ecommerce/app/constants.dart';


class DioFactory {

  Dio getDio() {
    Dio dio = Dio();

    // String? token = await _appPreferences.getUserToken();

    // Map<String, String> headers = {
    //   AUTHORIZATION: token??AppConstants.token,
    // };

    dio.options = BaseOptions (
      baseUrl: AppConstants.baseUrl,
      validateStatus: (_) => true,
      contentType: Headers.jsonContentType,
      responseType:ResponseType.json,
    );

    return dio;
  }
}