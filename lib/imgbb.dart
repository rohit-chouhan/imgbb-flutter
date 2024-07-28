library imgbb;

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:imgbb/model/imgbb_response.dart';

class Imgbb {
  final String _apiKey;
  final String _baseUrl = 'https://api.imgbb.com/1/upload';
  String _errorMessage = '';
  bool _isSuccess = false;

  Imgbb(this._apiKey);

  Future<ImgbbResponse?> uploadImageUrl(
      {required String imageUrl, String? name, int? expiration}) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        body: {
          'key': _apiKey,
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
      final uri = Uri.parse(_baseUrl).replace(queryParameters: {
        'key': _apiKey,
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
        Uri.parse(_baseUrl),
        body: {
          'key': _apiKey,
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
      _isSuccess = true;
      return ImgbbResponse.fromJson(jsonResponse);
    } else {
      _isSuccess = false;
      _errorMessage = jsonResponse['error']['message'];
    }
    return null;
  }

  /// Get Error Message if any
  String getErrorMessage() => _errorMessage;

  /// Check if the request was successful
  bool isSuccessful() => _isSuccess;
}
