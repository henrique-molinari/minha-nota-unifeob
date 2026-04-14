import 'package:flutter/material.dart';
import '../model/score_model.dart';

class CalculatorViewModel extends ChangeNotifier {
  // --- Estado Interno: 1º Bimestre ---
  double _p1 = 0;
  double _aia1 = 0;
  double _atitudinal1 = 0;

  // --- Estado Interno: 2º Bimestre ---
  double _p2 = 0;
  double _piValidacao = 0;
  double _piApresentacao = 0;
  double _piPresenca = 0; // Novo campo
  double _aia2 = 0;
  double _atitudinal2 = 0;

  // --- Getters ---

  /// Retorna o Model processado com todos os valores atuais.
  ScoreModel get score => ScoreModel(
        p1: _p1,
        aia1: _aia1,
        atitudinal1: _atitudinal1,
        p2: _p2,
        piValidacao: _piValidacao,
        piApresentacao: _piApresentacao,
        piPresenca: _piPresenca,
        aia2: _aia2,
        atitudinal2: _atitudinal2,
      );

  /// Sugestão de distribuição para o B2 baseada nos novos pesos.
  Map<String, double> get distribuicaoIdealB2 {
    double falta = score.quantoFaltaParaPassar();
    if (falta <= 0) return {};
    
    // Razão de esforço necessária (0.0 a 1.0)
    double razao = falta / 10.0;

    return {
      'Prova 2 (P2)': 3.0 * razao,
      'Validação PI': 2.0 * razao,
      'Apresentação PI': 1.5 * razao,
      'Presença PI': 0.5 * razao,
      'AIA 2': 1.5 * razao,
      'Atitudinal 2': 1.5 * razao,
    };
  }

  // --- Métodos de Atualização (Setters) ---

  void updateP1(String value) => _update(() => _p1 = _parseValue(value));
  void updateAia1(String value) => _update(() => _aia1 = _parseValue(value));
  void updateAtitudinal1(String value) => _update(() => _atitudinal1 = _parseValue(value));

  void updateP2(String value) => _update(() => _p2 = _parseValue(value));
  void updatePiValidacao(String value) => _update(() => _piValidacao = _parseValue(value));
  void updatePiApresentacao(String value) => _update(() => _piApresentacao = _parseValue(value));
  void updatePiPresenca(String value) => _update(() => _piPresenca = _parseValue(value));
  void updateAia2(String value) => _update(() => _aia2 = _parseValue(value));
  void updateAtitudinal2(String value) => _update(() => _atitudinal2 = _parseValue(value));

  // --- Auxiliares ---

  /// Centraliza a chamada do notifyListeners para evitar repetição.
  void _update(VoidCallback action) {
    action();
    notifyListeners();
  }

  double _parseValue(String value) {
    return double.tryParse(value.replaceAll(',', '.')) ?? 0.0;
  }

  String get resultMessage => score.isApproved 
      ? "Você está Aprovado! 🎉" 
      : "Você está de Recuperação. 📝";

  Color get statusColor => score.isApproved ? Colors.green : Colors.red;
}