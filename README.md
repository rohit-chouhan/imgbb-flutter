A Dart package for uploading images to ImgBB. This package supports uploading images via URL, file, and base64 data with proper error handling.

### Upload via URL

```dart
var res = await uploader.uploadImageUrl(
    imageUrl: 'https://example.com/example.jpg',
    name: 'example',
    expiration: 600
);
```

`imageUrl`: Direct public url
`name`: Name of file
`expiration`: Image expiry time in seconds

### Upload via File

```dart
var res = await uploader.uploadImageFile(
    imageFile: File('test/imgbb.png'),
    name: 'example',
    expiration: 600
);
```

`imageFile`: Local file path
`name`: Name of file
`expiration`: Image expiry time in seconds

### Upload via Base64

```dart
var res = await uploader.uploadImageBase64(
    base64Image: '64XF//5600XRI==',
    name: 'example',
    expiration: 600
);
```

`base64Image`: Base64 encoded image string
`name`: Name of file
`expiration`: Image expiry time in seconds

### Getter

Please find out all get method in [Example](https://pub.dev/packages/imgbb/example)

# Report bugs or issues

You are welcome to open a _[ticket](https://github.com/rohit-chouhan/imgbb-flutter/issues)_ on github if any problems arise. New ideas are always welcome.

# Copyright and License

> Copyright © 2024 **[Rohit Chouhan](https://rohitchouhan.com)**. Licensed under the _[MIT LICENSE](https://github.com/rohit-chouhan/imgbb-flutter/blob/main/LICENSE)_.

> All copyright reserved to imgbb.com
