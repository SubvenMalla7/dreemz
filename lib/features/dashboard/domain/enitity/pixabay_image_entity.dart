import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay_image_entity.freezed.dart';
part 'pixabay_image_entity.g.dart';

@freezed
class PixabayResponse with _$PixabayResponse {
  const factory PixabayResponse({
    @Default(0) int total,
    @Default(0) int totalHits,
    @Default([]) List<PixabayImage> hits,
  }) = _PixabayResponse;

  factory PixabayResponse.fromJson(Map<String, dynamic> json) =>
      _$PixabayResponseFromJson(json);
}

@freezed
class PixabayImage with _$PixabayImage {
  const factory PixabayImage({
    @Default(0) int id,
    @Default('') String pageURL,
    @Default('') String type,
    @Default('') String tags,
    @Default('') String previewURL,
    @Default(0) int previewWidth,
    @Default(0) int previewHeight,
    @Default('') String webformatURL,
    @Default(0) int webformatWidth,
    @Default(0) int webformatHeight,
    @Default('') String largeImageURL,
    @Default('') String fullHDURL,
    @Default('') String imageURL,
    @Default(0) int imageWidth,
    @Default(0) int imageHeight,
    @Default(0) int imageSize,
    @Default(0) int views,
    @Default(0) int downloads,
    @Default(0) int likes,
    @Default(0) int comments,
    @Default(0) int user_id,
    @Default('') String user,
    @Default('') String userImageURL,
  }) = _PixabayImage;

  factory PixabayImage.fromJson(Map<String, dynamic> json) =>
      _$PixabayImageFromJson(json);
}
