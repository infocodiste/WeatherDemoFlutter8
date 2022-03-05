import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:open_weather/src/api/open_weather_map_api.dart';
import 'package:open_weather/src/entities/weather/weather.dart';
import 'package:open_weather/src/repositories/api_error.dart';
import 'package:open_weather/src/repositories/http_repository.dart';

class MockHttpClient extends Mock implements http.Client {}

const encodedWeatherJsonResponse = """
{
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 16093,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
  }  
""";

final expectedWeatherFromJson = Weather(
    weatherParams: WeatherParams(
        temp: 282.55, feelLike: 281, tempMin: 280.37, tempMax: 284.26),
    weatherInfo: [
      WeatherInfo(
        description: 'clear sky',
        icon: '01d',
        main: 'Clear',
      )
    ],
    dt: 1560350645,
    name: "London");

void main() {
  test('repository with mocked http client, success', () async {
    final mockHttpClient = MockHttpClient();
    final api = OpenWeatherMapAPI('apiKey');
    final weatherRepository = HttpRepository(api: api, client: mockHttpClient);
    when(() => mockHttpClient.get(api.weather("37.39", "-122.08"))).thenAnswer(
        (_) => Future.value(http.Response(encodedWeatherJsonResponse, 200)));
    final weather =
        await weatherRepository.getWeather(lat: "37.39", lon: "-122.08");
    // expectations
    expect(weather, expectedWeatherFromJson);
  });

  test('repository with mocked http client, failure', () async {
    final mockHttpClient = MockHttpClient();
    final api = OpenWeatherMapAPI('apiKey');
    final weatherRepository = HttpRepository(api: api, client: mockHttpClient);
    when(() => mockHttpClient.get(api.weather("37.39", "-122.08")))
        .thenAnswer((_) => Future.value(http.Response('{}', 401)));
    // expectations
    expect(() => weatherRepository.getWeather(lat: "37.39", lon: "-122.08"),
        throwsA(isA<APIError>()));
  });
}
