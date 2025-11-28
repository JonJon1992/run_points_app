import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/SplashController.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(
                0xFF34C759,
              ), // Verde esmeralda vibrante no topo esquerdo
              const Color(0xFF7B68EE), // Roxo periwinkle no centro
              const Color(0xFF8A78F0), // Roxo lavanda
              const Color(
                0xFF34C759,
              ), // Verde esmeralda vibrante no canto inferior direito
            ],
            stops: const [0.0, 0.4, 0.6, 1.0],
          ),
        ),
        child: Obx(
          () => SafeArea(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 48,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.title.value,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade800,
                        letterSpacing: 2,
                        fontFamily: 'Margem',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
