/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Poppins-Bold.ttf
  String get poppinsBold => 'assets/fonts/Poppins-Bold.ttf';

  /// File path: assets/fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';

  /// File path: assets/fonts/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/Poppins-SemiBold.ttf';

  /// File path: assets/fonts/Poppins-Thin.ttf
  String get poppinsThin => 'assets/fonts/Poppins-Thin.ttf';

  /// List of all assets
  List<String> get values => [
    poppinsBold,
    poppinsRegular,
    poppinsSemiBold,
    poppinsThin,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/esewa.jpg
  AssetGenImage get esewa => const AssetGenImage('assets/images/esewa.jpg');

  /// File path: assets/images/fonepay.png
  AssetGenImage get fonepay => const AssetGenImage('assets/images/fonepay.png');

  /// File path: assets/images/login_bg.png
  AssetGenImage get loginBg =>
      const AssetGenImage('assets/images/login_bg.png');

  /// File path: assets/images/login_bg_mobile.png
  AssetGenImage get loginBgMobile =>
      const AssetGenImage('assets/images/login_bg_mobile.png');

  /// File path: assets/images/login_bg_tablet.png
  AssetGenImage get loginBgTablet =>
      const AssetGenImage('assets/images/login_bg_tablet.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    esewa,
    fonepay,
    loginBg,
    loginBgMobile,
    loginBgTablet,
  ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/splash.json
  String get splash => 'assets/lottie/splash.json';

  /// List of all assets
  List<String> get values => [splash];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/COD.svg
  String get cod => 'assets/svg/COD.svg';

  /// File path: assets/svg/card.svg
  String get card => 'assets/svg/card.svg';

  /// File path: assets/svg/filter.svg
  String get filter => 'assets/svg/filter.svg';

  /// File path: assets/svg/notification_circle.svg
  String get notificationCircle => 'assets/svg/notification_circle.svg';

  /// File path: assets/svg/receipt.svg
  String get receipt => 'assets/svg/receipt.svg';

  /// File path: assets/svg/search.svg
  String get search => 'assets/svg/search.svg';

  /// File path: assets/svg/table_chair_1.svg
  String get tableChair1 => 'assets/svg/table_chair_1.svg';

  /// File path: assets/svg/table_chair_2.svg
  String get tableChair2 => 'assets/svg/table_chair_2.svg';

  /// File path: assets/svg/table_chair_4.svg
  String get tableChair4 => 'assets/svg/table_chair_4.svg';

  /// File path: assets/svg/table_chair_6.svg
  String get tableChair6 => 'assets/svg/table_chair_6.svg';

  /// List of all assets
  List<String> get values => [
    cod,
    card,
    filter,
    notificationCircle,
    receipt,
    search,
    tableChair1,
    tableChair2,
    tableChair4,
    tableChair6,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/hi.json
  String get hi => 'assets/translations/hi.json';

  /// File path: assets/translations/ne.json
  String get ne => 'assets/translations/ne.json';

  /// List of all assets
  List<String> get values => [en, hi, ne];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
