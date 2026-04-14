class ScoreModel {
  // --- 1º Bimestre (B1) ---
  final double p1;
  final double aia1;
  final double atitudinal1;

  // --- 2º Bimestre (B2) - Pesos Atualizados ---
  final double p2;                // Máx 3.0
  final double piValidacao;       // Máx 1.0
  final double piApresentacao;    // Máx 2.0
  final double piEquipe;          // Máx 0.5
  final double piVideo;           // Máx 0.5
  final double aia2;              // Máx 1.5
  final double atitudinal2;       // Máx 1.5

  ScoreModel({
    this.p1 = 0, this.aia1 = 0, this.atitudinal1 = 0,
    this.p2 = 0, this.piValidacao = 0, this.piApresentacao = 0,
    this.piEquipe = 0, this.piVideo = 0, this.aia2 = 0, this.atitudinal2 = 0,
  });

  double get totalB1 => p1 + aia1 + atitudinal1;
  
  double get totalB2 => 
      p2 + piValidacao + piApresentacao + piEquipe + piVideo + aia2 + atitudinal2;

  double get average => (totalB1 + totalB2) / 2;
  bool get isApproved => average >= 7.0;

  double quantoFaltaParaPassar() {
    double b2Necessario = 14.0 - totalB1;
    return b2Necessario <= 0 ? 0 : b2Necessario;
  }
}