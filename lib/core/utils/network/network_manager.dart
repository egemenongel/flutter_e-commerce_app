import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/base/model/base_model.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/constants/enums/request_types.dart';

class NetworkManager {
  static NetworkManager? instance = NetworkManager.init();
  NetworkManager() {
    NetworkManager.init();
  }
  late final Dio dio;

  NetworkManager.init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      // contentType: ApiConstants.json,
    ));
  }
  Future request<T extends BaseModel>({
    required ReqTypes method,
    required String path,
    dynamic data,
    required T model,
    Map<String, dynamic>? queryParameters,
    bool isBaseResponse = true,
    isFile = false,
  }) async {
    data ??= {};
    try {
      var body = data is Map || data is FormData ? data : data.toJson();

      var response = await dio.request(path,
          data: body,
          queryParameters: queryParameters,
          options: Options(
            contentType: 'application/x-www-form-urlencoded',
            method: method.name,
          ));

      if (response.statusCode == 200) {
        if (response.data is List) {
          var list = <T>[];
          for (var element in (response.data as List)) {
            list.add(model.fromJson(element));
          }
          return list.isNotEmpty ? list : model;
        }
        return model.fromJson(response.data);
      } else {
        log('$path ${method.name} FAILED | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}');
        return null;
      }
    } on DioError catch (dioError) {
      log('$path ${method.name} DIO ERROR | Error : $dioError');
      return null;
    } catch (error) {
      log('$path ${method.name} ERROR | Error : $error');
      return null;
    }
  }
}
