import 'dart:math';

import '../utils/sizing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CSConstrainedWidth extends StatelessWidget {
  final Widget child;
  final ConstrainedMaxWidth maxWidth;
  final EdgeInsets minPadding;

  factory CSConstrainedWidth.small({
    required Widget child,
    EdgeInsets? minPadding,
    Key? key,
  }) {
    return CSConstrainedWidth(
      maxWidth: ConstrainedMaxWidth.small(),
      minPadding: minPadding ?? EdgeInsets.symmetric(horizontal: Sizing.md),
      key: key,
      child: child,
    );
  }

  factory CSConstrainedWidth.large({
    required Widget child,
    EdgeInsets? minPadding,
    Key? key,
  }) {
    return CSConstrainedWidth(
      maxWidth: ConstrainedMaxWidth.large(),
      minPadding: minPadding ?? EdgeInsets.symmetric(horizontal: Sizing.lg),
      key: key,
      child: child,
    );
  }

  const CSConstrainedWidth({
    super.key,
    required this.child,
    required this.maxWidth,
    required this.minPadding,
  });

  @override
  Widget build(BuildContext context) {
    final paddingResult = EdgeInsets.only(
      top: minPadding.top,
      bottom: minPadding.bottom,
      right: calcPadding(context, maxWidth, minPadding.right),
      left: calcPadding(context, maxWidth, minPadding.left),
    );

    return Padding(padding: paddingResult, child: child);
  }

  static double calcPadding(
    BuildContext context,
    ConstrainedMaxWidth maxWidth, [
    double minPadding = 0,
  ]) {
    num size = 0;
    if (context.isTablet &&
        context.isLandscape &&
        (Get.isBottomSheetOpen ?? false)) {
      size = context.width.toInt() - 80;
    } else {
      size = maxWidth.customSize ?? maxWidth.sizeOption.value(context.isTablet);
    }

    final width = context.width;

    final padding = (width - size) / 2;
    return max(padding, minPadding);
  }

  static double calcPaddingLarge(BuildContext context) {
    return calcPadding(context, ConstrainedMaxWidth.large(), Sizing.lg);
  }
}

class ConstrainedMaxWidth {
  final ConstrainedMaxWidthOptions sizeOption;
  final num? customSize;

  ConstrainedMaxWidth._(this.sizeOption, [this.customSize]);

  factory ConstrainedMaxWidth.small() =>
      ConstrainedMaxWidth._(ConstrainedMaxWidthOptions.small);

  factory ConstrainedMaxWidth.large() =>
      ConstrainedMaxWidth._(ConstrainedMaxWidthOptions.large);

  factory ConstrainedMaxWidth.custom(num size) =>
      ConstrainedMaxWidth._(ConstrainedMaxWidthOptions.custom, size);
}

enum ConstrainedMaxWidthOptions {
  small,
  large,
  custom;

  int value([bool isTablet = false]) {
    switch (this) {
      case ConstrainedMaxWidthOptions.small:
        return isTablet ? 500 : 350;
      case ConstrainedMaxWidthOptions.large:
        return isTablet ? 900 : 700;
      case ConstrainedMaxWidthOptions.custom:
        return 0;
    }
  }
}
