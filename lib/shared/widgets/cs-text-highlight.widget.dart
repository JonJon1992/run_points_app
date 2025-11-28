import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/sanitizer.dart';

class CSTextHighlight extends StatelessWidget {
  final String text;
  final String highlight;
  final Color? textColor;
  final Color? highlightColor;
  final double? letterSpacing;

  const CSTextHighlight({
    super.key,
    required this.text,
    required this.highlight,
    this.textColor,
    this.highlightColor,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: highlightText(
          text,
          highlight,
          context.textTheme.titleSmall?.copyWith(
            color: highlightColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: context.textTheme.headlineSmall?.copyWith(
          color: textColor,
          fontSize: context.textTheme.titleSmall?.fontSize,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }

  String highlightAux(String value) => value.toUpperCase();

  List<TextSpan> highlightText(
    String textoCompleto,
    String textoQuery,
    TextStyle? style,
  ) {
    textoCompleto = sanitizerAcento(textoCompleto);
    textoQuery = highLightContains(textoCompleto, sanitizerAcento(textoQuery));

    List<TextSpan> spans = [];
    int spanBoundary = 0;

    if (textoQuery.isNotEmpty) {
      do {
        final startIndex = highlightAux(
          textoCompleto,
        ).indexOf(highlightAux(textoQuery), spanBoundary);

        if (startIndex == -1) {
          spans.add(TextSpan(text: textoCompleto.substring(spanBoundary)));
          return spans;
        }

        if (startIndex > spanBoundary) {
          spans.add(
            TextSpan(text: textoCompleto.substring(spanBoundary, startIndex)),
          );
        }

        final endIndex = startIndex + textoQuery.length;

        final spanText = textoCompleto.substring(startIndex, endIndex);
        spans.add(TextSpan(text: spanText, style: style));

        spanBoundary = endIndex;
      } while (spanBoundary < textoCompleto.length);

      return spans;
    }

    spans.add(TextSpan(text: textoCompleto));

    return spans;
  }

  String highLightContains(String textCompleto, String query) {
    String newQuery;
    if (query.contains(' ')) {
      var parts = query.split(' ');
      String queryParts = '';
      for (var i = 0; i < parts.length; i++) {
        String espaco = ' ';
        if (i == (parts.length - 1)) {
          espaco = '';
        }
        if (highlightAux(textCompleto).contains(highlightAux(parts[i]))) {
          if (queryParts.isEmpty) {
            queryParts = parts[i] + espaco;
          } else {
            final agrupaQuery = queryParts + parts[i];
            if (highlightAux(
              textCompleto,
            ).contains(highlightAux(agrupaQuery))) {
              queryParts = agrupaQuery + espaco;
            } else {
              queryParts = parts[i];
            }
          }
        } else {
          break;
        }
      }
      newQuery = queryParts;
    } else {
      newQuery = query;
    }
    return newQuery;
  }

}
