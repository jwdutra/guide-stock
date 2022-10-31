import 'dart:convert';
import 'dart:developer';

import 'package:commons/errors/exceptions.dart';
import 'package:dio/dio.dart';

import '../config/app_config.dart';

import 'auth_interceptor.dart';
//import 'package:maisrenda/app/shared/dio_backend/auth_interceptor.dart';

class DioBackendProvider {
  Dio? client;

  String? url;

  DioBackendProvider({this.url}) {
    init();
  }

  Dio init() {
    BaseOptions options = BaseOptions(
      baseUrl: url ?? AppConfigs.urlBackend(),
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    );

    if (url != null) client = null;
    client = Dio(options);

    client!.interceptors.add(AuthInterceptor());

    return client!;
  }

  Future<dynamic> post({
    required String path,
    required String data,
  }) async {
    try {
      var response = await client!.post(
        path,
        data: data,
      );

      //var responseReturn = jsonEncode(response.data);

      return response;
    } on DioError catch (err) {
      _handleError(err);

      throw UnableToRequestApi('Erro de request POST na API');
    } catch (e) {
      inspect(Exception);
      throw UnableToRequestApi('Erro de request POST na API');
    }
  }

  Future<String> get({
    required String path,
  }) async {
    try {
      var response = await client!.get(
        path,
      );

      //inspect(response);

      var responseReturn = jsonEncode(response.data);

      return responseReturn;
    } on DioError catch (err) {
      inspect(err);
      _handleError(err);

      throw UnableToRequestApi('Erro de request GET na API 1');
    } on Exception {
      inspect(Exception);
      throw UnableToRequestApi('Erro de request GET na API 2');
    }
  }

  Future<String> put({
    required String path,
    required String data,
  }) async {
    try {
      var response = await client!.put(
        path,
        data: data,
      );

      var responseReturn = jsonEncode(response.data);

      return responseReturn;
    } on DioError catch (err) {
      _handleError(err);
      throw UnableToRequestApi('Erro de request PUT na API');
    } on Exception {
      inspect(Exception);
      throw UnableToRequestApi('Erro de request PUT na API');
    }
  }

  Future<String> delete({
    required String path,
  }) async {
    try {
      var response = await client!.delete(
        path,
      );

      var responseReturn = jsonEncode(response.data);

      return responseReturn;
    } on DioError catch (err) {
      _handleError(err);
      throw UnableToRequestApi('Erro de request DELETE na API');
    } on Exception {
      inspect(Exception);
      throw UnableToRequestApi('Erro de request DELETE na API');
    }
  }

  void _handleError(err) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          //case 400:
          case 401:
          //throw UnableToGetAccess('Erro de request de login - 401');
          //case 404:
          //throw NotFoundException(err.requestOptions);
          case 409:
            throw UnableToRequestApi(
              'Erro de request na API - 409 - ConflictException',
            );
          case 500:
            throw UnableToRequestApi('Erro de request GET na API - 500');
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw UnableToRequestApi('Erro desconhecido na API');
    }
  }
}
