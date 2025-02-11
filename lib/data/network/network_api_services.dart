import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cleancode/data/exception/exception.dart';
import 'package:flutter/foundation.dart';

import 'base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices implements BaseApiServices{
  @override
  Future<dynamic> getData(String url) async {
    dynamic response;

    try {
      final responseData = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      response = getResponse(responseData);
    } on SocketException catch (e) {
      throw NetworkException('No internet connection', 'while fetching data');
    } on TimeoutException catch (e) {
      throw NetworkException('Timeout please try again', 'while fetching data');
    }
    return response;
  }

  @override
  Future<dynamic> postData(String url, dynamic data) async {
    final dynamic response;

    try {
      final responseData = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      response = getResponse(responseData);
    } on SocketException catch (e) {
      throw NetworkException('No internet connection', 'while fetching data');
    } on TimeoutException catch (e) {
      throw NetworkException('Timeout please try again', 'while fetching data');
    }
    return jsonDecode(response);
  }

  @override
  Future<dynamic> deleteData(String url) async {
    throw UnimplementedError();
  }

  dynamic getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        if (kDebugMode) {
          print('Body${response.body}');
          print('Body type${response.body.runtimeType}');
        }
        return response.body;
      case 400:
        throw AppException('Bad request', 'while fetching data');
      case 401:
        throw AppException('Unauthorized', 'while fetching data');
      case 403:
        throw AppException('Forbidden', 'while fetching data');
      case 404:
        throw AppException('Not found', 'while fetching data');
      case 500:
        throw AppException('Internal server error', 'while fetching data');
      default:
        throw AppException('Unknown error', 'while fetching data');
    }
  }
}