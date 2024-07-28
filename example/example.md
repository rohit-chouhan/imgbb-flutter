enjoy coding 😃

```dart
void main() async {
    final uploader = Imgbb('API_KEY');
    var res = await uploader.uploadImageUrl(
        imageUrl: 'https://cdn.freecodecamp.org/curriculum/cat-photo-app/relaxing-cat.jpg',
        name:'cat',
        expiration: 600);

    if (uploader.isSuccessful()) {
        print('Image ID: ${res!.getId()}');
        print('Title: ${res.getTitle()}');
        print('File Name: ${res.getFileName()}');
        print('Image URL: ${res.getUrl()}');
        print('Display URL: ${res.getDisplayUrl()}');
        print('Delete URL: ${res.getDeleteUrl()}');
        print('Thumbnail URL: ${res.getThumbnailUrl()}');
        print('Medium URL: ${res.getMediumUrl()}');
        print('Expiration: ${res.getExpiration().toString()}');
        print('Time: ${res.getTime().toString()}');
        print('Size: ${res.getSize().toString()}');
        print('Width: ${res.getWidth().toString()}');
        print('Height: ${res.getHeight().toString()}');
        print('Ext: ${res.getExtension()}');
        print('Mime: ${res.getMime()}');
    } else {
        print('Failed to upload image.: ${uploader.getErrorMessage()}');
    }
}
```
