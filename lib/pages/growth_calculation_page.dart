import 'package:flutter/material.dart';

class GrowthCalculationPage extends StatefulWidget {
  const GrowthCalculationPage({super.key});

  @override
  _GrowthCalculationPageState createState() => _GrowthCalculationPageState();
}

class _GrowthCalculationPageState extends State<GrowthCalculationPage> {
  final TextEditingController initialBiomassController = TextEditingController();
  final TextEditingController finalBiomassController = TextEditingController();
  final TextEditingController timeIntervalController = TextEditingController();

  double? growthRate;

  void calculateGrowth() {
    final double initialBiomass = double.tryParse(initialBiomassController.text) ?? 0;
    final double finalBiomass = double.tryParse(finalBiomassController.text) ?? 0;
    final int timeInterval = int.tryParse(timeIntervalController.text) ?? 0;

    if (initialBiomass > 0 && finalBiomass > 0 && timeInterval > 0) {
      setState(() {
        growthRate = (finalBiomass - initialBiomass) / timeInterval;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cálculo de Crescimento',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Insira os dados:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: initialBiomassController,
                decoration: InputDecoration(
                  labelText: 'Biomassa Inicial (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: finalBiomassController,
                decoration: InputDecoration(
                  labelText: 'Biomassa Final (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: timeIntervalController,
                decoration: InputDecoration(
                  labelText: 'Intervalo de Tempo (dias)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Ink(
                    width: width * .85,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.cyan[800],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: InkWell(
                      onTap: calculateGrowth,
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'Calcular Crescimento',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (growthRate != null) ...[
                const SizedBox(height: 20),
                Text(
                  'Resultados:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Taxa de Crescimento: ${growthRate!.toStringAsFixed(2)} kg/dia',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
