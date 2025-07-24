import 'package:dartz/dartz.dart';
import 'package:dreemz/core/api/data_response.dart';

typedef ApiRequestCallback = Future<dynamic> Function(
  String endPoint,
  Map<String, String>? headers,
  Map<String, dynamic> data,
);

typedef EitherResponse<T>
    = Future<Either<DataResponse<String>, DataResponse<T>>>;
