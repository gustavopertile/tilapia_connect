import 'package:flutter/material.dart';

class WaterManagementPage extends StatelessWidget {
  const WaterManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Manejo da Água',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'A qualidade da água é crucial para a saúde e o crescimento das tilápias. Um bom manejo da água envolve a manutenção de parâmetros adequados e a prevenção de contaminações.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text(
                '1. Parâmetros de Qualidade da Água',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Os principais parâmetros de qualidade da água que devem ser monitorados incluem pH, temperatura, oxigênio dissolvido, amônia, nitrito e nitrato. Manter esses parâmetros dentro dos limites ideais é essencial para a saúde dos peixes.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              Center(
                child: Table(
                  border: TableBorder.all(color: Colors.black, width: 1),
                  defaultColumnWidth: const FixedColumnWidth(120.0),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Parâmetro', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Ideal', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Frequência', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    buildTableRow('Temperatura', '26–28°C', 'Diária'),
                    buildTableRow('Oxigênio dissolvido', '3–6 mg por litro', 'Diária'),
                    buildTableRow('pH', '6–9', 'Diária'),
                    buildTableRow('Alcalinidade total', '>20 mg por litro', 'Semanal'),
                    buildTableRow('Transparência', '>50 cm', 'Diária'),
                    buildTableRow('Sólidos suspensos', '<30 mg', 'Semanal'),
                    buildTableRow('Fósforo total', '<0,5 mg por litro', 'Mensal'),
                    buildTableRow('Fósforo solúvel', '<0,05 mg por litro', 'Mensal'),
                    buildTableRow('Nitrogênio total', '<5–6 mg por litro', 'Mensal'),
                    buildTableRow('Nitrogênio amoniacal', '<2–3 mg por litro', 'Mensal'),
                    buildTableRow('Amônia', '<0,5 mg por litro', 'Semanal'),
                    buildTableRow('Nitrito', '<0,5 mg por litro', 'Semanal'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '2. Troca de Água',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'A troca regular de água ajuda a remover resíduos acumulados e a manter a qualidade da água. A frequência e a quantidade de água trocada dependem do sistema de criação e da densidade de peixes no tanque.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text(
                '3. Sistemas de Filtragem',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'O uso de sistemas de filtragem biológica e mecânica pode ajudar a manter a qualidade da água, removendo sólidos suspensos e decompondo resíduos orgânicos. Sistemas de recirculação de água são particularmente eficazes em operações de criação intensiva.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text(
                '4. Aeração',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'A aeração adequada é essencial para manter níveis adequados de oxigênio dissolvido, especialmente em sistemas de alta densidade. O uso de aeradores ou injetores de oxigênio pode ajudar a prevenir a hipoxia e melhorar a saúde dos peixes.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildTableRow(String parameter, String ideal, String frequency) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(parameter),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ideal),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(frequency),
        ),
      ],
    );
  }
}
