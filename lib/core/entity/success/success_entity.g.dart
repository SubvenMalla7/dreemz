// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SucessContainerEntityImpl _$$SucessContainerEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SucessContainerEntityImpl(
      data: SuccessEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SucessContainerEntityImplToJson(
        _$SucessContainerEntityImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$SuccessEntityImpl _$$SuccessEntityImplFromJson(Map<String, dynamic> json) =>
    _$SuccessEntityImpl(
      msg: json['msg'] as String? ?? '',
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SuccessEntityImplToJson(_$SuccessEntityImpl instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'statusCode': instance.statusCode,
    };

_$SuccessIntEntityImpl _$$SuccessIntEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SuccessIntEntityImpl(
      msg: (json['msg'] as num?)?.toInt() ?? 0,
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SuccessIntEntityImplToJson(
        _$SuccessIntEntityImpl instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'statusCode': instance.statusCode,
    };
