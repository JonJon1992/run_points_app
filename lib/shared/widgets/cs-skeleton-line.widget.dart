import '../constants.dart';
import 'cs-shimer.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart'; // TODO: Adicionar pacote shimmer ao pubspec.yaml se necessário

class CSSkeletonLine extends StatelessWidget {
  final double width;
  final double? height;
  final double? radius;
  final EdgeInsets? margin;

  final baseColor = Get.isDarkMode
      ? ColorApp.black200
      : Colors.grey.shade300;
  final highlightColor = Get.isDarkMode
      ? ColorApp.black600
      : Colors.grey.shade100;
  final bgColor = Get.isDarkMode ? ColorApp.black400 : Colors.white;

  CSSkeletonLine({
    required this.width,
    this.height,
    this.radius,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 16,
      child: Get.testMode == true
          ? SizedBox()
          : Container( // TODO: Implementar shimmer quando o pacote estiver disponível
              // Shimmer.fromColors(
              //   baseColor: baseColor,
              //   highlightColor: highlightColor,
              //   child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 0),
                  color: bgColor,
                ),
                width: double.infinity,
                margin: margin,
              // ),
            ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 0),
                  color: bgColor,
                ),
                width: double.infinity,
                margin: margin,
              ),
            ),
    );
  }
}

class CSSkeletonSimple extends StatelessWidget {
  final int total;
  final double? width;

  final baseColor = Get.isDarkMode
      ? ColorApp.black200
      : Colors.grey.shade300;
  final highlightColor = Get.isDarkMode
      ? ColorApp.black600
      : Colors.grey.shade100;
  final bgColor = Get.isDarkMode ? ColorApp.black400 : Colors.white;

  CSSkeletonSimple({super.key, required this.total, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.width * 0.95,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(total, (index) {
          return Row( // TODO: Implementar shimmer quando o pacote estiver disponível
            // Shimmer.fromColors(
            //   baseColor: baseColor,
            //   highlightColor: highlightColor,
            //   child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: bgColor,
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                      Container(
                        width: context.width * 0.8,
                        height: 8.0,
                        color: bgColor,
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                      Container(
                        width: context.width * 0.4,
                        height: 8.0,
                        color: bgColor,
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                    ],
                  ),
                ),
              ],
            // ),
          );
        }),
      ),
    );
  }
}

class CSSkeletonSimpleLine extends StatelessWidget {
  final int total;
  final double? width;

  const CSSkeletonSimpleLine({super.key, required this.total, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width * 0.95,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(total, (index) {
          return CSShimmerWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 1),
                    height: 8.0,
                    color: CSShimmerWidget.bgColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
