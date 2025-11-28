import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants.dart';
import '../../../../shared/theme.dart';
import '../../../../shared/utils/formatter.dart';
import '../../../../shared/widgets/cs-badge.widget.dart';
import '../../../../shared/widgets/cs-card.widget.dart';
import '../../../../shared/widgets/cs-item-empty.dart';
import '../../domain/entities/Desafio.dart';
import '../bindings/QuizBinding.dart';
import '../controllers/HomeController.dart';
import 'QuizPage.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.light100,
      body: SafeArea(
        child: Column(
          children: [
            // Header com gradiente
            _buildHeader(context),
            // Card de progresso
            _buildProgressCard(context),
            // Filtros de dificuldade
            _buildDifficultyFilters(context),
            // Grid de desafios
            Expanded(child: _buildChallengesGrid(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final saudacao = _getSaudacao();
    final inicialNome = controller.nomeUsuario.isNotEmpty
        ? controller.nomeUsuario[0].toUpperCase()
        : 'U';

    return Container(
      constraints: const BoxConstraints(minHeight: 180),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ColorApp.blue600, ColorApp.blue500, ColorApp.blue400],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Spacing.lg + 6),
          bottomRight: Radius.circular(Spacing.lg + 6),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Spacing.lg - 4,
          Spacing.lg - 4,
          Spacing.lg - 4,
          Spacing.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Linha superior com avatar e ícone de notificações
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Avatar do usuário
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      inicialNome,
                      style: TextStyle(
                        fontSize: AppTheme.headlineDefault,
                        fontWeight: AppTheme.titleWeight,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Ícone de notificações
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      // TODO: Implementar notificações
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacing.md),
            // Saudação e nome
            Text(
              saudacao,
              style: TextStyle(
                fontSize: AppTheme.bodyMedium,
                fontWeight: AppTheme.labelWeight,
                fontFamily: AppTheme.fontSourceSansPro,
                color: Colors.white70,
                letterSpacing: 0.3,
                height: AppTheme.height,
              ),
            ),
            const SizedBox(height: Spacing.xs),
            Text(
              controller.nomeUsuario,
              style: TextStyle(
                fontSize: AppTheme.headlineLarge,
                fontWeight: AppTheme.headlineWeight,
                fontFamily: AppTheme.fontMargem,
                color: Colors.white,
                letterSpacing: 0.5,
                height: AppTheme.height,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSaudacao() {
    final hora = DateTime.now().hour;
    if (hora >= 5 && hora < 12) {
      return 'Bom dia';
    } else if (hora >= 12 && hora < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }

  Widget _buildProgressCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.lg - 4,
        vertical: Spacing.md,
      ),
      child: CSCard(
        borderRadius: Spacing.md - 1,
        border: true,
        colorBorder: ColorApp.light400,
        padding: const EdgeInsets.all(Spacing.md),
        title: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header com título e percentual
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      controller.isZeroData ? 'Vamos começar' : 'Bom resultado',
                      style: TextStyle(
                        fontSize: AppTheme.headlineSmall,
                        fontWeight: AppTheme.titleWeight,
                        color: ColorApp.dark900,
                        height: AppTheme.height,
                      ),
                    ),
                  ),
                  Text(
                    calcPercent(
                      (controller.progressoGeral.value * 100).toInt(),
                      100,
                    ),
                    style: TextStyle(
                      fontSize: AppTheme.headlineSmall,
                      fontWeight: AppTheme.titleWeight,
                      color: ColorApp.blue600,
                      height: AppTheme.height,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.xs),
              // Barra de progresso linear
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: ColorApp.grey300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: controller.progressoGeral.value,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [ColorApp.blue500, ColorApp.blue400],
                          ),
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: ColorApp.blue500.withOpacity(0.4),
                              blurRadius: 6,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Spacing.xs / 2),
              Text(
                controller.isZeroData
                    ? 'Complete os desafios e avance em conhecimento'
                    : 'Seu conhecimento está sendo aprimorado :)',
                style: TextStyle(
                  fontSize: AppTheme.titleSmall,
                  color: ColorApp.mid700,
                  height: AppTheme.height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyFilters(BuildContext context) {
    final dificuldades = [
      {'key': 'facil', 'label': 'Fácil', 'color': ColorApp.blue500},
      {'key': 'medio', 'label': 'Médio', 'color': ColorApp.green500},
      {'key': 'dificil', 'label': 'Difícil', 'color': ColorApp.yellow500},
      {'key': 'perito', 'label': 'Perito', 'color': ColorApp.red600},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.lg - 4,
        vertical: Spacing.md - 4,
      ),
      child: Row(
        children: dificuldades.map((dificuldade) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right:
                    dificuldades.indexOf(dificuldade) < dificuldades.length - 1
                    ? Spacing.md - 6
                    : 0,
              ),
              child: Obx(() {
                final isSelected =
                    controller.dificuldadeSelecionada.value ==
                    dificuldade['key'] as String;
                final dificuldadeColor = dificuldade['color'] as Color;
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.selecionarDificuldade(
                      dificuldade['key'] as String,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: dificuldadeColor.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: CSBadge(
                        onPressed: () => controller.selecionarDificuldade(
                          dificuldade['key'] as String,
                        ),
                        backgroundColor: isSelected
                            ? _getDifficultyBackgroundColor(
                                dificuldade['key'] as String,
                              )
                            : Colors.transparent,
                        textColor: isSelected
                            ? dificuldadeColor
                            : dificuldadeColor.withOpacity(0.8),
                        text: dificuldade['label'] as String,
                        fontSize: AppTheme.titleSmall,
                        fontWeight: isSelected
                            ? AppTheme.titleWeight
                            : AppTheme.labelWeight,
                        radius: 20,
                        paddingType: CSBadgePadding.Normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getDifficultyBackgroundColor(String dificuldade) {
    switch (dificuldade) {
      case 'facil':
        return ColorApp.blue100;
      case 'medio':
        return ColorApp.green100;
      case 'dificil':
        return ColorApp.yellow150;
      case 'perito':
        return ColorApp.red150;
      default:
        return Colors.transparent;
    }
  }

  Widget _buildChallengesGrid(BuildContext context) {
    return Obx(() {
      final desafios = controller.desafiosFiltrados;
      if (desafios.isEmpty) {
        return const CSItemEmpty(text: 'Nenhum desafio disponível');
      }
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          Spacing.lg - 4,
          Spacing.md,
          Spacing.lg - 4,
          Spacing.lg,
        ),
        child: GridView.builder(
          shrinkWrap: false,
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: Spacing.sm,
            mainAxisSpacing: Spacing.sm,
            childAspectRatio: 1.0,
          ),
          itemCount: desafios.length,
          itemBuilder: (context, index) {
            return TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 300 + (index * 50)),
              tween: Tween(begin: 0.0, end: 1.0),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Opacity(opacity: value, child: child),
                );
              },
              child: _buildChallengeCard(context, desafios[index]),
            );
          },
        ),
      );
    });
  }

  Widget _buildChallengeCard(BuildContext context, Desafio desafio) {
    final isCompleto = desafio.estaCompleto;

    return CSCard(
      borderRadius: Spacing.md - 6,
      border: true,
      colorBorder: isCompleto
          ? ColorApp.blue500.withOpacity(0.3)
          : ColorApp.light400,
      padding: const EdgeInsets.all(Spacing.sm),
      onTap: () {
        Get.to(() => const QuizPage(), binding: QuizBinding());
      },
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
      foreground: isCompleto
          ? Positioned(
              top: Spacing.xs,
              right: Spacing.xs,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: ColorApp.blue500.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(Spacing.xs + 2),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: ColorApp.blue600,
                  size: 14,
                ),
              ),
            )
          : null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header com ícone e título
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildChallengeIcon(desafio.icone),
              const SizedBox(width: Spacing.xs),
              Expanded(
                child: Text(
                  desafio.titulo,
                  style: TextStyle(
                    fontSize: AppTheme.titleSmall,
                    fontWeight: AppTheme.titleWeight,
                    color: ColorApp.dark900,
                    height: AppTheme.height,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          const SizedBox(height: Spacing.xs),
          // Informações de progresso
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Texto de progresso
              Text(
                '${desafio.progressoAtual} de ${desafio.progressoTotal}',
                style: TextStyle(
                  fontSize: AppTheme.titleXSmall,
                  color: ColorApp.mid700,
                  fontWeight: AppTheme.labelWeight,
                  height: AppTheme.height,
                ),
              ),
              // Percentual
              Text(
                calcPercent(desafio.progressoAtual, desafio.progressoTotal),
                style: TextStyle(
                  fontSize: AppTheme.titleXSmall,
                  color: isCompleto ? ColorApp.blue600 : ColorApp.mid700,
                  fontWeight: AppTheme.titleWeight,
                  height: AppTheme.height,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.xs),
          // Barra de progresso melhorada
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Stack(
              children: [
                Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: ColorApp.grey300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: desafio.percentualCompleto,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorApp.blue500, ColorApp.blue400],
                      ),
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: ColorApp.blue500.withOpacity(0.4),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
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

  Widget _buildChallengeIcon(String icone) {
    IconData iconData;
    Color iconColor;

    switch (icone) {
      case 'state_management':
        iconData = Icons.settings_applications;
        iconColor = ColorApp.blue600;
        break;
      case 'laptop':
        iconData = Icons.laptop_mac;
        iconColor = ColorApp.green500;
        break;
      case 'hierarchy':
        iconData = Icons.account_tree;
        iconColor = ColorApp.purple700;
        break;
      case 'blocks':
        iconData = Icons.widgets;
        iconColor = ColorApp.blue500;
        break;
      default:
        iconData = Icons.help_outline;
        iconColor = ColorApp.mid700;
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [iconColor.withOpacity(0.15), iconColor.withOpacity(0.08)],
        ),
        borderRadius: BorderRadius.circular(Spacing.xs + 2),
        border: Border.all(color: iconColor.withOpacity(0.2), width: 1),
      ),
      child: Icon(iconData, color: iconColor, size: 18),
    );
  }
}
