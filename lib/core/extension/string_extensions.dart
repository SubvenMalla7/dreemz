import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

extension NotNullAndEmptyString on String? {
  bool isNotNullAndEmpty() {
    return this != null && this!.isNotEmpty;
  }

  toSvg({double? h, double? w, Color? color}) {
    return SvgPicture.asset(
      this!,
      height: h,
      width: w,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  toImage({double? h, double? w}) {
    return Image.asset(this!, height: h, width: w);
  }
}

extension StringExtension on String {
  String formatAmount() {
    final NumberFormat formatter = NumberFormat('#,##0', 'en_US');
    final int? parsedNumber = int.tryParse(this);

    if (parsedNumber != null) {
      return formatter.format(parsedNumber);
    } else {
      // Handle cases where the string is not a valid number
      return this;
    }
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String capitalizeAfterSpace() {
    // Split the input string by space
    List<String> words = split(' ');

    // Iterate through each word
    for (int i = 0; i < words.length; i++) {
      // Capitalize the first letter of each word
      words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1);
    }

    // Join the words back together with a space
    return words.join(' ');
  }
}

extension EmailMasking on String {
  String maskEmail() {
    if (!contains('@')) {
      // Invalid email, return as is
      return this;
    }

    // Split the email into local part and domain
    List<String> parts = split('@');
    String localPart = parts[0];
    String domain = parts[1];

    // Mask a portion of the local part with asterisks
    String maskedLocalPart = localPart.length > 2
        ? localPart.substring(0, 2) + '*' * (localPart.length - 2)
        : localPart;

    // Return the masked email
    return '$maskedLocalPart@$domain';
  }
}
