class FileUtils {
  static String formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      double kb = bytes / 1024;
      return '${kb.toStringAsFixed(kb.truncateToDouble() == kb ? 0 : 1)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      double mb = bytes / (1024 * 1024);
      return '${mb.toStringAsFixed(mb.truncateToDouble() == mb ? 0 : 1)} MB';
    } else {
      double gb = bytes / (1024 * 1024 * 1024);
      return '${gb.toStringAsFixed(gb.truncateToDouble() == gb ? 0 : 1)} GB';
    }
  }

  static bool isLocalFile(String filePath) {
    return filePath.startsWith('/');
  }

  static String getFileExtension(String filePath) {
    final parts = filePath.split('.');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }

  static bool isImageFile(String filePath) {
    final extension = getFileExtension(filePath);
    const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    return imageExtensions.contains(extension);
  }
}
