// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_image_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PixabayResponseImpl _$$PixabayResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PixabayResponseImpl(
      total: (json['total'] as num?)?.toInt() ?? 0,
      totalHits: (json['totalHits'] as num?)?.toInt() ?? 0,
      hits: (json['hits'] as List<dynamic>?)
              ?.map((e) => PixabayImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PixabayResponseImplToJson(
        _$PixabayResponseImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };

_$PixabayImageImpl _$$PixabayImageImplFromJson(Map<String, dynamic> json) =>
    _$PixabayImageImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      pageURL: json['pageURL'] as String? ?? '',
      type: json['type'] as String? ?? '',
      tags: json['tags'] as String? ?? '',
      previewURL: json['previewURL'] as String? ?? '',
      previewWidth: (json['previewWidth'] as num?)?.toInt() ?? 0,
      previewHeight: (json['previewHeight'] as num?)?.toInt() ?? 0,
      webformatURL: json['webformatURL'] as String? ?? '',
      webformatWidth: (json['webformatWidth'] as num?)?.toInt() ?? 0,
      webformatHeight: (json['webformatHeight'] as num?)?.toInt() ?? 0,
      largeImageURL: json['largeImageURL'] as String? ?? '',
      fullHDURL: json['fullHDURL'] as String? ?? '',
      imageURL: json['imageURL'] as String? ?? '',
      imageWidth: (json['imageWidth'] as num?)?.toInt() ?? 0,
      imageHeight: (json['imageHeight'] as num?)?.toInt() ?? 0,
      imageSize: (json['imageSize'] as num?)?.toInt() ?? 0,
      views: (json['views'] as num?)?.toInt() ?? 0,
      downloads: (json['downloads'] as num?)?.toInt() ?? 0,
      likes: (json['likes'] as num?)?.toInt() ?? 0,
      comments: (json['comments'] as num?)?.toInt() ?? 0,
      user_id: (json['user_id'] as num?)?.toInt() ?? 0,
      user: json['user'] as String? ?? '',
      userImageURL: json['userImageURL'] as String? ?? '',
    );

Map<String, dynamic> _$$PixabayImageImplToJson(_$PixabayImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageURL,
      'type': instance.type,
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'previewWidth': instance.previewWidth,
      'previewHeight': instance.previewHeight,
      'webformatURL': instance.webformatURL,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageURL,
      'fullHDURL': instance.fullHDURL,
      'imageURL': instance.imageURL,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'likes': instance.likes,
      'comments': instance.comments,
      'user_id': instance.user_id,
      'user': instance.user,
      'userImageURL': instance.userImageURL,
    };
