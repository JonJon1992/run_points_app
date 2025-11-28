import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/theme.dart';
import '../controllers/QuizController.dart';

class QuizCompletionPage extends GetView<QuizController> {
  final String nomeDesafio;
  final int acertos;
  final int totalQuestoes;

  const QuizCompletionPage({
    super.key,
    required this.nomeDesafio,
    required this.acertos,
    required this.totalQuestoes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Ilustração do troféu
                _buildTrophyIllustration(),
                const SizedBox(height: Spacing.xl + Spacing.md),
                // Título "Parabéns!"
                Text(
                  'Parabéns!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTheme.fontMargem,
                    color: ColorApp.quizTextHeading,
                    height: 1.33, // 40px / 30px
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.md),
                // Descrição da conclusão
                SizedBox(
                  width: 257,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: AppTheme.bodyMedium,
                        fontWeight: AppTheme.labelWeight,
                        fontFamily: AppTheme.fontSourceSansPro,
                        color: ColorApp.quizTextOption,
                        height: 1.67, // 25px / 15px
                      ),
                      children: [
                        const TextSpan(text: 'Você concluiu\n'),
                        TextSpan(
                          text: nomeDesafio,
                          style: const TextStyle(
                            fontWeight: AppTheme.titleWeight,
                          ),
                        ),
                        TextSpan(
                          text: '\ncom $acertos de $totalQuestoes acertos.',
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                const SizedBox(height: Spacing.xl),
                // Botão Compartilhar
                SizedBox(
                  width: 240,
                  height: 48,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // TODO: Implementar lógica de compartilhar
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorApp.quizPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Compartilhar',
                            style: TextStyle(
                              fontSize: AppTheme.bodyMedium,
                              fontWeight: AppTheme.titleWeight,
                              color: Colors.white,
                              height: AppTheme.height,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.md),
                // Link Voltar ao início
                TextButton(
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
                  ),
                  child: Text(
                    'Voltar ao início',
                    style: TextStyle(
                      fontSize: AppTheme.bodyMedium,
                      fontWeight: AppTheme.titleWeight,
                      fontFamily: AppTheme.fontSourceSansPro,
                      color: ColorApp.quizTextOption,
                      height: AppTheme.height,
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.xl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrophyIllustration() {
    return Container(
      width: 257,
      height: 249,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Círculo de fundo (degradê suave)
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  ColorApp.quizPurple.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Troféu
          Container(
            width: 120,
            height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Base do troféu
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 80,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade700,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                // Corpo do troféu
                Container(
                  width: 70,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber.shade600,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorApp.quizPurple,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                // Alças do troféu
                Positioned(
                  top: 20,
                  left: -10,
                  child: Container(
                    width: 20,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: -10,
                  child: Container(
                    width: 20,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Estrelas decorativas
          Positioned(
            top: 20,
            left: 40,
            child: Icon(
              Icons.star,
              color: ColorApp.quizPurple.withOpacity(0.6),
              size: 20,
            ),
          ),
          Positioned(
            top: 40,
            right: 30,
            child: Icon(
              Icons.star,
              color: ColorApp.quizPurple.withOpacity(0.4),
              size: 16,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            child: Icon(
              Icons.star,
              color: ColorApp.quizPurple.withOpacity(0.5),
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

