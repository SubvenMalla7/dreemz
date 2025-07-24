import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_entity.freezed.dart';

part 'error_entity.g.dart';

@freezed
abstract class ErrorEntity with _$ErrorEntity {
  const factory ErrorEntity({
    @Default([]) List<ErrorData> errors,
  }) = _ErrorEntity;

  factory ErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorEntityFromJson(json);
}

@freezed
class ErrorData with _$ErrorData {
  const factory ErrorData({
    @Default('Error') String title,
    @Default('Something went wrong.') String detail,
    dynamic code,
  }) = _ErrorData;

  factory ErrorData.fromJson(Map<String, dynamic> json) =>
      _$ErrorDataFromJson(json);
}
