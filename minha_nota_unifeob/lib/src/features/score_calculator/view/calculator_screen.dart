import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/calculator_view_model.dart';
import '../widgets/score_input_field.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos watch para reagir às mudanças da ViewModel
    final viewModel = context.watch<CalculatorViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Cinza neutro ultra-leve
      appBar: AppBar(
        title: const Text(
          'Minha Nota UNIFEOB',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        // Fecha o teclado ao clicar fora para melhor UX
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), // Scroll suave
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cabeçalho de Resultado - Otimizado com RepaintBoundary
              RepaintBoundary(
                child: _buildResultHeader(viewModel),
              ),

              const SizedBox(height: 24),

              // Seção 1º Bimestre
              const _SectionHeader(title: '1º Bimestre (B1)', icon: Icons.looks_one),
              ScoreInputField(
                label: 'Prova 1 (P1) - Máx 7.0',
                onChanged: viewModel.updateP1,
              ),
              ScoreInputField(
                label: 'AIA 1 - Máx 1.5',
                onChanged: viewModel.updateAia1,
              ),
              ScoreInputField(
                label: 'Atitudinais 1 - Máx 1.5',
                onChanged: viewModel.updateAtitudinal1,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(thickness: 1, color: Colors.black12),
              ),

              // Seção 2º Bimestre
              const _SectionHeader(title: '2º Bimestre (B2)', icon: Icons.looks_two),
              ScoreInputField(
                label: 'Prova 2 (P2) - Máx 4.0',
                onChanged: viewModel.updateP2,
              ),
              ScoreInputField(
                label: 'Validação PI - Máx 1.5',
                onChanged: viewModel.updatePiValidacao,
              ),
              ScoreInputField(
                label: 'Apresentação PI - Máx 1.5',
                onChanged: viewModel.updatePiApresentacao,
              ),
              ScoreInputField(
                label: 'AIA 2 - Máx 1.5',
                onChanged: viewModel.updateAia2,
              ),
              ScoreInputField(
                label: 'Atitudinais 2 - Máx 1.5',
                onChanged: viewModel.updateAtitudinal2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultHeader(CalculatorViewModel viewModel) {
    final b2Necessario = viewModel.score.quantoFaltaParaPassar();
    final isPossible = b2Necessario <= 10.0;
    final average = viewModel.score.average;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A), // Dark mode para o card de destaque
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: viewModel.statusColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: viewModel.statusColor, width: 1.5),
      ),
      child: Column(
        children: [
          const Text(
            'MÉDIA SEMESTRAL',
            style: TextStyle(color: Colors.white60, fontSize: 12, letterSpacing: 2),
          ),
          const SizedBox(height: 4),
          Text(
            average.toStringAsFixed(1),
            style: const TextStyle(
              color: Colors.white, 
              fontSize: 56, 
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            viewModel.resultMessage.toUpperCase(),
            style: TextStyle(
              color: viewModel.statusColor, 
              fontSize: 14, 
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Colors.white10),
          ),
          Text(
            isPossible 
              ? 'VOCÊ PRECISA DE ${b2Necessario.toStringAsFixed(1)} NO B2'
              : 'NECESSÁRIO > 10.0 (RECUPERAÇÃO)',
            style: TextStyle(
              color: isPossible ? const Color(0xFFFFD700) : Colors.redAccent,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget privado para economizar memória e melhorar a legibilidade
class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}