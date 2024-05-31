import 'package:flutter/material.dart';
import 'weather_page.dart';
import 'infos/introduction_page.dart';
import 'infos/species_selection_page.dart';
import 'infos/rearing_environment_page.dart';
import 'infos/feeding_page.dart';
import 'infos/water_management_page.dart';
import 'infos/sanitation_page.dart';
import 'infos/commercialization_page.dart';

class TilapiaSummaryPage extends StatelessWidget {
  const TilapiaSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tilapia App'),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                child: const Text('Ver Clima'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const IntroductionPage()),
                  );
                },
                child: const Text('Introdução'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpeciesSelectionPage()),
                  );
                },
                child: const Text('Seleção de Espécies'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RearingEnvironmentPage()),
                  );
                },
                child: const Text('Ambiente de Criação'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeedingPage()),
                  );
                },
                child: const Text('Alimentação'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WaterManagementPage()),
                  );
                },
                child: const Text('Manejo da Água'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SanitationPage()),
                  );
                },
                child: const Text('Sanidade'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CommercializationPage()),
                  );
                },
                child: const Text('Comercialização'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
