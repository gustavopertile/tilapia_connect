import 'package:flutter/material.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({super.key});

  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  final TextEditingController totalWeightController = TextEditingController();
  final TextEditingController fishCountController = TextEditingController();
  final TextEditingController feedingRateController = TextEditingController();

  double? averageWeight;
  double? biomass;
  double? requiredFeed;

  void calculate() {
    final double totalWeight = double.tryParse(totalWeightController.text) ?? 0;
    final int fishCount = int.tryParse(fishCountController.text) ?? 0;

    if (totalWeight > 0 && fishCount > 0) {
      setState(() {
        averageWeight = totalWeight / fishCount;
        biomass = averageWeight! * fishCount;
      });
    }
  }

  void calculateFeed() {
    final double feedingRate = (double.tryParse(feedingRateController.text) ?? 0) / 100;

    if (biomass != null && feedingRate > 0) {
      setState(() {
        requiredFeed = biomass! * feedingRate;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Regra dos 15 minutos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                ' - Durante uma refeição, observar o tempo necessário para o consumo da ração. Se demorar mais de 20 minutos, reduzir a quantidade de ração ofertada. Se toda ração for consumida em menos de 10 minutos, aumentar a quantidade.\n - Encontrar a quantidade de ração que os peixes são capazes de consumir em 15 minutos.\n - Prestar atenção no tamanho do grânulo, na presença de sobras e na velocidade de consumo.',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
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
                'Cálculo de Ração',
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
                controller: totalWeightController,
                decoration: InputDecoration(
                  focusColor: Colors.grey.shade800,
                  suffixIconColor: Colors.grey.shade800,
                  fillColor: Colors.grey.shade800,
                  hoverColor: Colors.grey.shade800,
                  iconColor: Colors.grey.shade800,
                  prefixIconColor: Colors.grey.shade800,
                  labelText: 'Peso Total (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: fishCountController,
                decoration: InputDecoration(
                  focusColor: Colors.grey.shade800,
                  suffixIconColor: Colors.grey.shade800,
                  fillColor: Colors.grey.shade800,
                  hoverColor: Colors.grey.shade800,
                  iconColor: Colors.grey.shade800,
                  prefixIconColor: Colors.grey.shade800,
                  labelText: 'Número de Peixes Amostrados',
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
                      onTap: calculate,
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'Calcular Peso Médio e Biomassa',
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
              if (averageWeight != null && biomass != null) ...[
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
                  'Peso Médio: ${averageWeight!.toStringAsFixed(2)} kg',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  'Biomassa: ${biomass!.toStringAsFixed(2)} kg',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: feedingRateController,
                  decoration: InputDecoration(
                    focusColor: Colors.grey.shade800,
                    suffixIconColor: Colors.grey.shade800,
                    fillColor: Colors.grey.shade800,
                    hoverColor: Colors.grey.shade800,
                    iconColor: Colors.grey.shade800,
                    prefixIconColor: Colors.grey.shade800,
                    labelText: 'Taxa de Arraçoamento (%)',
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
                        onTap: calculateFeed,
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Calcular Ração Necessária',
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
                if (requiredFeed != null) ...[
                  const SizedBox(height: 20),
                  Text(
                    'Ração Necessária: ${requiredFeed!.toStringAsFixed(2)} kg',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
