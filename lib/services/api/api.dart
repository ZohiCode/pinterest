import 'package:http/http.dart' as http;
import 'api_response.dart';
import 'endpoints.dart';

class Api {
  static const String apiHost = "https://api.pexels.com/v1/";
  static String apiKey = 'yV9zqxfcNamU8W3iMmcGfBYtWhLO9Mh32JL1ygrmwQIOP6kqWMRsyzW4';

  static String getUrl(Map endpoint, List<dynamic> params) {
    String url = endpoint['url' ];
    for (var param in params) {
      url = url.replaceFirst(EndPoints.paramIdentifier, param.toString());
    }
    return apiHost + url;
  }
  static Future<Map<String, String>> getHeaders() async {
    return {
      "Authorization": " $apiKey",
    };
  }

  static send(Map endpoint, {List<dynamic> params = const []}) async {
    String url = getUrl(endpoint, params);
    Map<String, String> headers = await Api.getHeaders();
    late http.Response response;
    try {
        response = await http.get(
          Uri.parse(url),
          headers: headers,
        );
    } catch (e) {
      return ApiResponse(
        data: {},
        success: false,
        title: 'Error',
        message: 'Please  try your internet connection and try again later',
      );
    }

    return ApiResponse.fromResponse(response);
  }
}
