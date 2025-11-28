class Desafio {
  final String id;
  final String titulo;
  final int progressoAtual;
  final int progressoTotal;
  final String icone;
  final String dificuldade;

  Desafio({
    required this.id,
    required this.titulo,
    required this.progressoAtual,
    required this.progressoTotal,
    required this.icone,
    required this.dificuldade,
  });

  double get percentualCompleto =>
      progressoTotal > 0 ? progressoAtual / progressoTotal : 0.0;

  bool get estaCompleto => progressoAtual >= progressoTotal;
}
