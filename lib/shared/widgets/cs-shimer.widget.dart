import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart'; // TODO: Adicionar pacote shimmer ao pubspec.yaml se necessário

class CSShimmerWidget extends StatelessWidget {
  const CSShimmerWidget({required this.child, super.key});

  final Widget child;

  static final bgColor = Get.isDarkMode ? ColorApp.black400 : Colors.white;

  @override
  Widget build(BuildContext context) {
    // TODO: Implementar shimmer quando o pacote estiver disponível
    // return Shimmer.fromColors(
    //   baseColor: context.isDarkMode
    //       ? ColorApp.black200
    //       : Colors.grey.shade300,
    //   highlightColor: context.isDarkMode
    //       ? ColorApp.black600
    //       : Colors.grey.shade100,
    //   child: child,
    // );
    return child; // Placeholder até o pacote shimmer ser adicionado
  }
}
