import 'package:get/get.dart';

import '../../domain/entities/Questao.dart';
import '../pages/QuizFeedbackPage.dart';
import '../pages/QuizCompletionPage.dart';

class QuizController extends GetxController {
  final Rx<Questao?> questaoAtual = Rx<Questao?>(null);
  final RxString opcaoSelecionada = ''.obs;
  final RxInt questaoAtualIndex = 0.obs;

  // Dados mockados para demonstração
  final List<Questao> questoes = [
    Questao(
      id: '1',
      pergunta: 'O que o Flutter faz em sua\ntotalidade?',
      numeroQuestao: 4,
      totalQuestoes: 10,
      opcoes: [
        OpcaoResposta(
          id: '1',
          texto: 'Kit de desenvolvimento de\ninterface de usuário',
          isCorreta: false,
        ),
        OpcaoResposta(
          id: '2',
          texto: 'Possibilita a criação de aplicativos\ncompilados nativamente',
          isCorreta: true,
        ),
        OpcaoResposta(
          id: '3',
          texto: 'Acho que é uma marca de café\ndo Himalaia',
          isCorreta: false,
        ),
        OpcaoResposta(
          id: '4',
          texto: 'Possibilita a criação de desktops\nque são muito incríveis',
          isCorreta: false,
        ),
      ],
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    carregarQuestao();
  }

  void carregarQuestao() {
    if (questoes.isNotEmpty) {
      questaoAtual.value = questoes[questaoAtualIndex.value % questoes.length];
      opcaoSelecionada.value = '';
    }
  }

  void selecionarOpcao(String opcaoId) {
    opcaoSelecionada.value = opcaoId;
  }

  void pularQuestao() {
    // TODO: Implementar lógica de pular questão
    Get.back();
  }

  void confirmarResposta() {
    if (opcaoSelecionada.value.isEmpty) {
      return;
    }

    final questao = questaoAtual.value;
    if (questao == null) return;

    // Encontrar a opção selecionada
    final opcaoSelecionadaObj = questao.opcoes.firstWhere(
      (opcao) => opcao.id == opcaoSelecionada.value,
      orElse: () => questao.opcoes.first,
    );

    // Encontrar a resposta correta
    final respostaCorreta = questao.opcoes.firstWhere(
      (opcao) => opcao.isCorreta,
      orElse: () => questao.opcoes.first,
    );

    // Navegar para a página de feedback
    Get.to(
      () => QuizFeedbackPage(
        acertou: opcaoSelecionadaObj.isCorreta,
        respostaCorreta: respostaCorreta.texto,
      ),
    );
  }

  bool isOpcaoSelecionada(String opcaoId) {
    return opcaoSelecionada.value == opcaoId;
  }

  void navegarParaConclusao({
    required String nomeDesafio,
    required int acertos,
    required int totalQuestoes,
  }) {
    Get.offAll(
      () => QuizCompletionPage(
        nomeDesafio: nomeDesafio,
        acertos: acertos,
        totalQuestoes: totalQuestoes,
      ),
    );
  }
}
