import 'package:dio/dio.dart';

class DioApi {
  Dio dio;

  DioApi(String apiUrl) {
    dio = Dio();
    dio.options.baseUrl = apiUrl;

    dio.interceptors.add(InterceptorsWrapper(onRequest: _requestIntercept));
    dio.interceptors.add(InterceptorsWrapper(onResponse: _responseIntercept));
    dio.interceptors.add(InterceptorsWrapper(onError: _errorIntercept));
  }

  void _requestIntercept(options) {
    // if (authservice.accesstoken != null) {
    //   options.headers
    //       .addAll({"Authorization": "Bearer ${authservice.accesstoken}"});
    // }
    print(
        "REQUEST: ${options?.method}: ${options?.baseUrl}${options?.path} ${options?.queryParameters}");
  }

  void _responseIntercept(response) {
    print("${response.request?.path} ${response?.data}");
  }

  void _errorIntercept(DioError error) {
    print("${error.request?.path} ${error.response?.data}");
  }
}
