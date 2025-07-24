// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pixabay_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PixabayResponse _$PixabayResponseFromJson(Map<String, dynamic> json) {
  return _PixabayResponse.fromJson(json);
}

/// @nodoc
mixin _$PixabayResponse {
  int get total => throw _privateConstructorUsedError;
  int get totalHits => throw _privateConstructorUsedError;
  List<PixabayImage> get hits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PixabayResponseCopyWith<PixabayResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixabayResponseCopyWith<$Res> {
  factory $PixabayResponseCopyWith(
          PixabayResponse value, $Res Function(PixabayResponse) then) =
      _$PixabayResponseCopyWithImpl<$Res, PixabayResponse>;
  @useResult
  $Res call({int total, int totalHits, List<PixabayImage> hits});
}

/// @nodoc
class _$PixabayResponseCopyWithImpl<$Res, $Val extends PixabayResponse>
    implements $PixabayResponseCopyWith<$Res> {
  _$PixabayResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalHits = null,
    Object? hits = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalHits: null == totalHits
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int,
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<PixabayImage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PixabayResponseImplCopyWith<$Res>
    implements $PixabayResponseCopyWith<$Res> {
  factory _$$PixabayResponseImplCopyWith(_$PixabayResponseImpl value,
          $Res Function(_$PixabayResponseImpl) then) =
      __$$PixabayResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int totalHits, List<PixabayImage> hits});
}

/// @nodoc
class __$$PixabayResponseImplCopyWithImpl<$Res>
    extends _$PixabayResponseCopyWithImpl<$Res, _$PixabayResponseImpl>
    implements _$$PixabayResponseImplCopyWith<$Res> {
  __$$PixabayResponseImplCopyWithImpl(
      _$PixabayResponseImpl _value, $Res Function(_$PixabayResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalHits = null,
    Object? hits = null,
  }) {
    return _then(_$PixabayResponseImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalHits: null == totalHits
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int,
      hits: null == hits
          ? _value._hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<PixabayImage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixabayResponseImpl implements _PixabayResponse {
  const _$PixabayResponseImpl(
      {this.total = 0,
      this.totalHits = 0,
      final List<PixabayImage> hits = const []})
      : _hits = hits;

  factory _$PixabayResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixabayResponseImplFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int totalHits;
  final List<PixabayImage> _hits;
  @override
  @JsonKey()
  List<PixabayImage> get hits {
    if (_hits is EqualUnmodifiableListView) return _hits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hits);
  }

  @override
  String toString() {
    return 'PixabayResponse(total: $total, totalHits: $totalHits, hits: $hits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixabayResponseImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalHits, totalHits) ||
                other.totalHits == totalHits) &&
            const DeepCollectionEquality().equals(other._hits, _hits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, totalHits,
      const DeepCollectionEquality().hash(_hits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PixabayResponseImplCopyWith<_$PixabayResponseImpl> get copyWith =>
      __$$PixabayResponseImplCopyWithImpl<_$PixabayResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixabayResponseImplToJson(
      this,
    );
  }
}

abstract class _PixabayResponse implements PixabayResponse {
  const factory _PixabayResponse(
      {final int total,
      final int totalHits,
      final List<PixabayImage> hits}) = _$PixabayResponseImpl;

  factory _PixabayResponse.fromJson(Map<String, dynamic> json) =
      _$PixabayResponseImpl.fromJson;

  @override
  int get total;
  @override
  int get totalHits;
  @override
  List<PixabayImage> get hits;
  @override
  @JsonKey(ignore: true)
  _$$PixabayResponseImplCopyWith<_$PixabayResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PixabayImage _$PixabayImageFromJson(Map<String, dynamic> json) {
  return _PixabayImage.fromJson(json);
}

/// @nodoc
mixin _$PixabayImage {
  int get id => throw _privateConstructorUsedError;
  String get pageURL => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get tags => throw _privateConstructorUsedError;
  String get previewURL => throw _privateConstructorUsedError;
  int get previewWidth => throw _privateConstructorUsedError;
  int get previewHeight => throw _privateConstructorUsedError;
  String get webformatURL => throw _privateConstructorUsedError;
  int get webformatWidth => throw _privateConstructorUsedError;
  int get webformatHeight => throw _privateConstructorUsedError;
  String get largeImageURL => throw _privateConstructorUsedError;
  String get fullHDURL => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  int get imageWidth => throw _privateConstructorUsedError;
  int get imageHeight => throw _privateConstructorUsedError;
  int get imageSize => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  int get downloads => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get userImageURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PixabayImageCopyWith<PixabayImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixabayImageCopyWith<$Res> {
  factory $PixabayImageCopyWith(
          PixabayImage value, $Res Function(PixabayImage) then) =
      _$PixabayImageCopyWithImpl<$Res, PixabayImage>;
  @useResult
  $Res call(
      {int id,
      String pageURL,
      String type,
      String tags,
      String previewURL,
      int previewWidth,
      int previewHeight,
      String webformatURL,
      int webformatWidth,
      int webformatHeight,
      String largeImageURL,
      String fullHDURL,
      String imageURL,
      int imageWidth,
      int imageHeight,
      int imageSize,
      int views,
      int downloads,
      int likes,
      int comments,
      int user_id,
      String user,
      String userImageURL});
}

/// @nodoc
class _$PixabayImageCopyWithImpl<$Res, $Val extends PixabayImage>
    implements $PixabayImageCopyWith<$Res> {
  _$PixabayImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pageURL = null,
    Object? type = null,
    Object? tags = null,
    Object? previewURL = null,
    Object? previewWidth = null,
    Object? previewHeight = null,
    Object? webformatURL = null,
    Object? webformatWidth = null,
    Object? webformatHeight = null,
    Object? largeImageURL = null,
    Object? fullHDURL = null,
    Object? imageURL = null,
    Object? imageWidth = null,
    Object? imageHeight = null,
    Object? imageSize = null,
    Object? views = null,
    Object? downloads = null,
    Object? likes = null,
    Object? comments = null,
    Object? user_id = null,
    Object? user = null,
    Object? userImageURL = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pageURL: null == pageURL
          ? _value.pageURL
          : pageURL // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
      previewURL: null == previewURL
          ? _value.previewURL
          : previewURL // ignore: cast_nullable_to_non_nullable
              as String,
      previewWidth: null == previewWidth
          ? _value.previewWidth
          : previewWidth // ignore: cast_nullable_to_non_nullable
              as int,
      previewHeight: null == previewHeight
          ? _value.previewHeight
          : previewHeight // ignore: cast_nullable_to_non_nullable
              as int,
      webformatURL: null == webformatURL
          ? _value.webformatURL
          : webformatURL // ignore: cast_nullable_to_non_nullable
              as String,
      webformatWidth: null == webformatWidth
          ? _value.webformatWidth
          : webformatWidth // ignore: cast_nullable_to_non_nullable
              as int,
      webformatHeight: null == webformatHeight
          ? _value.webformatHeight
          : webformatHeight // ignore: cast_nullable_to_non_nullable
              as int,
      largeImageURL: null == largeImageURL
          ? _value.largeImageURL
          : largeImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      fullHDURL: null == fullHDURL
          ? _value.fullHDURL
          : fullHDURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageWidth: null == imageWidth
          ? _value.imageWidth
          : imageWidth // ignore: cast_nullable_to_non_nullable
              as int,
      imageHeight: null == imageHeight
          ? _value.imageHeight
          : imageHeight // ignore: cast_nullable_to_non_nullable
              as int,
      imageSize: null == imageSize
          ? _value.imageSize
          : imageSize // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      downloads: null == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PixabayImageImplCopyWith<$Res>
    implements $PixabayImageCopyWith<$Res> {
  factory _$$PixabayImageImplCopyWith(
          _$PixabayImageImpl value, $Res Function(_$PixabayImageImpl) then) =
      __$$PixabayImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String pageURL,
      String type,
      String tags,
      String previewURL,
      int previewWidth,
      int previewHeight,
      String webformatURL,
      int webformatWidth,
      int webformatHeight,
      String largeImageURL,
      String fullHDURL,
      String imageURL,
      int imageWidth,
      int imageHeight,
      int imageSize,
      int views,
      int downloads,
      int likes,
      int comments,
      int user_id,
      String user,
      String userImageURL});
}

/// @nodoc
class __$$PixabayImageImplCopyWithImpl<$Res>
    extends _$PixabayImageCopyWithImpl<$Res, _$PixabayImageImpl>
    implements _$$PixabayImageImplCopyWith<$Res> {
  __$$PixabayImageImplCopyWithImpl(
      _$PixabayImageImpl _value, $Res Function(_$PixabayImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pageURL = null,
    Object? type = null,
    Object? tags = null,
    Object? previewURL = null,
    Object? previewWidth = null,
    Object? previewHeight = null,
    Object? webformatURL = null,
    Object? webformatWidth = null,
    Object? webformatHeight = null,
    Object? largeImageURL = null,
    Object? fullHDURL = null,
    Object? imageURL = null,
    Object? imageWidth = null,
    Object? imageHeight = null,
    Object? imageSize = null,
    Object? views = null,
    Object? downloads = null,
    Object? likes = null,
    Object? comments = null,
    Object? user_id = null,
    Object? user = null,
    Object? userImageURL = null,
  }) {
    return _then(_$PixabayImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pageURL: null == pageURL
          ? _value.pageURL
          : pageURL // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
      previewURL: null == previewURL
          ? _value.previewURL
          : previewURL // ignore: cast_nullable_to_non_nullable
              as String,
      previewWidth: null == previewWidth
          ? _value.previewWidth
          : previewWidth // ignore: cast_nullable_to_non_nullable
              as int,
      previewHeight: null == previewHeight
          ? _value.previewHeight
          : previewHeight // ignore: cast_nullable_to_non_nullable
              as int,
      webformatURL: null == webformatURL
          ? _value.webformatURL
          : webformatURL // ignore: cast_nullable_to_non_nullable
              as String,
      webformatWidth: null == webformatWidth
          ? _value.webformatWidth
          : webformatWidth // ignore: cast_nullable_to_non_nullable
              as int,
      webformatHeight: null == webformatHeight
          ? _value.webformatHeight
          : webformatHeight // ignore: cast_nullable_to_non_nullable
              as int,
      largeImageURL: null == largeImageURL
          ? _value.largeImageURL
          : largeImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      fullHDURL: null == fullHDURL
          ? _value.fullHDURL
          : fullHDURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageWidth: null == imageWidth
          ? _value.imageWidth
          : imageWidth // ignore: cast_nullable_to_non_nullable
              as int,
      imageHeight: null == imageHeight
          ? _value.imageHeight
          : imageHeight // ignore: cast_nullable_to_non_nullable
              as int,
      imageSize: null == imageSize
          ? _value.imageSize
          : imageSize // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      downloads: null == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixabayImageImpl implements _PixabayImage {
  const _$PixabayImageImpl(
      {this.id = 0,
      this.pageURL = '',
      this.type = '',
      this.tags = '',
      this.previewURL = '',
      this.previewWidth = 0,
      this.previewHeight = 0,
      this.webformatURL = '',
      this.webformatWidth = 0,
      this.webformatHeight = 0,
      this.largeImageURL = '',
      this.fullHDURL = '',
      this.imageURL = '',
      this.imageWidth = 0,
      this.imageHeight = 0,
      this.imageSize = 0,
      this.views = 0,
      this.downloads = 0,
      this.likes = 0,
      this.comments = 0,
      this.user_id = 0,
      this.user = '',
      this.userImageURL = ''});

  factory _$PixabayImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixabayImageImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String pageURL;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String tags;
  @override
  @JsonKey()
  final String previewURL;
  @override
  @JsonKey()
  final int previewWidth;
  @override
  @JsonKey()
  final int previewHeight;
  @override
  @JsonKey()
  final String webformatURL;
  @override
  @JsonKey()
  final int webformatWidth;
  @override
  @JsonKey()
  final int webformatHeight;
  @override
  @JsonKey()
  final String largeImageURL;
  @override
  @JsonKey()
  final String fullHDURL;
  @override
  @JsonKey()
  final String imageURL;
  @override
  @JsonKey()
  final int imageWidth;
  @override
  @JsonKey()
  final int imageHeight;
  @override
  @JsonKey()
  final int imageSize;
  @override
  @JsonKey()
  final int views;
  @override
  @JsonKey()
  final int downloads;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final int comments;
  @override
  @JsonKey()
  final int user_id;
  @override
  @JsonKey()
  final String user;
  @override
  @JsonKey()
  final String userImageURL;

  @override
  String toString() {
    return 'PixabayImage(id: $id, pageURL: $pageURL, type: $type, tags: $tags, previewURL: $previewURL, previewWidth: $previewWidth, previewHeight: $previewHeight, webformatURL: $webformatURL, webformatWidth: $webformatWidth, webformatHeight: $webformatHeight, largeImageURL: $largeImageURL, fullHDURL: $fullHDURL, imageURL: $imageURL, imageWidth: $imageWidth, imageHeight: $imageHeight, imageSize: $imageSize, views: $views, downloads: $downloads, likes: $likes, comments: $comments, user_id: $user_id, user: $user, userImageURL: $userImageURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixabayImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pageURL, pageURL) || other.pageURL == pageURL) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.previewURL, previewURL) ||
                other.previewURL == previewURL) &&
            (identical(other.previewWidth, previewWidth) ||
                other.previewWidth == previewWidth) &&
            (identical(other.previewHeight, previewHeight) ||
                other.previewHeight == previewHeight) &&
            (identical(other.webformatURL, webformatURL) ||
                other.webformatURL == webformatURL) &&
            (identical(other.webformatWidth, webformatWidth) ||
                other.webformatWidth == webformatWidth) &&
            (identical(other.webformatHeight, webformatHeight) ||
                other.webformatHeight == webformatHeight) &&
            (identical(other.largeImageURL, largeImageURL) ||
                other.largeImageURL == largeImageURL) &&
            (identical(other.fullHDURL, fullHDURL) ||
                other.fullHDURL == fullHDURL) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.imageWidth, imageWidth) ||
                other.imageWidth == imageWidth) &&
            (identical(other.imageHeight, imageHeight) ||
                other.imageHeight == imageHeight) &&
            (identical(other.imageSize, imageSize) ||
                other.imageSize == imageSize) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.downloads, downloads) ||
                other.downloads == downloads) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userImageURL, userImageURL) ||
                other.userImageURL == userImageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        pageURL,
        type,
        tags,
        previewURL,
        previewWidth,
        previewHeight,
        webformatURL,
        webformatWidth,
        webformatHeight,
        largeImageURL,
        fullHDURL,
        imageURL,
        imageWidth,
        imageHeight,
        imageSize,
        views,
        downloads,
        likes,
        comments,
        user_id,
        user,
        userImageURL
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PixabayImageImplCopyWith<_$PixabayImageImpl> get copyWith =>
      __$$PixabayImageImplCopyWithImpl<_$PixabayImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixabayImageImplToJson(
      this,
    );
  }
}

abstract class _PixabayImage implements PixabayImage {
  const factory _PixabayImage(
      {final int id,
      final String pageURL,
      final String type,
      final String tags,
      final String previewURL,
      final int previewWidth,
      final int previewHeight,
      final String webformatURL,
      final int webformatWidth,
      final int webformatHeight,
      final String largeImageURL,
      final String fullHDURL,
      final String imageURL,
      final int imageWidth,
      final int imageHeight,
      final int imageSize,
      final int views,
      final int downloads,
      final int likes,
      final int comments,
      final int user_id,
      final String user,
      final String userImageURL}) = _$PixabayImageImpl;

  factory _PixabayImage.fromJson(Map<String, dynamic> json) =
      _$PixabayImageImpl.fromJson;

  @override
  int get id;
  @override
  String get pageURL;
  @override
  String get type;
  @override
  String get tags;
  @override
  String get previewURL;
  @override
  int get previewWidth;
  @override
  int get previewHeight;
  @override
  String get webformatURL;
  @override
  int get webformatWidth;
  @override
  int get webformatHeight;
  @override
  String get largeImageURL;
  @override
  String get fullHDURL;
  @override
  String get imageURL;
  @override
  int get imageWidth;
  @override
  int get imageHeight;
  @override
  int get imageSize;
  @override
  int get views;
  @override
  int get downloads;
  @override
  int get likes;
  @override
  int get comments;
  @override
  int get user_id;
  @override
  String get user;
  @override
  String get userImageURL;
  @override
  @JsonKey(ignore: true)
  _$$PixabayImageImplCopyWith<_$PixabayImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
