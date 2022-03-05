/// Uri builder class for the OpenWeatherMap API
class OpenWeatherMapAPI {
  OpenWeatherMapAPI(this.apiKey);

  final String apiKey;

  static const String _apiBaseUrl = "api.openweathermap.org";
  static const String _apiPath = "/data/2.5/";

  Uri weather(String lat, String lon) => _buildUri(
        endpoint: "weather",
        parametersBuilder: () => cityQueryParameters(lat, lon),
      );

  Uri forecast(String lat, String lon) => _buildUri(
        endpoint: "forecast",
        parametersBuilder: () => cityQueryParameters(lat, lon),
      );

  Uri historical(String lat, String lon, String time) {
    Map<String, dynamic> queryParam = cityQueryParameters(lat, lon);
    queryParam.putIfAbsent("dt", () => time);
    return _buildUri(
      endpoint: "onecall/timemachine",
      parametersBuilder: () => queryParam,
    );
  }

  Uri findNearWeather(String lat, String lon, String cnt) {
    Map<String, dynamic> queryParam = cityQueryParameters(lat, lon);
    queryParam.putIfAbsent("cnt", () => cnt);
    return _buildUri(
      endpoint: "find",
      parametersBuilder: () => queryParam,
    );
  }

  Uri _buildUri({
    required String endpoint,
    required Map<String, dynamic> Function() parametersBuilder,
  }) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoint",
      queryParameters: parametersBuilder(),
    );
  }

  Map<String, dynamic> cityQueryParameters(String lat, String lon) => {
        "lat": lat,
        "lon": lon,
        "appid": apiKey,
        "units": "metric",
      };
}
