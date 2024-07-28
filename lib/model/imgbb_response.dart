class ImgbbResponse {
  final String id;
  final String title;
  final String fileName;
  final String mime;
  final String extension;
  final String thumbnailUrl;
  final String mediumUrl;
  final int width;
  final int height;
  final int size;
  final int time;
  final int expiration;
  final String url;
  final String displayUrl;
  final String deleteUrl;

  ImgbbResponse(
      {required this.id,
      required this.title,
      required this.width,
      required this.height,
      required this.size,
      required this.time,
      required this.expiration,
      required this.fileName,
      required this.mime,
      required this.extension,
      required this.thumbnailUrl,
      required this.mediumUrl,
      required this.url,
      required this.displayUrl,
      required this.deleteUrl});

  factory ImgbbResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return ImgbbResponse(
      id: data['id'],
      title: data['title'],
      width: data['width'],
      height: data['height'],
      size: data['size'],
      time: data['time'],
      expiration: data['expiration'],
      fileName: data['image']['filename'],
      mime: data['image']['mime'],
      extension: data['image']['extension'],
      thumbnailUrl: data['thumb']['url'],
      mediumUrl: data['medium']['url'],
      url: data['url'],
      displayUrl: data['display_url'],
      deleteUrl: data['delete_url'],
    );
  }

  /// Get Unique Image ID
  String getId() => id;

  /// Get Image Title
  String getTitle() => title;

  /// Get Image Dimensions (Width)
  int getWidth() => width;

  /// Get Image Dimensions (Height)
  int getHeight() => height;

  /// Get Image Size (Bytes)
  int getSize() => size;

  /// Get Upload Time (Unix timestamp)
  int getTime() => time;

  /// Get Image Expiration Time (Unix timestamp)
  int getExpiration() => expiration;

  /// Get Image File Name
  String getFileName() => fileName;

  /// Get Image MIME Type
  String getMime() => mime;

  /// Get Image File Extension
  String getExtension() => extension;

  /// Get Thumbnail Image URL (URL with thumbnail)
  String getThumbnailUrl() => thumbnailUrl;

  /// Get Medium Image URL (URL with medium size)
  String getMediumUrl() => mediumUrl;

  /// Get Direct Image URL with Maximum Size and Quality
  String getUrl() => url;

  /// Get Display Image URL (URL with thumbnail)
  String getDisplayUrl() => displayUrl;

  /// Get Delete Image URL (URL to delete image)
  String getDeleteUrl() => deleteUrl;
}
