import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/calculator_view_model.dart';
import '../widgets/score_input_field.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CalculatorViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Calculadora UNIFEOB'),
        centerTitle: true,
        backgroundColor: const Color(0xFF0D47A1),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cabeçalho com notas e status individuais
              RepaintBoundary(child: _buildHeader(viewModel)),
              
              const SizedBox(height: 24),
              
              const _Section(title: '1º Bimestre', icon: Icons.looks_one),
              ScoreInputField(label: 'P1 (Máx 7.0)', onChanged: viewModel.updateP1),
              ScoreInputField(label: 'AIA 1 (Máx 1.5)', onChanged: viewModel.updateAia1),
              ScoreInputField(label: 'Competência Atit. 1 (Máx 1.5)', onChanged: viewModel.updateAtitudinal1),
              
              const Divider(height: 40, thickness: 1),
              
              const _Section(title: '2º Bimestre', icon: Icons.looks_two),
              ScoreInputField(label: 'P2 (Máx 3.0)', onChanged: viewModel.updateP2),
              ScoreInputField(label: 'Validação (Máx 1.0)', onChanged: viewModel.updatePiValidacao),
              ScoreInputField(label: 'Apresentação (Máx 2.0)', onChanged: viewModel.updatePiApresentacao),
              ScoreInputField(label: 'Trabalho em Equipe (Máx 0.5)', onChanged: viewModel.updatePiEquipe),
              ScoreInputField(label: 'Vídeo Form. p/ vida (Máx 0.5)', onChanged: viewModel.updatePiVideo),
              ScoreInputField(label: 'AIA 2 (Máx 1.5)', onChanged: viewModel.updateAia2),
              ScoreInputField(label: 'Competência Atit. 2 (Máx 1.5)', onChanged: viewModel.updateAtitudinal2),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(CalculatorViewModel vm) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D47A1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: vm.semesterColor, width: 2.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          const Text(
            "MÉDIA SEMESTRAL",
            style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Text(
            vm.score.average.toStringAsFixed(1),
            style: const TextStyle(
              color: Colors.white, 
              fontSize: 54, 
              fontWeight: FontWeight.bold
            ),
          ),
          const Divider(color: Colors.white24, height: 25),
          
          _statusRow("1º Bimestre:", vm.b1Message, vm.b1Color),
          const SizedBox(height: 10),
          _statusRow("2º Bimestre:", vm.b2Message, vm.b2Color),
          const SizedBox(height: 10),
          _statusRow("Semestre:", vm.semesterMessage, vm.semesterColor, isBold: true),
        ],
      ),
    );
  }

  Widget _statusRow(String label, String status, Color color, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            status.toUpperCase(),
            style: TextStyle(
              color: color, 
              fontSize: 14, 
              fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final IconData icon;
  
  const _Section({required this.title, required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0D47A1), size: 24),
          const SizedBox(width: 10),
          Text(
            title, 
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              color: Color(0xFF263238),
            ),
          ),
        ],
      ),
    );
  }
}