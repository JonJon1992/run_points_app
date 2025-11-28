import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/theme.dart';
import '../controllers/QuizController.dart';

class QuizFeedbackPage extends GetView<QuizController> {
  final bool acertou;
  final String respostaCorreta;

  const QuizFeedbackPage({
    super.key,
    required this.acertou,
    required this.respostaCorreta,
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
                // Ícone (check verde ou X vermelho)
                _buildIcon(),
                const SizedBox(height: Spacing.xl + Spacing.md),
                // Título ("Acertou!" ou "Errou :/")
                Text(
                  acertou ? 'Acertou!' : 'Errou :/',
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
                // Descrição da resposta
                SizedBox(
                  width: 257,
                  child: Text(
                    respostaCorreta,
                    style: TextStyle(
                      fontSize: AppTheme.bodyMedium,
                      fontWeight: acertou
                          ? AppTheme.titleWeight
                          : AppTheme.labelWeight,
                      fontFamily: AppTheme.fontSourceSansPro,
                      color: ColorApp.quizTextOption,
                      height: 1.67, // 25px / 15px
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: Spacing.xxxl + Spacing.lg),
                // Botão Avançar
                SizedBox(
                  width: 164,
                  height: 48,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        // TODO: Implementar lógica de avançar
                        Get.back();
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorApp.quizPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Avançar',
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
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (acertou) {
      // Ícone de check verde
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: ColorApp.quizGreen, width: 3),
        ),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorApp.quizGreen,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 50),
        ),
      );
    } else {
      // Ícone de X vermelho
      return Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: ColorApp.quizError, width: 3),
        ),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.close, color: ColorApp.quizError, size: 60),
        ),
      );
    }
  }
}
