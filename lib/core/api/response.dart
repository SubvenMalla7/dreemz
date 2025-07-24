import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dreemz/core/api/data_response.dart';
import 'package:dreemz/core/entity/success/success_entity.dart';
import 'package:dreemz/core/helper/app_type_def.dart';

abstract class Response {
  static String defaultErrorMessage = "Internal Server Error";

  static String defaultConnectionError = "No internet connection";

  static String getErrorMessage(Object error) {
    String errorMessage;
    if (error is SocketException) {
      errorMessage = Response.defaultConnectionError;
    } else {
      errorMessage = Response.defaultErrorMessage;
    }
    return errorMessage;
  }
}

EitherResponse handleNetworkCall(request, [dynamic fromJsonModel]) async {
  final response = await request;

  try {
    int statusCode = response.statusCode;
    if (response != null && statusCode >= 200 && statusCode < 300) {
      if (fromJsonModel != null) {
        log(jsonEncode(response.data));
        return Right(DataResponse.success(fromJsonModel(response.data)));
      } else {
        if (response!.data == '') {
          return Right(DataResponse.success(const SuccessEntity()));
        } else {
          SuccessEntity data;
          try {
            final dynamic object = response!.data;
            data = SuccessEntity.fromJson(object as Map<String, dynamic>);
          } catch (e) {
            return Right(DataResponse.success(const SuccessEntity(msg: '')));
          }
          return Right(DataResponse.success(data, message: data.msg));
        }
      }
    } else {
      final dynamic data = response!.data;

      return Left(DataResponse.error(data['message']));
    }
  } catch (e) {
    // Handle any exceptions that may occur during JSON decoding
    log(e.toString());

    return Left(DataResponse.error(e.toString()));
  }
}
