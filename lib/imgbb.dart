library imgbb;

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:imgbb/model/imgbb_response.dart';

class Imgbb {
  final String apiKey;
  String baseUrl = 'https://api.imgbb.com/1/upload';
  String errorMessage = '';
  bool isSuccess = false;

  Imgbb(this.apiKey);

  Future<ImgbbResponse?> uploadImageUrl(
      {required String imageUrl, String? name, int? expiration}) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        body: {
          'key': apiKey,
          'image': imageUrl,
          if (name != null) 'name': name,
          if (expiration != null) 'expiration': expiration.toString(),
        },
      );
      return _handleResponse(response);
    } catch (e) {
      return null;
    }
  }

  Future<ImgbbResponse?> uploadImageFile(
      {required File imageFile, String? name, int? expiration}) async {
    try {
      final uri = Uri.parse(baseUrl).replace(queryParameters: {
        'key': apiKey,
        if (expiration != null) 'expiration': expiration.toString(),
      });
      final request = http.MultipartRequest('POST', uri);
      request.files
          .add(await http.MultipartFile.fromPath('image', imageFile.path));
      if (name != null) {
        request.fields['name'] = name;
      }

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);
      return _handleResponse(responseData);
    } catch (e) {
      print('Error uploading image via File: $e');
      return null;
    }
  }

  Future<ImgbbResponse?> uploadImageBase64(
      {required String base64Image, String? name, int? expiration}) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        body: {
          'key': apiKey,
          'image': base64Image,
          if (name != null) 'name': name,
          if (expiration != null) 'expiration': expiration.toString(),
        },
      );
      return _handleResponse(response);
    } catch (e) {
      return null;
    }
  }

  Future<ImgbbResponse?> _handleResponse(http.Response response) async {
    final jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      isSuccess = true;
      return ImgbbResponse.fromJson(jsonResponse);
    } else {
      isSuccess = false;
      errorMessage = jsonResponse['error']['message'];
    }
    return null;
  }

  /// Get Error Message if any
  String getErrorMessage() => errorMessage;

  /// Check if the request was successful
  bool isSuccessful() => isSuccess;
}
