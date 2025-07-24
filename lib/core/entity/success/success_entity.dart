import 'package:freezed_annotation/freezed_annotation.dart';

part 'success_entity.freezed.dart';

part 'success_entity.g.dart';

@freezed
abstract class SucessContainerEntity with _$SucessContainerEntity {
  const factory SucessContainerEntity({
    required SuccessEntity data,
  }) = _SucessContainerEntity;

  factory SucessContainerEntity.fromJson(Map<String, dynamic> json) =>
      _$SucessContainerEntityFromJson(json);
}

@freezed
abstract class SuccessEntity with _$SuccessEntity {
  const factory SuccessEntity({
    @Default('') String msg,
    @Default(0) int statusCode,
  }) = _SuccessEntity;

  factory SuccessEntity.fromJson(Map<String, dynamic> json) =>
      _$SuccessEntityFromJson(json);
}

@freezed
abstract class SuccessIntEntity with _$SuccessIntEntity {
  const factory SuccessIntEntity({
    @Default(0) int msg,
    @Default(0) int statusCode,
  }) = _SuccessIntEntity;

  factory SuccessIntEntity.fromJson(Map<String, dynamic> json) =>
      _$SuccessIntEntityFromJson(json);
}
