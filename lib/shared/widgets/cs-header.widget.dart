import '../utils/sizing.dart';
import 'cs-constrained-width.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CSHeader extends StatelessWidget {
  final List<Widget> body;
  final Widget title;
  final List<Widget>? actions;
  final bool? disableBanner;
  final void Function()? onTap;
  final EdgeInsets? customPadding;

  const CSHeader({
    super.key,
    required this.body,
    required this.title,
    this.actions,
    this.disableBanner,
    this.onTap,
    this.customPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (disableBanner != true)
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              maxHeight: context.isPhone && context.isLandscape ? 75 : 100,
            ),
            child: Image.asset(
              context.isDarkMode
                  ? 'assets/images/bg-top-dark.png'
                  : 'assets/images/bg-top-light.png',
              fit: BoxFit.fill,
            ),
          ),
        SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CSConstrainedWidth.large(
                minPadding:
                    customPadding ??
                    EdgeInsets.only(
                      top: Sizing.md,
                      left: Sizing.lg,
                      right: Sizing.lg,
                      bottom: Sizing.md,
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: title),
                    if (actions != null) ...actions!,
                  ],
                ),
              ),
              ...body,
            ],
          ),
        ),
      ],
    );
  }
}
