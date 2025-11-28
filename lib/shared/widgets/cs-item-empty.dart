import '../constants.dart';
import 'cs-constrained-width.widget.dart';
import 'cs-spacing.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CSItemEmpty extends StatelessWidget {
  final String text;

  const CSItemEmpty({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(text, style: context.textTheme.bodyLarge),
          Padding(padding: const EdgeInsets.symmetric(vertical: 20)),
        ],
      ),
    );
  }
}

class CSItemEmptyRow extends StatelessWidget {
  final String text;

  const CSItemEmptyRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.isDarkMode
                  ? ColorApp.dark500
                  : ColorApp.mid1000,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
