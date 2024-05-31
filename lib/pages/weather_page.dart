import 'package:flutter/material.dart';
import '../controllers/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? _weatherData;
  bool _isLoadingWeather = false;

  void _fetchWeather() async {
    setState(() {
      _isLoadingWeather = true;
    });

    try {
      final weatherData = await _weatherService.fetchWeather(_controller.text);
      setState(() {
        _weatherData = weatherData;
        _isLoadingWeather = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingWeather = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao carregar clima')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima Atual'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite o nome da cidade',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _fetchWeather,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _isLoadingWeather
                ? const CircularProgressIndicator()
                : _weatherData != null
                    ? Column(
                        children: [
                          Text(
                            '${_weatherData!['name']}',
                            style: const TextStyle(fontSize: 24),
                          ),
                          Text(
                            '${_weatherData!['main']['temp']}°C',
                            style: const TextStyle(fontSize: 48),
                          ),
                          Text(
                            '${_weatherData!['weather'][0]['description']}',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      )
                    : const Text('Digite uma cidade para obter o clima'),
          ],
        ),
      ),
    );
  }
}
