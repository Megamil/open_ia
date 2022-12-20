import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/constants_urls.dart';
import '../../helpers/secure_print.dart';
import '../models/api_request_model.dart';
import '../models/api_response_model.dart';

abstract class IGDataSource {
  Future<String> generateImage(String input);
}

class IGDataSourceImpl implements IGDataSource {
  final String _apiKey;
  final Uri _apiUrl = Uri.parse(ConstantsUrls.apiUrl);

  IGDataSourceImpl(this._apiKey);

  @override
  Future<String> generateImage(String input) async {

    final apiRequest = ApiRequest(
      size: '1024x1024',
      prompt: input,
      numImages: 1,
      responseFormat: 'url',
    );

    SecurePrint.log(apiRequest.toString());

    final response = await http.post(
      _apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: apiRequest.toJson(),
    );

    if (response.statusCode == 200) {
      final responseJson = ApiResponse.fromJson(json.decode(response.body));
      SecurePrint.log(responseJson.data.toString());
      return responseJson.data.first.url;
    } else {
      throw Exception('Failed to generate image');
    }

  }

}