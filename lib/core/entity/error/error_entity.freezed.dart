// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorEntity _$ErrorEntityFromJson(Map<String, dynamic> json) {
  return _ErrorEntity.fromJson(json);
}

/// @nodoc
mixin _$ErrorEntity {
  List<ErrorData> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorEntityCopyWith<ErrorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorEntityCopyWith<$Res> {
  factory $ErrorEntityCopyWith(
          ErrorEntity value, $Res Function(ErrorEntity) then) =
      _$ErrorEntityCopyWithImpl<$Res, ErrorEntity>;
  @useResult
  $Res call({List<ErrorData> errors});
}

/// @nodoc
class _$ErrorEntityCopyWithImpl<$Res, $Val extends ErrorEntity>
    implements $ErrorEntityCopyWith<$Res> {
  _$ErrorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ErrorData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorEntityImplCopyWith<$Res>
    implements $ErrorEntityCopyWith<$Res> {
  factory _$$ErrorEntityImplCopyWith(
          _$ErrorEntityImpl value, $Res Function(_$ErrorEntityImpl) then) =
      __$$ErrorEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ErrorData> errors});
}

/// @nodoc
class __$$ErrorEntityImplCopyWithImpl<$Res>
    extends _$ErrorEntityCopyWithImpl<$Res, _$ErrorEntityImpl>
    implements _$$ErrorEntityImplCopyWith<$Res> {
  __$$ErrorEntityImplCopyWithImpl(
      _$ErrorEntityImpl _value, $Res Function(_$ErrorEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errors = null,
  }) {
    return _then(_$ErrorEntityImpl(
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ErrorData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorEntityImpl implements _ErrorEntity {
  const _$ErrorEntityImpl({final List<ErrorData> errors = const []})
      : _errors = errors;

  factory _$ErrorEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorEntityImplFromJson(json);

  final List<ErrorData> _errors;
  @override
  @JsonKey()
  List<ErrorData> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'ErrorEntity(errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorEntityImpl &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorEntityImplCopyWith<_$ErrorEntityImpl> get copyWith =>
      __$$ErrorEntityImplCopyWithImpl<_$ErrorEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorEntityImplToJson(
      this,
    );
  }
}

abstract class _ErrorEntity implements ErrorEntity {
  const factory _ErrorEntity({final List<ErrorData> errors}) =
      _$ErrorEntityImpl;

  factory _ErrorEntity.fromJson(Map<String, dynamic> json) =
      _$ErrorEntityImpl.fromJson;

  @override
  List<ErrorData> get errors;
  @override
  @JsonKey(ignore: true)
  _$$ErrorEntityImplCopyWith<_$ErrorEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ErrorData _$ErrorDataFromJson(Map<String, dynamic> json) {
  return _ErrorData.fromJson(json);
}

/// @nodoc
mixin _$ErrorData {
  String get title => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  dynamic get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorDataCopyWith<ErrorData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDataCopyWith<$Res> {
  factory $ErrorDataCopyWith(ErrorData value, $Res Function(ErrorData) then) =
      _$ErrorDataCopyWithImpl<$Res, ErrorData>;
  @useResult
  $Res call({String title, String detail, dynamic code});
}

/// @nodoc
class _$ErrorDataCopyWithImpl<$Res, $Val extends ErrorData>
    implements $ErrorDataCopyWith<$Res> {
  _$ErrorDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? detail = null,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorDataImplCopyWith<$Res>
    implements $ErrorDataCopyWith<$Res> {
  factory _$$ErrorDataImplCopyWith(
          _$ErrorDataImpl value, $Res Function(_$ErrorDataImpl) then) =
      __$$ErrorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String detail, dynamic code});
}

/// @nodoc
class __$$ErrorDataImplCopyWithImpl<$Res>
    extends _$ErrorDataCopyWithImpl<$Res, _$ErrorDataImpl>
    implements _$$ErrorDataImplCopyWith<$Res> {
  __$$ErrorDataImplCopyWithImpl(
      _$ErrorDataImpl _value, $Res Function(_$ErrorDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? detail = null,
    Object? code = freezed,
  }) {
    return _then(_$ErrorDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorDataImpl implements _ErrorData {
  const _$ErrorDataImpl(
      {this.title = 'Error', this.detail = 'Something went wrong.', this.code});

  factory _$ErrorDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorDataImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String detail;
  @override
  final dynamic code;

  @override
  String toString() {
    return 'ErrorData(title: $title, detail: $detail, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, detail, const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDataImplCopyWith<_$ErrorDataImpl> get copyWith =>
      __$$ErrorDataImplCopyWithImpl<_$ErrorDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorDataImplToJson(
      this,
    );
  }
}

abstract class _ErrorData implements ErrorData {
  const factory _ErrorData(
      {final String title,
      final String detail,
      final dynamic code}) = _$ErrorDataImpl;

  factory _ErrorData.fromJson(Map<String, dynamic> json) =
      _$ErrorDataImpl.fromJson;

  @override
  String get title;
  @override
  String get detail;
  @override
  dynamic get code;
  @override
  @JsonKey(ignore: true)
  _$$ErrorDataImplCopyWith<_$ErrorDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
