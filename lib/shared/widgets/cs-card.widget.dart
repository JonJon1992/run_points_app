import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class CSCard extends StatelessWidget {
  final double? borderRadius;
  final double? elevation;
  final double? width;
  final double? height;
  final bool? border;
  final Widget? foreground;
  final Widget? left;
  final Widget? title;
  final Widget? footer;
  final Widget? right;
  final int? flexLeft;
  final CrossAxisAlignment leftAlignment;
  final CrossAxisAlignment rightAlignment;
  final int? flexRight;
  final int? flexTitle;
  final int? flexFooter;
  final Color? color;
  final Color? colorBorder;
  final EdgeInsets? padding;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;

  const CSCard({
    super.key,
    this.borderRadius,
    this.elevation,
    this.width,
    this.height,
    this.foreground,
    this.left,
    this.title,
    this.footer,
    this.right,
    this.border,
    this.flexLeft,
    this.flexRight,
    this.flexTitle,
    this.flexFooter,
    this.leftAlignment = CrossAxisAlignment.start,
    this.rightAlignment = CrossAxisAlignment.start,
    this.color,
    this.colorBorder,
    this.padding = EdgeInsets.zero,
    this.boxShadow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            boxShadow: boxShadow,
          ),
          child: Card(
            semanticContainer: false,
            color:
                color ??
                (context.isDarkMode
                    ? ColorApp.black400
                    : ColorApp.light0),
            margin: EdgeInsets.zero,
            elevation: elevation ?? 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              side: border == true
                  ? BorderSide(
                      color:
                          colorBorder ??
                          (context.isDarkMode
                              ? Colors.transparent
                              : ColorApp.light300),
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: width,
                height: height,
                padding: padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: leftAlignment,
                  children: [
                    if (left != null)
                      Flexible(flex: flexLeft ?? 1, child: left!),
                    if (title != null || right != null || footer != null)
                      Flexible(
                        flex: flexRight ?? 5,
                        child: Column(
                          mainAxisSize: height != null
                              ? MainAxisSize.max
                              : MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (title != null || right != null)
                              Flexible(
                                flex: flexTitle ?? 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: rightAlignment,
                                  children: [
                                    if (title != null) Expanded(child: title!),
                                    if (right != null) right!,
                                  ],
                                ),
                              ),
                            if (footer != null)
                              Flexible(flex: flexFooter ?? 1, child: footer!),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (foreground != null) foreground!,
      ],
    );
  }
}
