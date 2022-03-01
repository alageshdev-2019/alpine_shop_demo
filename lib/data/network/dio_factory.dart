import 'package:alpine_shop_demo/app/app_prefs.dart';
import 'package:alpine_shop_demo/app/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'authorization';
const String defaultLanguage = 'language';

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int _timeOut = 60 * 1000;

    String language = await _appPreferences.getAppLanguage();
    String token = await _appPreferences.getToken();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: token,
      defaultLanguage: language
    };
    dio.options = BaseOptions(
        baseUrl: Constant.baseUrl,
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        //connectTimeout: 5000,
        //receiveTimeout: 3000,
        headers: headers);

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true));
    }

    return dio;
  }
}
