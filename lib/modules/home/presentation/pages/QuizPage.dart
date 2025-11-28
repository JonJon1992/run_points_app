import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/theme.dart';
import '../../domain/entities/Questao.dart';
import '../controllers/QuizController.dart';

class QuizPage extends GetView<QuizController> {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.quizBackground,
      body: SafeArea(
        child: Obx(() {
          final questao = controller.questaoAtual.value;
          if (questao == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // Barra de progresso e informações
              _buildProgressSection(context, questao),
              const SizedBox(height: Spacing.xl),
              // Pergunta
              _buildPergunta(context, questao),
              const SizedBox(height: Spacing.xl),
              // Opções de resposta
              Expanded(child: _buildOpcoes(context, questao)),
              // Botões de ação
              _buildBotoesAcao(context),
              const SizedBox(height: Spacing.lg),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildProgressSection(BuildContext context, Questao questao) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Spacing.lg - 4,
        Spacing.lg,
        Spacing.lg - 4,
        Spacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Informações da questão
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão ${questao.numeroQuestao}',
                style: TextStyle(
                  fontSize: AppTheme.bodyMedium,
                  fontWeight: AppTheme.labelWeight,
                  fontFamily: AppTheme.fontSourceSansPro,
                  color: ColorApp.quizTextBody,
                  height: AppTheme.height,
                ),
              ),
              Text(
                'de ${questao.totalQuestoes}',
                style: TextStyle(
                  fontSize: AppTheme.bodyMedium,
                  fontWeight: AppTheme.labelWeight,
                  fontFamily: AppTheme.fontSourceSansPro,
                  color: ColorApp.quizTextBody,
                  height: AppTheme.height,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.md),
          // Barra de progresso
          ClipRRect(
            borderRadius: BorderRadius.circular(1),
            child: Stack(
              children: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(215, 219, 217, 1), // #d7dbd9
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: questao.progresso,
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: ColorApp.quizGreen,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPergunta(BuildContext context, Questao questao) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          questao.pergunta,
          style: TextStyle(
            fontSize: AppTheme.headlineDefault,
            fontWeight: AppTheme.titleWeight,
            fontFamily: AppTheme.fontMargem,
            color: ColorApp.quizTextHeading,
            height: 1.5, // Melhor espaçamento entre linhas
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildOpcoes(BuildContext context, Questao questao) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg - 4),
      itemCount: questao.opcoes.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: Spacing.md - 4),
      itemBuilder: (context, index) {
        final opcao = questao.opcoes[index];
        final isSelecionada = controller.isOpcaoSelecionada(opcao.id);

        return _buildOpcaoCard(context, opcao, isSelecionada);
      },
    );
  }

  Widget _buildOpcaoCard(
    BuildContext context,
    OpcaoResposta opcao,
    bool isSelecionada,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => controller.selecionarOpcao(opcao.id),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          constraints: const BoxConstraints(minHeight: 72),
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.md,
            vertical: Spacing.sm + 2,
          ),
          decoration: BoxDecoration(
            color: isSelecionada
                ? ColorApp.quizBackgroundSelected
                : Colors.white,
            border: Border.all(
              color: isSelecionada
                  ? ColorApp.quizBorderSelected
                  : ColorApp.quizBorder,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: Spacing.xs),
                  child: Text(
                    opcao.texto,
                    style: TextStyle(
                      fontSize: AppTheme.titleSmall,
                      fontWeight: isSelecionada
                          ? AppTheme.titleWeight
                          : AppTheme.labelWeight,
                      fontFamily: AppTheme.fontSourceSansPro,
                      color: isSelecionada
                          ? ColorApp.quizGreenSelected
                          : ColorApp.quizTextOption,
                      height:
                          1.54, // Melhor espaçamento entre linhas (20px / 13px)
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              _buildRadioButton(isSelecionada),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioButton(bool isSelecionada) {
    if (isSelecionada) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: ColorApp.quizGreenSelected,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 16),
      );
    }

    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorApp.quizBorder, width: 1),
      ),
    );
  }

  Widget _buildBotoesAcao(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg - 4),
      child: Row(
        children: [
          // Botão Pular
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: controller.pularQuestao,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: ColorApp.quizBorder, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Pular',
                      style: TextStyle(
                        fontSize: AppTheme.bodyMedium,
                        fontWeight: AppTheme.titleWeight,
                        fontFamily: AppTheme.fontSourceSansPro,
                        color: ColorApp.quizTextBody,
                        height: AppTheme.height,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: Spacing.md - 2),
          // Botão Confirmar
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: controller.confirmarResposta,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: ColorApp.quizGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Confirmar',
                      style: TextStyle(
                        fontSize: AppTheme.bodyMedium,
                        fontWeight: AppTheme.titleWeight,
                        fontFamily: AppTheme.fontSourceSansPro,
                        color: Colors.white,
                        height: AppTheme.height,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
