import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/logger.dart';
import 'api_exception.dart';

class ApiHelper {
  final Dio _dio;
  const ApiHelper(this._dio);

  Future<dynamic> execute({
    required Method method,
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (data != null) {
        logger.d('execute-data $data');
      }
      if (queryParameters != null) {
        logger.d('execute-queryParameters $queryParameters');
      }

      Response? response;
      switch (method) {
        case Method.get:
          response = await _dio.get(url, queryParameters: queryParameters);
          break;
        case Method.post:
          response = await _dio.post(url, data: data);
          break;
        case Method.put:
          response = await _dio.put(url, data: data);
          break;
        case Method.patch:
          response = await _dio.patch(url, data: data);
          break;
        case Method.delete:
          response = await _dio.delete(url, data: data);
          break;
      }

      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioException catch (e) {
      return _returnResponse(e.response!);
    }
  }

  dynamic _returnResponse(Response response) {
    final rd = response.data;
    final sc = response.statusCode;

    logger.d('execute $sc: ${rd.runtimeType} || ${json.encode(rd)}');

    switch (response.statusCode) {
      case 200:
        return rd;
      case 201:
        return rd;
      case 400:
        throw BadRequestException(rd['message'].toString());
      case 401:
        throw UnauthorizedException(rd['message'].toString());
      case 403:
        throw ForbiddenException(rd['message'].toString());
      case 404:
        throw NotFoundException(rd['message'].toString());
      case 422:
        throw UnprocessableContentException(rd['message'].toString());
      case 500:
        throw InternalServerException(rd['message'].toString());
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : $sc',
        );
    }
  }
}

enum Method { get, post, put, patch, delete }
