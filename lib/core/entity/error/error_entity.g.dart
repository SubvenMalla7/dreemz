// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorEntityImpl _$$ErrorEntityImplFromJson(Map<String, dynamic> json) =>
    _$ErrorEntityImpl(
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => ErrorData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ErrorEntityImplToJson(_$ErrorEntityImpl instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

_$ErrorDataImpl _$$ErrorDataImplFromJson(Map<String, dynamic> json) =>
    _$ErrorDataImpl(
      title: json['title'] as String? ?? 'Error',
      detail: json['detail'] as String? ?? 'Something went wrong.',
      code: json['code'],
    );

Map<String, dynamic> _$$ErrorDataImplToJson(_$ErrorDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'code': instance.code,
    };
