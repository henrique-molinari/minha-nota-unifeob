import 'package:flutter/material.dart';
import '../model/score_model.dart';

class CalculatorViewModel extends ChangeNotifier {
  double _p1 = 0, _aia1 = 0, _atitudinal1 = 0;
  double _p2 = 0, _piValidacao = 0, _piApresentacao = 0;
  double _piEquipe = 0, _piVideo = 0, _aia2 = 0, _atitudinal2 = 0;
  // Status do 1º Bimestre
  bool get b1Approved => score.totalB1 >= 7.0;
  String get b1Message => b1Approved ? "Aprovado" : "Recuperação";
  Color get b1Color => b1Approved ? Colors.greenAccent : Colors.redAccent;

  // Status do 2º Bimestre
  bool get b2Approved => score.totalB2 >= 7.0;
  String get b2Message => b2Approved ? "Aprovado" : "Recuperação";
  Color get b2Color => b2Approved ? Colors.greenAccent : Colors.redAccent;

  // Status Geral do Semestre
  bool get semesterApproved => score.isApproved;
  String get semesterMessage => semesterApproved ? "Aprovado" : "Recuperação";
  Color get semesterColor =>
      semesterApproved ? Colors.greenAccent : Colors.redAccent;
  ScoreModel get score => ScoreModel(
    p1: _p1,
    aia1: _aia1,
    atitudinal1: _atitudinal1,
    p2: _p2,
    piValidacao: _piValidacao,
    piApresentacao: _piApresentacao,
    piEquipe: _piEquipe,
    piVideo: _piVideo,
    aia2: _aia2,
    atitudinal2: _atitudinal2,
  );

  Map<String, double> get distribuicaoIdealB2 {
    double falta = score.quantoFaltaParaPassar();
    if (falta <= 0) return {};
    double r = falta / 10.0;
    return {
      'Prova 2 (P2)': 3.0 * r,
      'Validação': 1.0 * r,
      'Apresentação': 2.0 * r,
      'Equipa': 0.5 * r,
      'Vídeo': 0.5 * r,
      'AIA 2': 1.5 * r,
      'Atitudinal 2': 1.5 * r,
    };
  }

  // Métodos de Update
  void updateP1(String v) => _up(() => _p1 = _parse(v));
  void updateAia1(String v) => _up(() => _aia1 = _parse(v));
  void updateAtitudinal1(String v) => _up(() => _atitudinal1 = _parse(v));
  void updateP2(String v) => _up(() => _p2 = _parse(v));
  void updatePiValidacao(String v) => _up(() => _piValidacao = _parse(v));
  void updatePiApresentacao(String v) => _up(() => _piApresentacao = _parse(v));
  void updatePiEquipe(String v) => _up(() => _piEquipe = _parse(v));
  void updatePiVideo(String v) => _up(() => _piVideo = _parse(v));
  void updateAia2(String v) => _up(() => _aia2 = _parse(v));
  void updateAtitudinal2(String v) => _up(() => _atitudinal2 = _parse(v));

  void _up(VoidCallback a) {
    a();
    notifyListeners();
  }

  double _parse(String v) => double.tryParse(v.replaceAll(',', '.')) ?? 0.0;
  String get resultMessage =>
      score.isApproved ? "Aprovado! 🎉" : "Em Recuperação 📝";
  Color get statusColor => score.isApproved ? Colors.green : Colors.red;
}
