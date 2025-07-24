// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'success_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SucessContainerEntity _$SucessContainerEntityFromJson(
    Map<String, dynamic> json) {
  return _SucessContainerEntity.fromJson(json);
}

/// @nodoc
mixin _$SucessContainerEntity {
  SuccessEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SucessContainerEntityCopyWith<SucessContainerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SucessContainerEntityCopyWith<$Res> {
  factory $SucessContainerEntityCopyWith(SucessContainerEntity value,
          $Res Function(SucessContainerEntity) then) =
      _$SucessContainerEntityCopyWithImpl<$Res, SucessContainerEntity>;
  @useResult
  $Res call({SuccessEntity data});

  $SuccessEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$SucessContainerEntityCopyWithImpl<$Res,
        $Val extends SucessContainerEntity>
    implements $SucessContainerEntityCopyWith<$Res> {
  _$SucessContainerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SuccessEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SuccessEntityCopyWith<$Res> get data {
    return $SuccessEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SucessContainerEntityImplCopyWith<$Res>
    implements $SucessContainerEntityCopyWith<$Res> {
  factory _$$SucessContainerEntityImplCopyWith(
          _$SucessContainerEntityImpl value,
          $Res Function(_$SucessContainerEntityImpl) then) =
      __$$SucessContainerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SuccessEntity data});

  @override
  $SuccessEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$SucessContainerEntityImplCopyWithImpl<$Res>
    extends _$SucessContainerEntityCopyWithImpl<$Res,
        _$SucessContainerEntityImpl>
    implements _$$SucessContainerEntityImplCopyWith<$Res> {
  __$$SucessContainerEntityImplCopyWithImpl(_$SucessContainerEntityImpl _value,
      $Res Function(_$SucessContainerEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SucessContainerEntityImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SuccessEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SucessContainerEntityImpl implements _SucessContainerEntity {
  const _$SucessContainerEntityImpl({required this.data});

  factory _$SucessContainerEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SucessContainerEntityImplFromJson(json);

  @override
  final SuccessEntity data;

  @override
  String toString() {
    return 'SucessContainerEntity(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SucessContainerEntityImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SucessContainerEntityImplCopyWith<_$SucessContainerEntityImpl>
      get copyWith => __$$SucessContainerEntityImplCopyWithImpl<
          _$SucessContainerEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SucessContainerEntityImplToJson(
      this,
    );
  }
}

abstract class _SucessContainerEntity implements SucessContainerEntity {
  const factory _SucessContainerEntity({required final SuccessEntity data}) =
      _$SucessContainerEntityImpl;

  factory _SucessContainerEntity.fromJson(Map<String, dynamic> json) =
      _$SucessContainerEntityImpl.fromJson;

  @override
  SuccessEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$SucessContainerEntityImplCopyWith<_$SucessContainerEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SuccessEntity _$SuccessEntityFromJson(Map<String, dynamic> json) {
  return _SuccessEntity.fromJson(json);
}

/// @nodoc
mixin _$SuccessEntity {
  String get msg => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessEntityCopyWith<SuccessEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessEntityCopyWith<$Res> {
  factory $SuccessEntityCopyWith(
          SuccessEntity value, $Res Function(SuccessEntity) then) =
      _$SuccessEntityCopyWithImpl<$Res, SuccessEntity>;
  @useResult
  $Res call({String msg, int statusCode});
}

/// @nodoc
class _$SuccessEntityCopyWithImpl<$Res, $Val extends SuccessEntity>
    implements $SuccessEntityCopyWith<$Res> {
  _$SuccessEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? statusCode = null,
  }) {
    return _then(_value.copyWith(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuccessEntityImplCopyWith<$Res>
    implements $SuccessEntityCopyWith<$Res> {
  factory _$$SuccessEntityImplCopyWith(
          _$SuccessEntityImpl value, $Res Function(_$SuccessEntityImpl) then) =
      __$$SuccessEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String msg, int statusCode});
}

/// @nodoc
class __$$SuccessEntityImplCopyWithImpl<$Res>
    extends _$SuccessEntityCopyWithImpl<$Res, _$SuccessEntityImpl>
    implements _$$SuccessEntityImplCopyWith<$Res> {
  __$$SuccessEntityImplCopyWithImpl(
      _$SuccessEntityImpl _value, $Res Function(_$SuccessEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? statusCode = null,
  }) {
    return _then(_$SuccessEntityImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuccessEntityImpl implements _SuccessEntity {
  const _$SuccessEntityImpl({this.msg = '', this.statusCode = 0});

  factory _$SuccessEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuccessEntityImplFromJson(json);

  @override
  @JsonKey()
  final String msg;
  @override
  @JsonKey()
  final int statusCode;

  @override
  String toString() {
    return 'SuccessEntity(msg: $msg, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessEntityImpl &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, msg, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessEntityImplCopyWith<_$SuccessEntityImpl> get copyWith =>
      __$$SuccessEntityImplCopyWithImpl<_$SuccessEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuccessEntityImplToJson(
      this,
    );
  }
}

abstract class _SuccessEntity implements SuccessEntity {
  const factory _SuccessEntity({final String msg, final int statusCode}) =
      _$SuccessEntityImpl;

  factory _SuccessEntity.fromJson(Map<String, dynamic> json) =
      _$SuccessEntityImpl.fromJson;

  @override
  String get msg;
  @override
  int get statusCode;
  @override
  @JsonKey(ignore: true)
  _$$SuccessEntityImplCopyWith<_$SuccessEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SuccessIntEntity _$SuccessIntEntityFromJson(Map<String, dynamic> json) {
  return _SuccessIntEntity.fromJson(json);
}

/// @nodoc
mixin _$SuccessIntEntity {
  int get msg => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessIntEntityCopyWith<SuccessIntEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessIntEntityCopyWith<$Res> {
  factory $SuccessIntEntityCopyWith(
          SuccessIntEntity value, $Res Function(SuccessIntEntity) then) =
      _$SuccessIntEntityCopyWithImpl<$Res, SuccessIntEntity>;
  @useResult
  $Res call({int msg, int statusCode});
}

/// @nodoc
class _$SuccessIntEntityCopyWithImpl<$Res, $Val extends SuccessIntEntity>
    implements $SuccessIntEntityCopyWith<$Res> {
  _$SuccessIntEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? statusCode = null,
  }) {
    return _then(_value.copyWith(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as int,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuccessIntEntityImplCopyWith<$Res>
    implements $SuccessIntEntityCopyWith<$Res> {
  factory _$$SuccessIntEntityImplCopyWith(_$SuccessIntEntityImpl value,
          $Res Function(_$SuccessIntEntityImpl) then) =
      __$$SuccessIntEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int msg, int statusCode});
}

/// @nodoc
class __$$SuccessIntEntityImplCopyWithImpl<$Res>
    extends _$SuccessIntEntityCopyWithImpl<$Res, _$SuccessIntEntityImpl>
    implements _$$SuccessIntEntityImplCopyWith<$Res> {
  __$$SuccessIntEntityImplCopyWithImpl(_$SuccessIntEntityImpl _value,
      $Res Function(_$SuccessIntEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
    Object? statusCode = null,
  }) {
    return _then(_$SuccessIntEntityImpl(
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as int,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuccessIntEntityImpl implements _SuccessIntEntity {
  const _$SuccessIntEntityImpl({this.msg = 0, this.statusCode = 0});

  factory _$SuccessIntEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuccessIntEntityImplFromJson(json);

  @override
  @JsonKey()
  final int msg;
  @override
  @JsonKey()
  final int statusCode;

  @override
  String toString() {
    return 'SuccessIntEntity(msg: $msg, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessIntEntityImpl &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, msg, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessIntEntityImplCopyWith<_$SuccessIntEntityImpl> get copyWith =>
      __$$SuccessIntEntityImplCopyWithImpl<_$SuccessIntEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuccessIntEntityImplToJson(
      this,
    );
  }
}

abstract class _SuccessIntEntity implements SuccessIntEntity {
  const factory _SuccessIntEntity({final int msg, final int statusCode}) =
      _$SuccessIntEntityImpl;

  factory _SuccessIntEntity.fromJson(Map<String, dynamic> json) =
      _$SuccessIntEntityImpl.fromJson;

  @override
  int get msg;
  @override
  int get statusCode;
  @override
  @JsonKey(ignore: true)
  _$$SuccessIntEntityImplCopyWith<_$SuccessIntEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
