import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/calculator_view_model.dart';
import '../widgets/score_input_field.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Otimização: watch reconstrói apenas o necessário
    final viewModel = context.watch<CalculatorViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5), // Fundo levemente azulado/neutro
      appBar: AppBar(
        title: const Text(
          'Minha Nota UNIFEOB',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cabeçalho de Resultado com RepaintBoundary para isolar a pintura
              RepaintBoundary(
                child: _buildResultHeader(viewModel),
              ),

              const SizedBox(height: 24),

              // --- SEÇÃO 1º BIMESTRE ---
              const _SectionHeader(
                title: '1º Bimestre (B1)', 
                icon: Icons.filter_1_rounded
              ),
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

              // --- SEÇÃO 2º BIMESTRE (LOGICA ATUALIZADA) ---
              const _SectionHeader(
                title: '2º Bimestre (B2)', 
                icon: Icons.filter_2_rounded
              ),
              ScoreInputField(
                label: 'Prova 2 (P2) - Máx 3.0',
                onChanged: viewModel.updateP2,
              ),
              ScoreInputField(
                label: 'Validação PI - Máx 2.0',
                onChanged: viewModel.updatePiValidacao,
              ),
              ScoreInputField(
                label: 'Apresentação PI - Máx 1.5',
                onChanged: viewModel.updatePiApresentacao,
              ),
              ScoreInputField(
                label: 'Presença PI - Máx 0.5',
                onChanged: viewModel.updatePiPresenca,
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
    final double b2Necessario = viewModel.score.quantoFaltaParaPassar();
    final bool isPossible = b2Necessario <= 10.0;
    final double average = viewModel.score.average;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0D47A1), // Azul profundo (Tema Novo)
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: viewModel.statusColor.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: viewModel.statusColor, width: 2),
      ),
      child: Column(
        children: [
          const Text(
            'MÉDIA CALCULADA',
            style: TextStyle(color: Colors.white60, fontSize: 12, letterSpacing: 2),
          ),
          const SizedBox(height: 4),
          Text(
            average.toStringAsFixed(1),
            style: const TextStyle(
              color: Colors.white, 
              fontSize: 58, 
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            viewModel.resultMessage.toUpperCase(),
            style: TextStyle(
              color: viewModel.statusColor, 
              fontSize: 14, 
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Colors.white10),
          ),
          Text(
            isPossible 
              ? 'VOCÊ PRECISA DE ${b2Necessario.toStringAsFixed(1)} NO B2'
              : 'NECESSÁRIO > 10.0 (ESTUDE MUITO!)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isPossible ? const Color(0xFFFFD700) : Colors.redAccent,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

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
          Icon(icon, size: 22, color: Theme.of(context).primaryColor),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold, 
              color: Color(0xFF263238),
            ),
          ),
        ],
      ),
    );
  }
}