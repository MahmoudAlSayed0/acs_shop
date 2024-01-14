import 'dart:convert';
import 'dart:io';

import 'package:acs_shop/app_config.dart';
import 'package:acs_shop/models/customer.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future<bool> createCustomer(Customer customer) async {
    String authToken =
        base64Encode(utf8.encode(AppConfig.key + ':' + AppConfig.secret));
    bool ret = false;
    try {
      var response = await Dio().post(AppConfig.url + AppConfig.customerURL,
          data: customer.toJson(),
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: 'application/json'
          }));
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }
}
