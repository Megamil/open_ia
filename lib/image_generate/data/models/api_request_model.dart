import 'dart:convert';

class ApiRequest {
  ApiRequest({
    required this.size,
    required this.prompt,
    required this.numImages,
    required this.responseFormat,
  });

  final String size;
  final String prompt;
  final int numImages;
  final String responseFormat;

  String toJson() {
    return json.encode({
      'size': size,
      'prompt': prompt,
      'num_images': numImages,
      'response_format': responseFormat,
    });
  }
}