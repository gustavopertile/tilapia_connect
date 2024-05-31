import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '3416c0bbd2a51dcd3c735ba25bb94bea'; // Substitua pela sua chave da OpenWeatherMap
  final String apiUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao carregar clima');
    }
  }
}
