import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finance_bank_app/core/base/model/auth_model.dart';
import 'package:finance_bank_app/core/base/model/base_model.dart';
import 'package:finance_bank_app/core/constants/app/application_constants.dart';
import 'package:finance_bank_app/core/constants/enums/app_enum.dart';
import 'package:finance_bank_app/core/init/local/i_storage_manager.dart';
import 'package:finance_bank_app/core/init/logger/i_logger_manager.dart';
import 'package:finance_bank_app/core/init/navigation/i_navigation_service.dart';
import 'package:finance_bank_app/core/init/network/base_network_manager.dart';
import 'package:finance_bank_app/product/constants/navigation/navigation_constants.dart';
import 'package:finance_bank_app/product/init/logger/logger_manager.dart';
import 'package:finance_bank_app/product/init/navigation/navigation_service.dart';
import 'package:finance_bank_app/product/init/storage/hive_manager.dart';

class DioManager extends BaseNetworkManager {
  DioManager._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApplicationConstants.baseUrl,
      ),
    )..interceptors.add(_addInterceptor);
  }
  static DioManager? _instance;

  static DioManager get instance => _instance ??= DioManager._internal();

  @override
  ILoggerManager get loggerManager => LoggerManager.instance;

  @override
  INavigationService get navigationService => NavigationService.instance;

  @override
  IStorageManager get storageManager => HiveManager.instance;

  late final Dio _dio;

  Dio get dio => _dio;

  Future<T?> send<T extends BaseModel<T>>(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    dynamic data,
    RequestType requestType = RequestType.GET,
    required T responseModel,
  }) async {
    Response<dynamic> response;
    final bodyModel = _getBodyModel(data);
    if (requestType == RequestType.GET) {
      response = await _dio.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } else if (requestType == RequestType.POST) {
      response = await _dio.post(
        path,
        data: bodyModel,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } else if (requestType == RequestType.PUT) {
      response = await _dio.put(
        path,
        data: bodyModel,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } else {
      response = await _dio.delete(
        path,
        data: bodyModel,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    }
    if (response.data is Map<String, dynamic>) {
      return responseModel.fromJson(response.data as Map<String, dynamic>);
    }
    return null;
  }

  dynamic _getBodyModel(dynamic data) {
    if (data is BaseModel) {
      return data.toJson();
    } else if (data != null) {
      return jsonEncode(data);
    }
    return data;
  }

  String get _tokenRoute => 'token';

  InterceptorsWrapper get _addInterceptor {
    return InterceptorsWrapper(
      onRequest: (request, handler) {
        _onRequestHandler(request);
        loggerManager.verbose(
          'Dio Url: ${request.baseUrl}${request.path}\nDio Method: ${request.method}\nDio Header: ${request.headers}\nDio Request: ${request.data}',
        );
        handler.next(request);
      },
      onResponse: (response, handler) {
        loggerManager.verbose(
          'Dio Response: $response\nDio Headers: ${response.headers}\nDio Status Code: ${response.statusCode}\nDio Data: ${response.data}',
        );
        _onResponseHandler(
          response.requestOptions.path,
          response.statusCode,
          response.requestOptions.data,
          response.data,
        );
        handler.next(response);
      },
      onError: (error, handler) {
        loggerManager
            .verbose('Error Status Code: ${error.response?.statusCode}');
        _onErrorHandler(
          error.response?.statusCode,
        );
        handler.next(error);
      },
    );
  }

  void _onRequestHandler(RequestOptions request) {
    if (request.path == _tokenRoute) {
      _dio.options.headers.remove(HttpHeaders.authorizationHeader);
    } else if ((storageManager.authModel?.token ?? '').isNotEmpty) {
      final mapEntry = MapEntry(
        HttpHeaders.authorizationHeader,
        'Bearer ${storageManager.authModel!.token}',
      );
      request.headers[mapEntry.key] = mapEntry.value;
    }
  }

  void _onResponseHandler(
    String path,
    int? statusCode,
    dynamic reqData,
    dynamic resData,
  ) {
    if (path == _tokenRoute && statusCode == HttpStatus.ok) {
      final resMap = resData as Map<String, Object?>;
      final reqMap = reqData as Map<String, Object?>;
      resMap.addAll(reqMap);
      final authModel = AuthModel.fromJson(resMap);
      storageManager.signIn(authModel);
      _dio.options.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${authModel.token}';
    }
  }

  void _onErrorHandler(int? statusCode) {
    if (statusCode == HttpStatus.forbidden ||
        statusCode == HttpStatus.unauthorized) {
      storageManager.signOut();
      navigationService.navigateToPageClear(
        path: NavigationConstants.splashRoute,
      );
    }
  }
}
