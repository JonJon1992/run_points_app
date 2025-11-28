class OpcaoResposta {
  final String id;
  final String texto;
  final bool isCorreta;

  OpcaoResposta({
    required this.id,
    required this.texto,
    required this.isCorreta,
  });
}

class Questao {
  final String id;
  final String pergunta;
  final List<OpcaoResposta> opcoes;
  final int numeroQuestao;
  final int totalQuestoes;

  Questao({
    required this.id,
    required this.pergunta,
    required this.opcoes,
    required this.numeroQuestao,
    required this.totalQuestoes,
  });

  double get progresso => numeroQuestao / totalQuestoes;
}

