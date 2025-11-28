import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpacingH extends GetResponsiveView {
  final double size;

  SpacingH._(this.size);

  factory SpacingH.xs() => SpacingH._(Spacing.xs);

  factory SpacingH.sm() => SpacingH._(Spacing.sm);

  factory SpacingH.md() => SpacingH._(Spacing.md);

  factory SpacingH.lg() => SpacingH._(Spacing.lg);

  factory SpacingH.xl() => SpacingH._(Spacing.xl);

  factory SpacingH.xxl() => SpacingH._(Spacing.xxl);

  factory SpacingH.xxxl() => SpacingH._(Spacing.xxxl);

  factory SpacingH.custom(double size) => SpacingH._(size);

  @override
  Widget phone() {
    return SizedBox(height: size);
  }

  @override
  Widget tablet() {
    return SizedBox(height: size * 1.5);
  }
}

class SpacingW extends GetResponsiveView {
  final double size;

  SpacingW._(this.size);

  factory SpacingW.xs() => SpacingW._(Spacing.xs);

  factory SpacingW.sm() => SpacingW._(Spacing.sm);

  factory SpacingW.md() => SpacingW._(Spacing.md);

  factory SpacingW.lg() => SpacingW._(Spacing.lg);

  factory SpacingW.xl() => SpacingW._(Spacing.xl);

  factory SpacingW.xxl() => SpacingW._(Spacing.xxl);

  factory SpacingW.xxxl() => SpacingW._(Spacing.xxxl);

  factory SpacingW.custom(double size) => SpacingW._(size);

  @override
  Widget phone() {
    return SizedBox(width: size);
  }

  @override
  Widget tablet() {
    return SizedBox(width: size * 1.5);
  }
}
