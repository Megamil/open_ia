class ApiResponse {
  ApiResponse({
    required this.created,
    required this.data,
  });

  final int created;
  final List<ApiResponseData> data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      created: json['created'] as int,
      data: (json['data'] as List).map((e) => ApiResponseData.fromJson(e)).toList(),
    );
  }
}

class ApiResponseData {
  ApiResponseData({
    required this.url,
  });

  final String url;

  factory ApiResponseData.fromJson(Map<String, dynamic> json) {
    return ApiResponseData(
      url: json['url'] as String,
    );
  }
}
