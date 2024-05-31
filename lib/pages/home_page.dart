import 'package:flutter/material.dart';
import 'weather_page.dart';
import 'tilapia_summary.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tilapia App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherPage()),
                );
              },
              child: Text('Ver Clima'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TilapiaSummaryPage()),
                );
              },
              child: Text('Resumo Criação de Tilápia'),
            ),
          ],
        ),
      ),
    );
  }
}
