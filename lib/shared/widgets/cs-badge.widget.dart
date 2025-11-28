
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';
import 'cs-spacing.widget.dart';

class CSBadge extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color? iconColor;
  final IconData? icon;
  final String text;
  final bool showIcon;
  final CSBadgePadding paddingType;
  final double fontSize;
  final FontWeight fontWeight;
  final double radius;
  final double? width;

  const CSBadge({
    super.key,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.iconColor,
    this.icon,
    this.showIcon = false,
    this.paddingType = CSBadgePadding.Normal,
    this.fontSize = AppTheme.labelSmall,
    this.fontWeight = FontWeight.w600,
    this.radius = 3,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: text.length <= 2 ? 24 : 22,
        width: width ?? (text.length <= 2 ? 26 : null),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: _padding(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: fontSize,
                color: textColor,
                fontWeight: fontWeight,
              ),
            ),
            if (showIcon) ...[
              SpacingW.custom(6),
              Icon(icon, color: iconColor, size: 12),
            ],
          ],
        ),
      ),
    );
  }

  EdgeInsets _padding() {
    switch (paddingType) {
      case CSBadgePadding.Small:
        return const EdgeInsets.all(4);
      default:
        return const EdgeInsets.symmetric(vertical: 3, horizontal: 6);
    }
  }
}

enum CSBadgePadding { Small, Normal, Large }
