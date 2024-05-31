import 'package:flutter/material.dart';

class WaterManagementPage extends StatelessWidget {
  const WaterManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manejo da Água'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manejo da Água',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'A qualidade da água é crucial para a saúde e o crescimento das tilápias. Um bom manejo da água envolve a manutenção de parâmetros adequados e a prevenção de contaminações.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '1. Parâmetros de Qualidade da Água',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Os principais parâmetros de qualidade da água que devem ser monitorados incluem pH, temperatura, oxigênio dissolvido, amônia, nitrito e nitrato. Manter esses parâmetros dentro dos limites ideais é essencial para a saúde dos peixes.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '2. Troca de Água',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'A troca regular de água ajuda a remover resíduos acumulados e a manter a qualidade da água. A frequência e a quantidade de água trocada dependem do sistema de criação e da densidade de peixes no tanque.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '3. Sistemas de Filtragem',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'O uso de sistemas de filtragem biológica e mecânica pode ajudar a manter a qualidade da água, removendo sólidos suspensos e decompondo resíduos orgânicos. Sistemas de recirculação de água são particularmente eficazes em operações de criação intensiva.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '4. Aeração',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'A aeração adequada é essencial para manter níveis adequados de oxigênio dissolvido, especialmente em sistemas de alta densidade. O uso de aeradores ou injetores de oxigênio pode ajudar a prevenir a hipoxia e melhorar a saúde dos peixes.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
