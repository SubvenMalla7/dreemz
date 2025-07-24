import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:dreemz/core/api/request.dart';
import 'package:dreemz/core/constant/api_constants.dart';
import 'package:dreemz/core/constant/colors.dart';
import 'package:dreemz/core/routes/app_routes.dart';
import 'package:dreemz/core/service/internet_connection.dart';

import 'package:dreemz/core/util/build_text.dart';
import 'package:dreemz/main.dart';

@injectable
class RequestClient {
  factory RequestClient() {
    _instance ??= RequestClient._internal();
    return _instance!;
  }

  RequestClient._internal() {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30), // 60 seconds
        receiveTimeout: const Duration(seconds: 30) // 60 seconds
        );
    _client = Dio(options);
    init();
    _client.options.requestEncoder = (string, request) => utf8.encode(string);
  }

  static const String userAgent = 'User-Agent';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';

  // CookieManager cookieManager = CookieManager(cookieJar);

  static RequestClient? _instance;
  late Dio _client;

  List<Cookie> cookies = [];
  bool isRefreshTokenHit = false;
  bool isSessionExpiredShown = false;
  bool isServerShown = false;
  bool isServerRejectShown = false;
  bool isInternalServerShown = false;
  bool isNoInternetShown = false;

  init() async {
    _client.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));

    _client.options.headers.addAll({
      'accept': 'application/json',
      'Content-Type': 'application/json',
    });
    _client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          handler.next(options);
        },
        onResponse: (r, handler) {
          handler.next(r);
        },
        onError: (error, handler) async {
          if (error.response == null) {
            apiHandleFunction(
                Response(
                  requestOptions: RequestOptions(),
                  statusCode: 500,
                  statusMessage: 'Internal Server Error',
                ),
                '');
          } else if (error.response?.statusCode == 401) {
            if (!error.response!.requestOptions.path
                    .contains(ApiConstants.refreshToken) &&
                !error.response!.requestOptions.path
                    .contains(ApiConstants.logout)) {
              if (!isRefreshTokenHit) {
                //hit refresh token
              }
              handler.reject(error);
            } else if (error.response!.requestOptions.path
                .contains(ApiConstants.refreshToken)) {
              apiHandleFunction(
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 401,
                    statusMessage: '',
                  ),
                  '');
              handler.reject(error);
            } else if (error.response?.statusCode.toString()[0] == "5" ||
                error.response?.statusCode == 404 ||
                error.response?.statusCode == 422) {
              handler.reject(error);
            } else {
              handler.next(error);
            }
          } else if (error.response?.statusCode.toString()[0] == "5" ||
              error.response?.statusCode == 404 ||
              error.response?.statusCode == 422) {
            handler.reject(error);
          }
        },
      ),
    );
  }

  Future<Response?> put(
      {required String endPoint,
      Map<String, String>? headers,
      dynamic data,
      Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      bool isInternet = await CheckInternetConnection().hasInternet();
      debugPrint('-------------------------------');
      debugPrint('PUT Request');
      debugPrint(endPoint);
      debugPrint('HEADER : ${headers.toString()}');
      debugPrint('-------------------------------');
      if (isInternet) {
        Map<String, dynamic>? headers = Request.createHeader();

        response = await _client.put(
          Request.createUrl(endPoint),
          options: Options(
            headers: headers,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ),
          data: data != null ? jsonEncode(data) : {},
          queryParameters: queryParameters,
        );
        await apiHandleFunction(response, endPoint);
        return response; // Call the function here
      } else {
        response = Response(
          requestOptions: RequestOptions(),
          statusCode: 508,
          statusMessage: '',
        );
        await apiHandleFunction(response, endPoint);
        return response;
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      debugPrint(e.response.toString());

      await apiHandleFunction(e.response!, endPoint);
      return e.response;
    }
  }

  Future<Response?> postJson({
    required String endPoint,
    Map<String, String>? headers,
    dynamic data,
    dynamic formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    try {
      bool isInternet = await CheckInternetConnection().hasInternet();

      Map<String, dynamic>? header = Request.createHeader();
      if (isInternet) {
        response = await _client.post(
          Request.createUrl(endPoint),
          options: Options(
            headers: header,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            validateStatus: (status) {
              return status != null && status < 500;
            },
          ),
          data: data != null ? jsonEncode(data) : formData ?? {},
          queryParameters: queryParameters,
        );
        await apiHandleFunction(response, endPoint);
        return response;
      } else {
        response = Response(
          requestOptions: RequestOptions(),
          statusCode: 508,
          statusMessage: 'No Internet Connection',
        );
        await apiHandleFunction(response, endPoint);
        return response;
      }
    } on DioException catch (e) {
      await apiHandleFunction(e.response!, endPoint);
      return e.response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response?> get({
    required String endPoint,
    Map<String, String>? headers,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    try {
      bool isInternet = await CheckInternetConnection().hasInternet();
      debugPrint('GET Request');
      debugPrint(endPoint);
      debugPrint(headers.toString());
      debugPrint('-------------------------------');
      if (isInternet) {
        response = await _client.get(Request.createUrl(endPoint),
            options: Options(
              headers: Request.createHeader(),
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
            ),
            data: data,
            queryParameters: queryParameters);
        await apiHandleFunction(response, endPoint);
        return response;
      } else {
        response = Response(
          requestOptions: RequestOptions(),
          statusCode: 508,
          statusMessage: '',
        );
        await apiHandleFunction(response, endPoint);
        return response;
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      debugPrint(e.response.toString());
      await apiHandleFunction(e.response!, endPoint);
      return e.response;
    }
  }

  Future<Response?> delete(
      {required String endPoint,
      Map<String, String>? headers,
      dynamic data,
      Map<String, dynamic>? queryParameters}) async {
    Response response;
    try {
      bool isInternet = await CheckInternetConnection().hasInternet();
      debugPrint('-------------------------------');
      debugPrint('PUT Request');
      debugPrint(endPoint);
      debugPrint('HEADER : ${headers.toString()}');
      debugPrint('-------------------------------');
      if (isInternet) {
        Map<String, dynamic>? headers = Request.createHeader();

        response = await _client.delete(
          Request.createUrl(endPoint),
          options: Options(
            headers: headers,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ),
          data: data != null ? jsonDecode(data.toString()) : {},
          queryParameters: queryParameters,
        );

        return response; // Call the function here
      } else {
        response = Response(
          requestOptions: RequestOptions(),
          statusCode: 508,
          statusMessage: '',
        );
        await apiHandleFunction(response, endPoint);
        return response;
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      debugPrint(e.response.toString());
      await apiHandleFunction(e.response!, endPoint);
      return e.response;
    }
  }

  Future<Response?> uploadMultipartFileList(
      {required FormData formData,
      required String endPoint,
      required Map<String, dynamic>? headers}) async {
    try {
      _client.options.contentType = 'multipart/form-data';
      _client.options.headers = headers;

      final response = await _client.post(
        Request.createUrl(endPoint),
        data: formData,
      );
      await apiHandleFunction(response, endPoint);
      return response;
    } on DioException catch (e) {
      await apiHandleFunction(e.response!, endPoint);
      return e.response;
    }
  }

  Future<void> apiHandleFunction(Response<dynamic> response, String url) async {
    try {
      switch (response.data['status_code']) {
        case 401:
          if (!isSessionExpiredShown) {
            isSessionExpiredShown = true;

            showErrorPopup(navigatorKey.currentContext!,
                title: "Session Expired",
                message: "Please Login Again", onPressed: () async {
              isSessionExpiredShown = false;
              Navigator.of(navigatorKey.currentContext!)
                  .popUntil((route) => route.isFirst);
              Navigator.of(navigatorKey.currentContext!)
                  .pushReplacementNamed(AppRouter.dashboardScreen);
            });
          }
          break;
        case 403 || 404 || 400 || 422:
          final dynamic data = response.data;

          showErrorPopup(
            navigatorKey.currentContext!,
            title: 'Error',
            message: data['msg'],
          );

          break;
        case 508:
          if (!isNoInternetShown) {
            isNoInternetShown = true;
            showErrorPopup(navigatorKey.currentContext!,
                title: "Connection error",
                message: 'No Internet Connection.', onPressed: () {
              isNoInternetShown = false;
              Navigator.of(navigatorKey.currentContext!).pop();
            });
          }
          break;
        case 502 || 500 || 503 || 429:
          if (!isInternalServerShown) {
            isInternalServerShown = true;
            showErrorPopup(
              navigatorKey.currentContext!,
              title: 'Server Error',
              message: 'Internal Server Error.',
              onPressed: () {
                isInternalServerShown = false;
                Navigator.of(navigatorKey.currentContext!).pop();
              },
            );
          }
          break;
        default:
          break;
      }
    } catch (e) {
      log(e.toString());
      showErrorPopup(navigatorKey.currentContext!,
          title: 'Internal Server Error',
          message: 'Please try again later.', onPressed: () async {
        isSessionExpiredShown = false;
        Navigator.of(navigatorKey.currentContext!).pop();
      });
    }
  }
}

void showErrorPopup(BuildContext context,
    {required String title,
    required String message,
    void Function()? onPressed,
    bool isSecondButton = false,
    void Function()? onSecondButtonPressed,
    String? secondButtonText,
    String? firstButtonText}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: BuildText(
          text: title,
          fontSize: 14.sp,
          color: AppColors.loginAppBarColor,
          weight: FontWeight.w500,
        ),
        content: BuildText(
          text: message.isNotEmpty ? message : 'Internal Server Error',
          fontSize: 12.sp,
          maxLines: 1000,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed ??
                () {
                  // Close the dialog
                  Navigator.of(context).pop();
                },
            child: Text(firstButtonText ?? 'OK'),
          ),
          if (isSecondButton)
            TextButton(
              onPressed: onSecondButtonPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
              child: Text(secondButtonText ?? 'OK'),
            ),
        ],
      );
    },
  );
}
